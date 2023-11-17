import * as functions from 'firebase-functions'
import { categories } from './categories.js';
import admin from 'firebase-admin';
import {
    onDocumentUpdated,
    onDocumentDeleted,
} from 'firebase-functions/v2/firestore';
import firebase_tools from 'firebase-tools';

admin.initializeApp();

async function _createCategories(
    parentCategoryId,
    categories,
    collectionRef,
) {
    for (let index = 0; index < categories.length; index++) {
        const category = categories[index];
        collectionRef.add({
            title: category.title,
            transactionType: category.transactionType,
            categoryReason: category.categoryReason ?? null,
            parentCategoryId: parentCategoryId ?? null,
            budget: category.budget ?? null,
        }).then(async parentCategory => {
            if (category.subcategories != undefined && category.subcategories.length > 0) {
                await _createCategories(
                    parentCategory.id,
                    category.subcategories,
                    collectionRef,
                );
            }
        });
    }
}

export const onCategoryUpdate = onDocumentUpdated('/users/{userDocId}/categories/{categoryDocumentId}', (event) => {
    admin
        .firestore()
        .collection('users')
        .doc(event.params.userDocId)
        .collection('valueTransactions')
        .where('categoryId', '==', event.params.categoryDocumentId).get().then(querySnapshot => {
            if (querySnapshot.empty) {
                return null;
            } else {
                const promises = []

                querySnapshot.forEach(doc => {
                    event.data.after.title
                    promises.push(doc.ref.update({
                        categoryTitle: event.data.after.data().title,
                        categoryTransactionType: event.data.after.data().transactionType,
                        categoryReason: event.data.after.data().categoryReason,
                        parentCategoryId: event.data.after.data().parentCategoryId,
                    }));
                });

                return Promise.all(promises);
            }
        });
});

export const onCategoryDelete = onDocumentDeleted('/users/{userDocId}/categories/{categoryDocumentId}', (event) => {
    admin
        .firestore()
        .collection('users')
        .doc(event.params.userDocId)
        .collection('valueTransactions')
        .where('categoryId', '==', event.params.categoryDocumentId).get().then(querySnapshot => {
            if (querySnapshot.empty) {
                return null;
            } else {
                const promises = []

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

                return Promise.all(promises);
            }
        });
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

export const createFirestoreUser = functions.https.onCall(async (data, context) => {
    try {
        const userDoc = await admin
            .firestore()
            .collection('users').add({
                uid: data.uid,
                shouldSetUpData: true,
            });

        await _createCategories(
            null,
            categories,
            admin
                .firestore()
                .collection('users')
                .doc(userDoc.id)
                .collection('categories'),
        );

        await admin
            .firestore()
            .collection('users')
            .doc(userDoc.id)
            .update({
                shouldSetUpData: false,
            });

        return {
            success: true,
            msg: 'Created firestore user and set up data.',
        }
    } catch (error) {
        return {
            success: false,
            msg: error,
        }
    }
});


