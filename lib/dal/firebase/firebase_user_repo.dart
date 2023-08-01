import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/general.dart';
import '../../models/action_result.dart';
import '../user_repo.dart';
import 'helpers.dart';

class FirebaseUserRepo implements UserRepo {
  @override
  Future<ActionResult> updateUserInfo(String? displayName) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          message: 'User not signed in.',
        );
      }

      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);

      return ActionResult(
        success: true,
        message: 'Updated your information.',
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
        message: 'Changed password.',
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
          message: 'You\'re not signed in.',
        );
      }

      await FirebaseAuth.instance.currentUser!.delete();

      return ActionResult(
        success: true,
        message: 'Deleted account.',
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
      await FirebaseAuth.instance.currentUser?.reload();
      return ActionResult(
        success: true,
        message: 'Successfully reloaded user.',
      );
    } catch (_) {
      return genericFailureResult;
    }
  }
}
