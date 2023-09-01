import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../user_repo.dart';
import 'helpers.dart';

class FirebaseUserRepo implements UserRepo {
  @override
  Future<ActionResult> updateUserInfo(String? displayName) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: 'User not signed in.',
        );
      }

      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

      return ActionResult(
        success: true,
        messageTitle: 'Updated your information.',
      );
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> updatePassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      return ActionResult(
        success: true,
        messageTitle: 'Changed password.',
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> deleteAccount() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: 'You\'re not signed in.',
        );
      }

      await FirebaseAuth.instance.currentUser!.delete();

      return ActionResult(
        success: true,
        messageTitle: 'Deleted account.',
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> reloadUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: 'You\'re not signed in',
        );
      }
      await FirebaseAuth.instance.currentUser!.reload();
      return ActionResult(
        success: true,
        messageTitle: 'Successfully reloaded user.',
      );
    } catch (_) {
      return genericFailureResult;
    }
  }
}
