import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../../l10n/app_localizations.dart';
import '../user_repo.dart';
import 'helpers.dart';

class FirebaseUserRepo implements UserRepo {
  @override
  Future<ActionResult> updateUserInfo(String? displayName) async {
    final localizations = AppLocalizations.ofCurrentContext();

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
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> updatePassword(String newPassword) async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      return ActionResult(
        success: true,
        messageTitle: localizations.changedPassword,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> deleteAccount() async {
    final localizations = AppLocalizations.ofCurrentContext();

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
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> reloadUser() async {
    final localizations = AppLocalizations.ofCurrentContext();

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
      return genericFailureResult;
    }
  }
}
