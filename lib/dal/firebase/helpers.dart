import 'package:firebase_auth/firebase_auth.dart';

import '../../config/password.dart';
import '../../constants/general.dart';
import '../../app_models/action_result.dart';
import '../../utils/app_localizations.dart';

ActionResult handleFirebaseAuthException(FirebaseAuthException e) {
  String messageTitle;
  String? messageDescription;

  final localizations = AppLocalizations.ofCurrentContext();

  switch (e.code) {
    case 'invalid-email':
      messageTitle = localizations.invalidEmailErrorMsg;
    case 'user-disabled':
      messageTitle = localizations.userDisabledErrorMsg;
    case 'user-not-found':
      messageTitle = localizations.userNotFoundErrorMsg;
    case 'wrong-password':
      messageTitle = localizations.wrondPasswordErrorMsg;
    case 'network-request-failed':
      messageTitle = localizations.networkRequestFailedErrorMsg;
    case 'email-already-in-use':
      messageTitle = localizations.emailAlreadyInUseErrorMsg;
    case 'weak-password':
      messageTitle = localizations.weakPasswordErrorMsg(minPasswordCharacters);
    case 'invalid-credential':
      messageTitle = localizations.invalidEmailErrorMsg;
    case 'operation-not-allowed':
      messageTitle = localizations.operationNotAllowedErrorMsg;
    case 'user-mismatch':
      messageTitle = localizations.userMismatchErrorMsg;
    case 'credential-already-in-use':
      messageTitle = localizations.credentialAlreadyInUseErrorMsg;
    case 'invalid-password':
      messageTitle = localizations.invalidPasswordErrorMsg;
    case 'requires-recent-login':
      messageTitle = localizations.requiresRecentLoginErrorMsg;
    case 'too-many-requests':
      messageTitle = localizations.tooManyRequestsErrorMsg;
      messageDescription = localizations.tryAgainLater;
    default:
      return genericFailureResult;
  }

  return ActionResult(
    success: false,
    messageTitle: messageTitle,
    messageDescription: messageDescription,
  );
}
