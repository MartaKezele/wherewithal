import 'package:flutter/material.dart';
import 'package:wherewithal/config/color_schemes/dark.dart';

import '../../config/color_schemes/light.dart';
import '../styles/text_button.dart';

final dialogBtnColorStyle = TextButtonStyles.surface;

final lightDialogTheme = DialogTheme(
  backgroundColor: lightColorScheme.surface,
  surfaceTintColor: lightColorScheme.onSurface,
  iconColor: lightColorScheme.onSurface,
);
final darkDialogTheme = DialogTheme(
  backgroundColor: darkColorScheme.surface,
  surfaceTintColor: darkColorScheme.onSurface,
  iconColor: darkColorScheme.onSurface,
);
