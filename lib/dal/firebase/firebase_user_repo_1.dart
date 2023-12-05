import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../change_notifiers/auth.dart';
import '../../change_notifiers/repo_factory.dart';
import '../../config/keys/callable_clould_functions.dart';
import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../user_repo_1.dart';
import 'helpers.dart';

class FirebaseUserRepo1 extends UserRepo1 {
  FirebaseUserRepo1(super.localizations);

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

      final result = await FirebaseFunctions.instance
          .httpsCallable(CallableCloudFunctions.deleteFirestoreUserData)
          .call(
        {
          CallableCloudFunctionsParams.userDocId:
              GetIt.I<AuthChangeNotifier>().id,
        },
      );

      if (!result.data['success']) {
        return ActionResult(
          success: false,
          messageTitle: localizations.couldNotDeleteAccount,
        );
      }

      await FirebaseAuth.instance.currentUser!.delete();
      await GetIt.I<RepoFactoryChangeNotifier>().repoFactory.authRepo.signOut();

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
