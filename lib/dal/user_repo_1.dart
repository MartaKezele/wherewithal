import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';

abstract class UserRepo1 {
  UserRepo1(this.localizations);
  AppLocalizations localizations;

  Future<ActionResult> reloadUser();

  Future<ActionResult> updateUserInfo(String? displayName);

  Future<ActionResult> updatePassword(String newPassword);

  Future<ActionResult> deleteAccount();
}
