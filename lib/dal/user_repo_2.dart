import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';
import '../models/models.dart' as models;

abstract class UserRepo2 {
  UserRepo2(this.localizations);
  AppLocalizations localizations;

  Future<ActionResult<models.User?>> create(String uid);

  Future<ActionResult> signOut(String uid);

  Future<ActionResult> updateNotifications({
    required String id,
    required bool recurringTransactionsNotifications,
  });
}
