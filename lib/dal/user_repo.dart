import '../models/action_result.dart';

abstract class UserRepo {
  Future<ActionResult> reloadUser();

  Future<ActionResult> updateUserInfo(String? displayName);

  Future<ActionResult> updatePassword(String newPassword);

  Future<ActionResult> deleteAccount();
}
