import 'package:flutter/material.dart';

import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';

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
