import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';

abstract class UserRepo2 {
  UserRepo2(this.localizations);
  AppLocalizations localizations;

  Future<ActionResult> signOut(String uid);

  Future<ActionResult> updateNotifications({
    required String id,
    required bool recurringTransactionsNotifications,
  });
}
