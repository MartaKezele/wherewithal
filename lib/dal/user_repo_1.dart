import '../app_models/action_result.dart';
import 'repo.dart';

abstract class UserRepo1 extends Repo {
  UserRepo1(super.localizations);

  Future<ActionResult> reloadUser();

  Future<ActionResult> updateUserInfo(String? displayName);

  Future<ActionResult> updatePassword(String newPassword);

  Future<ActionResult> deleteAccount();
}
