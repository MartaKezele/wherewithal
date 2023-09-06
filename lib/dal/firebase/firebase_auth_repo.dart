import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../config/auth_provider.dart';
import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../../utils/app_localizations.dart';
import '../auth_repo.dart';
import 'helpers.dart';

class FirebaseAuthRepo implements AuthRepo {
  Future<OAuthCredential?> _googleAuthCredential() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      return GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      return null;
    }
  }

  Future<ActionResult> _reauth(
    AuthCredential credential,
  ) async {
    final localizations = AppLocalizations.ofCurrentContext();

    if (FirebaseAuth.instance.currentUser == null) {
      return ActionResult(
        success: false,
        messageTitle: localizations.notSignedIn,
      );
    }

    try {
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      return ActionResult(
        success: true,
        messageTitle: localizations.reauthenticated,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  Future<ActionResult> _linkAccountWithCredential(
    AuthCredential credential,
  ) async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.notSignedIn,
        );
      }
      await FirebaseAuth.instance.currentUser!.linkWithCredential(credential);
      return ActionResult(
        success: true,
        messageTitle: localizations.linkedAccountWithCredentials,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return ActionResult(
        success: true,
        messageTitle: localizations.signedIn,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> createAccountWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ActionResult(
        success: true,
        messageTitle: localizations.createdAccount,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> sendVerificationEmail() async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.sendingVerificationEmailErrorTitle,
          messageDescription:
              localizations.sendingVerificationEmailInvalidCredentials,
        );
      }

      if (user.emailVerified) {
        return ActionResult(
          success: false,
          messageTitle:
              localizations.sendingVerificationEmailEmailAlreadyVerified,
        );
      }

      await user.sendEmailVerification();
      return ActionResult(
        success: true,
        messageTitle: localizations.verificationEmailSent,
        messageDescription: localizations.verifyEmailInstructions,
      );
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> sendPasswordResetEmail(
    String email,
  ) async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ActionResult(
        success: true,
        messageTitle: localizations.passwordResetEmailSent,
        messageDescription: localizations.didntReceiveEmail,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> signOut() async {
    final localizations = AppLocalizations.ofCurrentContext();

    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return ActionResult(
        success: true,
        messageTitle: localizations.signedOut,
      );
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> continueWithGoogle() async {
    final localizations = AppLocalizations.ofCurrentContext();
    GoogleSignInAccount? googleUser;

    try {
      final googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();
      googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return ActionResult(
          success: false,
          messageTitle: localizations.signInProcessAborted,
          show: false,
        );
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return ActionResult(
        success: true,
        messageTitle: localizations.signedIn,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        final result = await fetchAuthProvidersForEmail(googleUser!.email);
        return ActionResult(
          success: result.success,
          messageTitle: result.success
              ? localizations.accountIsntConfiguredWithGoogle
              : result.messageTitle,
          messageDescription:
              localizations.signInUsingMethods(result.data?.join(', ')),
        );
      }
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult<dynamic>> fetchAuthProvidersForEmail(
    String email,
  ) async {
    try {
      final localizations = AppLocalizations.ofCurrentContext();

      final signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      final authProviders = signInMethods
          .map((methodId) => AuthProvider.values
              .firstWhere((authProvider) => authProvider.id == methodId))
          .toList();

      if (signInMethods.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: localizations.accountNotFound,
        );
      }
      return ActionResult(
        success: true,
        messageTitle: localizations.fetchedSignInMethods,
        data: authProviders,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> reauthWithGoogle() async {
    final localizations = AppLocalizations.ofCurrentContext();
    final credential = await _googleAuthCredential();

    if (credential == null) {
      return ActionResult(
        success: false,
        messageTitle: localizations.proccessAborted,
        show: false,
      );
    }

    return _reauth(credential);
  }

  @override
  Future<ActionResult> reauthWithPassword(String email, String password) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    return _reauth(credential);
  }

  @override
  Future<ActionResult> linkWithGoogleCredential() async {
    final localizations = AppLocalizations.ofCurrentContext();
    final credential = await _googleAuthCredential();

    if (credential == null) {
      return ActionResult(
        success: false,
        messageTitle: localizations.proccessAborted,
        show: false,
      );
    }
    return await _linkAccountWithCredential(credential);
  }

  @override
  Future<ActionResult> linkWithPasswordCredential(
    String email,
    String password,
  ) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    return await _linkAccountWithCredential(credential);
  }
}
