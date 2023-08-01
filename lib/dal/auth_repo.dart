import '../models/action_result.dart';

abstract class AuthRepo {
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
