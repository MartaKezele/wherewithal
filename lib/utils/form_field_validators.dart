import 'package:flutter/widgets.dart';
// TODO: replace package imports with relative imports
import 'package:wherewithal/app_models/validation_result.dart';

import '../config/password_validation.dart';
import '../l10n/app_localizations.dart';

ValidationResult passwordValid(
  String? password,
  AppLocalizations localizations,
) {
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

ValidationResult emailValid(
  String? email,
  AppLocalizations localizations,
) {
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

ValidationResult requiredValid(
  String? text,
  AppLocalizations localizations,
) {
  if (text == null || text.isEmpty) {
    return ValidationResult(
      success: false,
      message: localizations.valueIsRequired,
    );
  }

  return ValidationResult(success: true);
}

ValidationResult doubleValid(
  String? text,
  AppLocalizations localizations,
) {
  if (text != null && text.isNotEmpty) {
    final number = double.tryParse(text);
    if (number == null) {
      return ValidationResult(
        success: false,
        message: localizations.numberNotValid,
      );
    }
  }

  return ValidationResult(success: true);
}

String? emailValidator(
  String? email,
  AppLocalizations localizations,
) {
  return emailValid(email, localizations).message;
}

String? passwordValidator(
  String? password,
  AppLocalizations localizations,
) {
  return passwordValid(password, localizations).message;
}

String? requiredValidator(
  String? text,
  AppLocalizations localizations,
) {
  return requiredValid(text, localizations).message;
}

String? doubleValidator(
  String? text,
  AppLocalizations localizations,
) {
  return doubleValid(text, localizations).message;
}
