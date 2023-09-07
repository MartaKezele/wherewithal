import 'package:flutter/widgets.dart';
// TODO: replace package imports with relative imports
import 'package:wherewithal/app_models/validation_result.dart';

import '../config/password.dart';
import '../constants/regex.dart';
import 'app_localizations.dart';

ValidationResult passwordValid(String? password) {
  final localizations = AppLocalizations.ofCurrentContext();

  if (password == null || password.isEmpty) {
    return ValidationResult(
      success: false,
      message: localizations.passwordIsRequired,
    );
  }

  if (password.characters.length < minPasswordCharacters) {
    return ValidationResult(
      success: false,
      message:
          localizations.passwordCharactersRestrictionMsg(minPasswordCharacters),
    );
  }

  return ValidationResult(success: true);
}

ValidationResult emailValid(String? email) {
  final localizations = AppLocalizations.ofCurrentContext();

  if (email == null || email.isEmpty) {
    return ValidationResult(
      success: false,
      message: localizations.emailIsRequired,
    );
  }

  if (!emailRegex.hasMatch(email)) {
    return ValidationResult(
      success: false,
      message: localizations.emailFormatIncorrect,
    );
  }

  return ValidationResult(success: true);
}

String? emailValidator(String? email) {
  return emailValid(email).message;
}

String? passwordValidator(String? password) {
  return passwordValid(password).message;
}
