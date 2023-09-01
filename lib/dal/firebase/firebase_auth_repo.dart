import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../config/auth_provider.dart';
import '../../constants/general.dart';
import '../../app_models/action_result.dart';
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
    if (FirebaseAuth.instance.currentUser == null) {
      return ActionResult(
        success: false,
        messageTitle: 'You\'re not signed in',
      );
    }

    try {
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      return ActionResult(
        success: true,
        messageTitle: 'Successfully reauthenticated',
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
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        return ActionResult(
            success: false, messageTitle: 'You\'re not signed in');
      }
      await FirebaseAuth.instance.currentUser!.linkWithCredential(credential);
      return ActionResult(
        success: true,
        messageTitle: 'Successfully linked account with credentials',
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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return ActionResult(
        success: true,
        messageTitle: 'Successfully signed in',
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
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ActionResult(
        success: true,
        messageTitle: 'Successfuly created account',
      );
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> sendVerificationEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return ActionResult(
          success: false,
          messageTitle: 'Verification email could not be sent',
          messageDescription:
              'Verification email could not be sent because you\'re not signed in/your credentials are not valid.',
        );
      }

      if (user.emailVerified) {
        return ActionResult(
          success: false,
          messageTitle: 'Could not send verification email because email is already verified.',
        );
      }

      await user.sendEmailVerification();
      return ActionResult(
        success: true,
        messageTitle: 'A verification email has been sent',
        messageDescription:
            'Click on the link in the email to verify your email address.',
      );
    } catch (_) {
      return genericFailureResult;
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
          messageTitle: 'Password reset email was sent, check your inbox',
          messageDescription:
              'Didn\'t receive the email? Check your spam folder.');
    } on FirebaseAuthException catch (e) {
      return handleFirebaseAuthException(e);
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return ActionResult(
        success: true,
        messageTitle: 'Successfully signed out',
      );
    } catch (_) {
      return genericFailureResult;
    }
  }

  @override
  Future<ActionResult> continueWithGoogle() async {
    GoogleSignInAccount? googleUser;

    try {
      final googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();
      googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return ActionResult(
          success: false,
          messageTitle: 'Sign in process was aborted',
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
        messageTitle: 'Successfully signed in',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        final result = await fetchAuthProvidersForEmail(googleUser!.email);
        return ActionResult(
            success: result.success,
            messageTitle: result.success
                ? 'Account with the given email isn\'t configured to sign in with google'
                : result.messageTitle,
            messageDescription:
                'Sign in using one of the following methods: ${result.data?.join(', ')}. Once signed in you can configure sign in with google account in the profile section.');
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
      final signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      final authProviders = signInMethods
          .map((methodId) => AuthProvider.values
              .firstWhere((authProvider) => authProvider.id == methodId))
          .toList();

      if (signInMethods.isEmpty) {
        return ActionResult(
          success: false,
          messageTitle: 'Account could not be found',
        );
      }
      return ActionResult(
        success: true,
        messageTitle: 'Successfuly fetched sign in methods',
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
    final credential = await _googleAuthCredential();
    if (credential == null) {
      return ActionResult(
          success: false, messageTitle: 'Proccess aborted', show: false);
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
          success: false, messageTitle: 'Proccess aborted', show: false);
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
