import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../../utils/style.dart';
import 'opacity.dart';

class OutlinedButtonStyles {
  static final _darkPrimary = ColorStyle(
    foregroundColor: darkColorScheme.onPrimaryContainer,
    disabledForegroundColor: darkColorScheme.onPrimaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        darkColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkSecondary = ColorStyle(
    foregroundColor: darkColorScheme.onSecondaryContainer,
    disabledForegroundColor: darkColorScheme.onSecondaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        darkColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkInverseSurface = ColorStyle(
    foregroundColor: darkColorScheme.inverseSurface,
    disabledForegroundColor:
        darkColorScheme.inverseSurface.withOpacity(disabledForegroundOpacity),
    overlayColor: darkColorScheme.inverseSurface.withOpacity(overlayOpacity),
  );

  static final _darkSurface = ColorStyle(
    foregroundColor: darkColorScheme.onSurface,
    disabledForegroundColor:
        darkColorScheme.onSurface.withOpacity(disabledForegroundOpacity),
    overlayColor: darkColorScheme.onSurface.withOpacity(overlayOpacity),
  );

  static final _darkError = ColorStyle(
    foregroundColor: darkColorScheme.onErrorContainer,
    disabledForegroundColor:
        darkColorScheme.onErrorContainer.withOpacity(disabledForegroundOpacity),
    overlayColor: darkColorScheme.onErrorContainer.withOpacity(overlayOpacity),
  );

  static final _darkSuccess = ColorStyle(
    foregroundColor: darkColorScheme.onTertiaryContainer,
    disabledForegroundColor: darkColorScheme.onTertiaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        darkColorScheme.onTertiaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightPrimary = ColorStyle(
    foregroundColor: lightColorScheme.onPrimaryContainer,
    disabledForegroundColor: lightColorScheme.onPrimaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        lightColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightSecondary = ColorStyle(
    foregroundColor: lightColorScheme.onSecondaryContainer,
    disabledForegroundColor: lightColorScheme.onSecondaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        lightColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightInverseSurface = ColorStyle(
    foregroundColor: lightColorScheme.inverseSurface,
    disabledForegroundColor:
        lightColorScheme.inverseSurface.withOpacity(disabledForegroundOpacity),
    overlayColor: lightColorScheme.inverseSurface.withOpacity(overlayOpacity),
  );

  static final _lightSurface = ColorStyle(
    foregroundColor: lightColorScheme.onSurface,
    disabledForegroundColor:
        lightColorScheme.onSurface.withOpacity(disabledForegroundOpacity),
    overlayColor: lightColorScheme.onSurface.withOpacity(overlayOpacity),
  );

  static final _lightError = ColorStyle(
    foregroundColor: lightColorScheme.onErrorContainer,
    disabledForegroundColor: lightColorScheme.onErrorContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor: lightColorScheme.onErrorContainer.withOpacity(overlayOpacity),
  );

  static final _lightSuccess = ColorStyle(
    foregroundColor: lightColorScheme.onTertiaryContainer,
    disabledForegroundColor: lightColorScheme.onTertiaryContainer
        .withOpacity(disabledForegroundOpacity),
    overlayColor:
        lightColorScheme.onTertiaryContainer.withOpacity(overlayOpacity),
  );

  static ColorStyle primary(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkPrimary,
      lightColorStyle: _lightPrimary,
    );
  }

  static ColorStyle secondary(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkSecondary,
      lightColorStyle: _lightSecondary,
    );
  }

  static ColorStyle inverseSurface(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkInverseSurface,
      lightColorStyle: _lightInverseSurface,
    );
  }

  static ColorStyle surface(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkSurface,
      lightColorStyle: _lightSurface,
    );
  }

  static ColorStyle error(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkError,
      lightColorStyle: _lightError,
    );
  }

  static ColorStyle success(BuildContext context) {
    return currentThemeColorStyle(
      context: context,
      darkColorStyle: _darkSuccess,
      lightColorStyle: _lightSuccess,
    );
  }
}
