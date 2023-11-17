import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';
import '../models/models.dart';

abstract class UserRepo2 {
  UserRepo2(this.localizations);
  AppLocalizations localizations;

  Future<ActionResult<User?>> create(String uid);

  Future<ActionResult<User?>> retrieveById(String id);

  Future<ActionResult<User?>> retrieveByUid(String uid);
}
