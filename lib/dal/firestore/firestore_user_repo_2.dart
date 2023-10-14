import 'package:cloud_firestore/cloud_firestore.dart';

import '../../app_models/action_result.dart';
import '../../constants/general.dart';
import '../user_repo_2.dart';
import '../../models/models.dart' as models;

class FirestoreUserRepo2 extends UserRepo2 {
  FirestoreUserRepo2(super.localizations);

  Future<void> _deleteValueTransactions(
    String userDocId,
    Transaction transaction,
  ) async {
    final valueTransactionsQuery =
        await models.usersRef.doc(userDocId).valueTransactions.get();

    for (final valueTransactionDoc in valueTransactionsQuery.docs) {
      valueTransactionDoc.reference.delete();
    }
  }

  Future<void> _deleteCategories(
    String userDocId,
    Transaction transaction,
  ) async {
    final categoriesQuery =
        await models.usersRef.doc(userDocId).categories.get();

    for (final categoryDoc in categoriesQuery.docs) {
      models.usersRef
          .doc(userDocId)
          .categories
          .doc(categoryDoc.id)
          .transactionDelete(transaction);
    }
  }

  @override
  Future<ActionResult<models.User?>> create(String uid) async {
    try {
      final userDocumentReference = await models.usersRef.add(
        models.User(
          id: '',
          uid: uid,
        ),
      );

      final userDocumentSnapshot = await userDocumentReference.get();
      final user = userDocumentSnapshot.data;

      if (user == null) {
        return genericFailureResult(localizations);
      }

      return ActionResult(
        success: true,
        messageTitle: localizations.createdAccount,
        data: user,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> delete(String uid) async {
    try {
      final userQuerySnapshot =
          await models.usersRef.whereUid(isEqualTo: uid).limit(1).get();

      if (userQuerySnapshot.docs.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: localizations.couldNotDeleteData,
        );
      }

      final userDocId = userQuerySnapshot.docs.first.id;

      return await FirebaseFirestore.instance
          .runTransaction((transaction) async {
        await _deleteValueTransactions(
          userDocId,
          transaction,
        );
        await _deleteCategories(
          userDocId,
          transaction,
        );

        models.usersRef
            .doc(userQuerySnapshot.docs.first.id)
            .transactionDelete(transaction);
      }).then(
        (_) => ActionResult(
          success: true,
          messageTitle: localizations.deletedAccount,
        ),
        onError: (_) {
          return genericFailureResult(localizations);
        },
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult<models.User?>> retrieveById(String id) async {
    try {
      final userSnapshot =
          await models.usersRef.whereDocumentId(isEqualTo: id).limit(1).get();

      if (userSnapshot.docs.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: localizations.userCouldNotBeFound,
        );
      }

      return ActionResult(
        success: true,
        messageTitle: localizations.retrievedUser,
        data: userSnapshot.docs.first.data,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult<models.User?>> retrieveByUid(String uid) async {
    try {
      final userSnapshot =
          await models.usersRef.whereUid(isEqualTo: uid).limit(1).get();

      if (userSnapshot.docs.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: localizations.userCouldNotBeFound,
        );
      }

      return ActionResult(
        success: true,
        messageTitle: localizations.retrievedUser,
        data: userSnapshot.docs.first.data,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }
}
