import 'package:flutter/material.dart';

import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../icon_size.dart';

const _fabButtonThemeData = FloatingActionButtonThemeData(
  iconSize: IconSize.md,
);

final lightFabThemeData = _fabButtonThemeData.copyWith(
  backgroundColor: lightColorScheme.primary,
  foregroundColor: lightColorScheme.onPrimary,
  splashColor: lightColorScheme.onPrimaryContainer,
);

final darkFabThemeData = _fabButtonThemeData.copyWith(
  backgroundColor: darkColorScheme.primary,
  foregroundColor: darkColorScheme.onPrimary,
  splashColor: darkColorScheme.onPrimaryContainer,
);

final _lightSurfaceVariantFabThemeData = _fabButtonThemeData.copyWith(
  backgroundColor: lightColorScheme.onSurfaceVariant,
  foregroundColor: lightColorScheme.surfaceVariant,
  splashColor: Colors.black,
);

final _darkSurfaceVariantFabThemeData = _fabButtonThemeData.copyWith(
  backgroundColor: darkColorScheme.onSurfaceVariant,
  foregroundColor: darkColorScheme.surfaceVariant,
  splashColor: Colors.white,
);

FloatingActionButtonThemeData surfaceVariantFabThemeData(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? _darkSurfaceVariantFabThemeData
      : _lightSurfaceVariantFabThemeData;
}
