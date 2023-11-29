import 'package:cloud_functions/cloud_functions.dart';

import '../../app_models/action_result.dart';
import '../../config/keys/callable_clould_functions.dart';
import '../../constants/general.dart';
import '../user_repo_2.dart';
import '../../models/models.dart' as models;

class FirestoreUserRepo2 extends UserRepo2 {
  FirestoreUserRepo2(super.localizations);

  @override
  Future<ActionResult<models.User?>> create(String uid) async {
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable(CallableCloudFunctions.createFirestoreUser)
          .call(
        {
          CallableCloudFunctionsParams.uid: uid,
        },
      );

      if (!result.data['success']) {
        return ActionResult(
          success: false,
          messageTitle: localizations.couldNotSetUpData,
        );
      }

      return ActionResult(
        success: true,
        messageTitle: localizations.createdAccount,
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

  @override
  Future<ActionResult> signOut(String uid) async {
    try {
      final userSnapshot =
          await models.usersRef.whereUid(isEqualTo: uid).limit(1).get();

      if (userSnapshot.docs.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: localizations.userCouldNotBeFound,
        );
      }

      userSnapshot.docs.first.reference.update(
        fcmToken: null,
        fcmTokenTimestamp: DateTime.now().millisecondsSinceEpoch,
      );

      return ActionResult(
        success: true,
        messageTitle: localizations.signedOut,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> updateNotifications({
    required String id,
    required bool recurringTransactionsNotifications,
  }) async {
    try {
      await models.usersRef.doc(id).update(
            recurringTransactionsNotifications:
                recurringTransactionsNotifications,
          );
      return ActionResult(
        success: true,
        messageTitle: localizations.updatedNotificationPreferences,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }
}
