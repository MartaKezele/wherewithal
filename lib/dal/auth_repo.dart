import '../app_models/action_result.dart';
import 'repo.dart';

abstract class AuthRepo extends Repo {
  AuthRepo(super.localizations);

  Future<ActionResult> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<ActionResult> createAccountWithEmailAndPassword(
    String email,
    String password,
  );

  Future<ActionResult> continueWithGoogle();

  Future<ActionResult> sendVerificationEmail();

  Future<ActionResult> sendPasswordResetEmail(
    String email,
  );

  Future<ActionResult<dynamic>> fetchAuthProvidersForEmail(
    String email,
  );

  Future<ActionResult> signOut();

  Future<ActionResult> reauthWithGoogle();

  Future<ActionResult> reauthWithPassword(
    String email,
    String password,
  );

  Future<ActionResult> linkWithGoogleCredential();

  Future<ActionResult> linkWithPasswordCredential(
    String email,
    String password,
  );
}
