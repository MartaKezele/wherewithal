import * as functions from 'firebase-functions';
import { categories } from './categories.js';
import admin from 'firebase-admin';
import {
    onDocumentUpdated,
    onDocumentDeleted,
    onDocumentCreated,
} from 'firebase-functions/v2/firestore';
import firebase_tools from 'firebase-tools';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import { logger } from 'firebase-functions';
import parser from 'cron-parser';

admin.initializeApp();

const FCM_TOKEN_EXPIRATION_TIME = 1000 * 60 * 60 * 24 * 60; // 60 days

async function _createCategories(
    parentCategoryId,
    categories,
    collectionRef,
) {
    for (let index = 0; index < categories.length; index++) {
        const category = categories[index];
        await collectionRef.add({
            title: category.title,
            transactionType: category.transactionType,
            categoryReason: category.categoryReason ?? null,
            parentCategoryId: parentCategoryId ?? null,
        }).then(async parentCategory => {
            if (category.subcategories != undefined && category.subcategories.length > 0) {
                return await _createCategories(
                    parentCategory.id,
                    category.subcategories,
                    collectionRef,
                );
            }
        });
    }
}

export const onFirestoreUserCreate = onDocumentCreated('/users/{userDocId}', async (event) => {
    const userDocId = event.params.userDocId;
    try {
        await _createCategories(
            null,
            categories,
            admin
                .firestore()
                .collection('users')
                .doc(userDocId)
                .collection('categories'),
        );

        await admin
            .firestore()
            .collection('users')
            .doc(userDocId)
            .update({
                shouldSetUpCategories: false,
            });

        return {
            success: true,
            msg: 'Set up data.',
        };
    } catch (error) {
        return {
            success: false,
            msg: error,
        };
    }
});

export const onCategoryUpdate = onDocumentUpdated('/users/{userDocId}/categories/{categoryDocumentId}', async (event) => {
    try {
        const querySnapshot = await admin
            .firestore()
            .collection('users')
            .doc(event.params.userDocId)
            .collection('valueTransactions')
            .where('categoryId', '==', event.params.categoryDocumentId)
            .get();

        const promises = [];

        querySnapshot.forEach(doc => {
            promises.push(doc.ref.update({
                categoryTitle: event.data.after.data().title,
                categoryTransactionType: event.data.after.data().transactionType,
                categoryReason: event.data.after.data().categoryReason,
                parentCategoryId: event.data.after.data().parentCategoryId,
            }));
        });

        await Promise.all(promises);

        return {
            success: true,
            msg: 'Updated value transactions with new category data',
        };
    } catch (error) {
        return {
            success: false,
            msg: error,
        };
    }
});

export const onCategoryDelete = onDocumentDeleted('/users/{userDocId}/categories/{categoryDocumentId}', async (event) => {
    try {
        const querySnapshot = await admin
            .firestore()
            .collection('users')
            .doc(event.params.userDocId)
            .collection('valueTransactions')
            .where('categoryId', '==', event.params.categoryDocumentId)
            .get();

        if (querySnapshot.empty) {
            return null;
        } else {
            const promises = [];

            querySnapshot.forEach(doc => {
                promises.push(doc.ref.delete());
                // TODO update instead of delete
                // promises.push(doc.ref.update({
                //     categoryId: null,
                //     categoryTitle: null,
                //     categoryTransactionType: null,
                //     categoryReason: null,
                //     parentCategoryId: null,
                // }));
            });

            await Promise.all(promises);
            return {
                success: true,
                msg: 'Deleted value transactions with associated category',
            };
        }
    } catch (error) {
        return {
            success: false,
            msg: error,
        };
    }
});

export const deleteFirestoreUserData = functions.https.onCall(async (data, context) => {
    if (!(context.auth && context.auth.token)) {
        throw new functions.https.HttpsError(
            'permission-denied',
            'Must be an authenticated user to initiate delete.'
        );
    }

    try {
        await firebase_tools.firestore
            .delete(`users/${data.userDocId}`, {
                project: process.env.GCLOUD_PROJECT,
                recursive: true,
                force: true,
                token: functions.config().fb.token,
            });
        return {
            success: true,
            msg: 'Deleted account.'
        };
    } catch (error) {
        return {
            success: false,
            msg: error.toString(),
        };
    }

});

export const onFirebaseAuthUserCreate = functions.auth.user().onCreate(async (user) => {
    try {
        await admin
            .firestore()
            .collection('users')
            .doc(user.uid)
            .set({
                shouldSetUpCategories: true,
                allowRecurringTransactionsNotifications: true
            });
        return {
            success: true,
            msg: 'Created firestore user.'
        };
    } catch (error) {
        return {
            success: false,
            msg: error.toString(),
        };
    }
});

// Scheduled functions
export const recurringTransactionReminders = onSchedule('0 1 * * *', async (_) => {
    const users = (await admin
        .firestore()
        .collection('users')
        .where('allowRecurringTransactionsNotifications', '==', true)
        .get())
        .docs;

    const currentDate = new Date(Date.now());
    const yesterday = new Date(Date.now());
    yesterday.setHours(0, 0, 0, 0);
    yesterday.setDate(yesterday.getDate() - 1);

    for (let i = 0; i < users.length; i++) {
        const user = users[i];
        const fcmToken = user.data().fcmToken;
        const fcmTokenTimestamp = user.data().fcmTokenTimestamp;
        if (fcmToken != null &&
            fcmTokenTimestamp != null &&
            Date.now() - fcmTokenTimestamp <= FCM_TOKEN_EXPIRATION_TIME) {
            const recurringTransactions = (await admin
                .firestore()
                .collection('users')
                .doc(user.id)
                .collection('valueTransactions')
                .where('recurrenceInterval', '!=', null)
                .get())
                .docs;

            for (let j = 0; j < recurringTransactions.length; j++) {
                const recurringTransaction = recurringTransactions[j];
                const recurrenceInterval = recurringTransaction.data().recurrenceInterval;

                if (recurrenceInterval != '') {
                    try {
                        const interval = parser.parseExpression(
                            recurrenceInterval,
                            {
                                currentDate: yesterday,
                            }
                        );
                        const nextCronJob = interval.next();

                        if (nextCronJob.getDay() == currentDate.getDay() &&
                            nextCronJob.getMonth() == currentDate.getMonth() &&
                            nextCronJob.getFullYear() == currentDate.getFullYear()) {
                            const message = {
                                notification: {
                                    title: 'Add scheduled transaction',
                                    body: `${recurringTransaction.data().title ?? recurringTransaction.data().categoryTitle}, ${recurringTransaction.data().value}`,
                                },
                                data: {
                                    type: 'addRecurringTransaction',
                                    valueTransactionId: recurringTransaction.id,
                                },
                                token: fcmToken,
                            };

                            admin.messaging().send(message)
                                .then((response) => {
                                    logger.log(`Notification sent: ${response}`);
                                })
                                .catch((err) => {
                                    logger.log(err);
                                    if (err == 'messaging/registration-token-not-registered') {
                                        user.ref.update({
                                            fcmToken: null,
                                            fcmTokenTimestamp: null,
                                        });
                                    }
                                });
                        }
                    } catch (err) {
                        logger.error(err);
                    }
                }
            }
        }
    }
});

export const pruneTokens = onSchedule('0 0 * * *', async (_) => {
    const staleTokensResult = await admin.firestore().collection('users')
        .where('fcmTokenTimestamp', '<', Date.now() - FCM_TOKEN_EXPIRATION_TIME)
        .get();
    staleTokensResult.forEach(function (doc) {
        doc.ref.update({
            fcmToken: null,
            fcmTokenTimestamp: null,
        });
    });
});



