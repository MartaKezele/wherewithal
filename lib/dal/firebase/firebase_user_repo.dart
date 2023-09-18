import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../user_repo.dart';
import 'helpers.dart';

class FirebaseUserRepo extends UserRepo {
  FirebaseUserRepo(super.localizations);

  @override
  Future<ActionResult> updateUserInfo(String? displayName) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.notSignedIn,
        );
      }

      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

      return ActionResult(
        success: true,
        messageTitle: localizations.updatedYourInfo,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> updatePassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      return ActionResult(
        success: true,
        messageTitle: localizations.changedPassword,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> deleteAccount() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.notSignedIn,
        );
      }

      await FirebaseAuth.instance.currentUser!.delete();

      return ActionResult(
        success: true,
        messageTitle: localizations.deletedAccount,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> reloadUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.notSignedIn,
        );
      }
      await FirebaseAuth.instance.currentUser!.reload();
      return ActionResult(
        success: true,
        messageTitle: localizations.reloadedUser,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }
}
