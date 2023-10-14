import 'package:flutter/material.dart';
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

ValidationResult requiredTextValid(
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

ValidationResult requiredObjectValid(
  Object? object,
  AppLocalizations localizations,
) {
  if (object == null) {
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

ValidationResult requiredDoubleValid(
  String? text,
  AppLocalizations localizations,
) {
  final requiredTextValidResult = requiredTextValid(text, localizations);

  if (requiredTextValidResult.success == false) {
    return requiredTextValidResult;
  }

  return doubleValid(text, localizations);
}

ValidationResult requiredDateTimeValid(
  DateTime? dateTime,
  AppLocalizations localizations,
) {
  if (dateTime == null) {
    return ValidationResult(
      success: false,
      message: localizations.valueIsRequired,
    );
  }

  return ValidationResult(success: true);
}

ValidationResult requiredDateTimeRangeValid(
  DateTimeRange? dateTimeRange,
  AppLocalizations localizations,
) {
  if (dateTimeRange == null) {
    return ValidationResult(
      success: false,
      message: localizations.valueIsRequired,
    );
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

String? requiredTextValidator(
  String? text,
  AppLocalizations localizations,
) {
  return requiredTextValid(text, localizations).message;
}

String? doubleValidator(
  String? text,
  AppLocalizations localizations,
) {
  return doubleValid(text, localizations).message;
}

String? requiredDoubleValidator(
  String? text,
  AppLocalizations localizations,
) {
  return requiredDoubleValid(text, localizations).message;
}

String? requiredObjectValidator(
  Object? object,
  AppLocalizations localizations,
) {
  return requiredObjectValid(object, localizations).message;
}

String? requiredDateTimeValidator(
  DateTime? dateTime,
  AppLocalizations localizations,
) {
  return requiredDateTimeValid(
    dateTime,
    localizations,
  ).message;
}

String? requiredDateTimeRangeValidator(
  DateTimeRange? dateTimeRange,
  AppLocalizations localizations,
) {
  return requiredDateTimeRangeValid(
    dateTimeRange,
    localizations,
  ).message;
}
