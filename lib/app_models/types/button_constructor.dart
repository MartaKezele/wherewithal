import 'package:flutter/material.dart';

typedef ButtonConstructor = ButtonStyleButton Function({
  required Widget child,
  required void Function()? onPressed,
  ButtonStyle? style,
});
