import '../../app_models/action_result.dart';
import '../../constants/general.dart';
import '../user_repo_2.dart';
import '../../models/models.dart' as models;

class FirestoreUserRepo2 extends UserRepo2 {
  FirestoreUserRepo2(super.localizations);

  @override
  Future<ActionResult<models.User?>> create(String uid) async {
    try {
      await models.usersRef.add(
        models.User(
          id: '',
          uid: uid,
        ),
      );

      return ActionResult(
        success: true,
        messageTitle: localizations.createdAccount,
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
