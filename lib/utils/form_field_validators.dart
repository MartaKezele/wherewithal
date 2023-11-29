import 'package:flutter/material.dart';
// TODO: replace package imports with relative imports
import 'package:wherewithal/app_models/validation_result.dart';

import '../config/password_validation.dart';
import '../l10n/app_localizations.dart';

ValidationResult _passwordValid(
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

ValidationResult _emailValid(
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

ValidationResult _requiredTextValid(
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

ValidationResult _requiredObjectValid(
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

ValidationResult _doubleValid(
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

ValidationResult _requiredDoubleValid(
  String? text,
  AppLocalizations localizations,
) {
  final requiredTextValidResult = _requiredTextValid(text, localizations);

  if (requiredTextValidResult.success == false) {
    return requiredTextValidResult;
  }

  return _doubleValid(text, localizations);
}

ValidationResult _intValid({
  String? text,
  required AppLocalizations localizations,
  int? min,
  int? max,
}) {
  if (text != null && text.isNotEmpty) {
    final number = int.tryParse(text);
    if (number == null) {
      return ValidationResult(
        success: false,
        message: localizations.numberNotValid,
      );
    }
    if (min != null && max != null && (number < min || number > max)) {
      return ValidationResult(
        success: false,
        message: localizations.intNumberIsNotWithinRange(min, max),
      );
    }
  }

  return ValidationResult(success: true);
}

ValidationResult _requiredIntValid({
  String? text,
  required AppLocalizations localizations,
  int? min,
  int? max,
}) {
  final requiredTextValidResult = _requiredTextValid(text, localizations);

  if (requiredTextValidResult.success == false) {
    return requiredTextValidResult;
  }

  return _intValid(
    text: text,
    localizations: localizations,
    min: min,
    max: max,
  );
}

ValidationResult _requiredDateTimeValid(
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

ValidationResult _requiredDateTimeRangeValid(
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
  return _emailValid(email, localizations).message;
}

String? passwordValidator(
  String? password,
  AppLocalizations localizations,
) {
  return _passwordValid(password, localizations).message;
}

String? requiredTextValidator(
  String? text,
  AppLocalizations localizations,
) {
  return _requiredTextValid(text, localizations).message;
}

String? doubleValidator(
  String? text,
  AppLocalizations localizations,
) {
  return _doubleValid(text, localizations).message;
}

String? requiredDoubleValidator(
  String? text,
  AppLocalizations localizations,
) {
  return _requiredDoubleValid(text, localizations).message;
}

String? intValidator({
  String? text,
  required AppLocalizations localizations,
  int? min,
  int? max,
}) {
  return _intValid(
    text: text,
    localizations: localizations,
    min: min,
    max: max,
  ).message;
}

String? requiredIntValidator({
  String? text,
  required AppLocalizations localizations,
  int? min,
  int? max,
}) {
  return _requiredIntValid(
    text: text,
    localizations: localizations,
    min: min,
    max: max,
  ).message;
}

String? requiredObjectValidator(
  Object? object,
  AppLocalizations localizations,
) {
  return _requiredObjectValid(object, localizations).message;
}

String? requiredDateTimeValidator(
  DateTime? dateTime,
  AppLocalizations localizations,
) {
  return _requiredDateTimeValid(
    dateTime,
    localizations,
  ).message;
}

String? requiredDateTimeRangeValidator(
  DateTimeRange? dateTimeRange,
  AppLocalizations localizations,
) {
  return _requiredDateTimeRangeValid(
    dateTimeRange,
    localizations,
  ).message;
}
