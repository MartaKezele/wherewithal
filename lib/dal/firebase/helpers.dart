import 'package:firebase_auth/firebase_auth.dart';

import '../../config/general.dart';
import '../../constants/general.dart';
import '../../models/action_result.dart';

ActionResult handleFirebaseAuthException(FirebaseAuthException e) {
  String message;
  switch (e.code) {
    case 'invalid-email':
      message = 'Email address is not valid.';
    case 'user-disabled':
      message = 'Account associated with the given email has been disabled.';
    case 'user-not-found':
      message = 'There is no account associated with the given email.';
    case 'wrong-password':
      message = 'The password is invalid.';
    case 'network-request-failed':
      message =
          'A network error has occured. Please check your internet connection and try again.';
    case 'email-already-in-use':
      message = 'An account with the given email address already exists.';
    case 'weak-password':
      message =
          'The password must contain at least $minPasswordCharacters characters.';
    case 'invalid-credential':
      message = 'The credential is malformed or has expired.';
    case 'operation-not-allowed':
      message =
          'We don\'t support this sign in method yet. Try using another sign in method.';
    case 'user-mismatch':
      message = 'The credential given does not correspond to the user.';
    case 'provider-already-linked':
      message = 'The authentication provider is already linked to the account.';
    case 'credential-already-in-use':
      message =
          'The account associated with the credential already exists, or is already linked to a user.';
    case 'invalid-password':
      message = 'The password is invalid.';
    case 'requires-recent-login':
      message = 'You must reauthenticate to continue.';
    default:
      return genericFailureResult;
  }

  return ActionResult(success: false, message: message);
}
