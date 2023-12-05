import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../change_notifiers/repo_factory.dart';
import '../../config/auth_provider.dart' as config;
import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../auth_repo.dart';
import 'helpers.dart';

// TODO: check this out: https://firebase.google.com/docs/auth/extend-with-blocking-functions?gen=2nd
class FirebaseAuthRepo extends AuthRepo {
  FirebaseAuthRepo(super.localizations);

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
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  Future<ActionResult> _linkAccountWithCredential(
    AuthCredential credential,
  ) async {
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
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
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
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> createAccountWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        return genericFailureResult(localizations);
      }

      await sendVerificationEmail();

      return ActionResult(
        success: true,
        messageTitle: localizations.createdAccount,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> sendVerificationEmail() async {
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
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ActionResult(
        success: true,
        messageTitle: localizations.passwordResetEmailSent,
        messageDescription: localizations.didntReceiveEmail,
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> signOut() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      if (uid != null) {
        GetIt.I<RepoFactoryChangeNotifier>().repoFactory.userRepo2.signOut(uid);
      }
      return ActionResult(
        success: true,
        messageTitle: localizations.signedOut,
      );
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> continueWithGoogle() async {
    GoogleSignInAccount? googleUser;

    try {
      final googleSignIn = GoogleSignIn();
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

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user == null) {
        return genericFailureResult(localizations);
      }

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
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult<dynamic>> fetchAuthProvidersForEmail(
    String email,
  ) async {
    try {
      final signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      final authProviders = signInMethods
          .map((methodId) => config.AuthProvider.values
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
      return handleFirebaseAuthException(e, localizations);
    } catch (_) {
      return genericFailureResult(localizations);
    }
  }

  @override
  Future<ActionResult> reauthWithGoogle() async {
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
