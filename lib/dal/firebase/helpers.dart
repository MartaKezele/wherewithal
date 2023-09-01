import 'package:firebase_auth/firebase_auth.dart';

import '../../config/password.dart';
import '../../constants/general.dart';
import '../../app_models/action_result.dart';

ActionResult handleFirebaseAuthException(FirebaseAuthException e) {
  String messageTitle;
  String? messageDescription;
  switch (e.code) {
    case 'invalid-email':
      messageTitle = 'Email address is not valid';
    case 'user-disabled':
      messageTitle =
          'Account associated with the given email has been disabled';
    case 'user-not-found':
      messageTitle = 'There is no account associated with the given email';
    case 'wrong-password':
      messageTitle = 'The password is invalid';
    case 'network-request-failed':
      messageTitle =
          'A network error has occured. Please check your internet connection and try again';
    case 'email-already-in-use':
      messageTitle = 'An account with the given email address already exists';
    case 'weak-password':
      messageTitle =
          'The password must contain at least $minPasswordCharacters characters';
    case 'invalid-credential':
      messageTitle = 'The credential is malformed or has expired';
    case 'operation-not-allowed':
      messageTitle =
          'We don\'t support this sign in method yet. Try using another sign in method';
    case 'user-mismatch':
      messageTitle = 'The credential given does not correspond to the user';
    case 'provider-already-linked':
      messageTitle =
          'The authentication provider is already linked to the account';
    case 'credential-already-in-use':
      messageTitle =
          'The account associated with the credential already exists, or is already linked to a user';
    case 'invalid-password':
      messageTitle = 'The password is invalid';
    case 'requires-recent-login':
      messageTitle = 'You must reauthenticate to continue';
    case 'too-many-requests':
      messageTitle = 'You\'ve made too many requests in a short amount of time';
      messageDescription = 'Please try again later.';
    default:
      return genericFailureResult;
  }

  return ActionResult(
    success: false,
    messageTitle: messageTitle,
    messageDescription: messageDescription,
  );
}
