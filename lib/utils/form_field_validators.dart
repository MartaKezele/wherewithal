import 'package:flutter/widgets.dart';

import '../config/general.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  }
  if (password.characters.length < minPasswordCharacters) {
    return 'Password must have at least $minPasswordCharacters characters.';
  }
  return null;
}
