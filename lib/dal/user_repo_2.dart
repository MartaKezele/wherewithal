
import '../app_models/action_result.dart';
import 'repo.dart';

abstract class UserRepo2 extends Repo {
  UserRepo2(super.localizations);

  Future<ActionResult> signOut(String uid);

  Future<ActionResult> updateNotifications({
    required String id,
    required bool recurringTransactionsNotifications,
  });
}
