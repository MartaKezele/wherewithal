import 'package:flutter/widgets.dart';

import '../config/password.dart';
import 'app_localizations.dart';

String? emailValidator(
  String? email,
) {
  if (email == null || email.isEmpty) {
    return AppLocalizations.ofCurrentContext().emailIsRequired;
  }
  return null;
}

String? passwordValidator(
  String? password,
) {
  if (password == null || password.isEmpty) {
    return AppLocalizations.ofCurrentContext().passwordIsRequired;
  }
  if (password.characters.length < minPasswordCharacters) {
    return AppLocalizations.ofCurrentContext()
        .passwordCharactersRestrictionMsg(minPasswordCharacters);
  }
  return null;
}
