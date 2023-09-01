import 'package:flutter/material.dart';

import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../icon_size.dart';

const _floatingActionButtonThemeData = FloatingActionButtonThemeData(
  iconSize: IconSize.md,
);

final lightFloatingActionButtonThemeData =
    _floatingActionButtonThemeData.copyWith(
  backgroundColor: lightColorScheme.primary,
  foregroundColor: lightColorScheme.onPrimary,
  splashColor: lightColorScheme.onPrimaryContainer,
);

final darkFloatingActionButtonThemeData =
    _floatingActionButtonThemeData.copyWith(
  backgroundColor: darkColorScheme.primary,
  foregroundColor: darkColorScheme.onPrimary,
  splashColor: darkColorScheme.onPrimaryContainer,
);
