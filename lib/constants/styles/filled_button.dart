import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../../utils/style.dart';
import 'opacity.dart';

class FilledButtonStyles {
  static final _darkPrimary = ColorStyle(
    foregroundColor: darkColorScheme.onPrimaryContainer,
    disabledForegroundColor: darkColorScheme.onPrimaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.primaryContainer,
    disabledBackgroundColor:
        darkColorScheme.primaryContainer.withOpacity(disabledBackgroundOpacity),
    overlayColor:
        darkColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkSecondary = ColorStyle(
    foregroundColor: darkColorScheme.onSecondaryContainer,
    disabledForegroundColor: darkColorScheme.onSecondaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.secondaryContainer,
    disabledBackgroundColor: darkColorScheme.secondaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        darkColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkInverseSurface = ColorStyle(
    foregroundColor: darkColorScheme.onInverseSurface,
    disabledForegroundColor: darkColorScheme.onInverseSurface
        .withOpacity(inverseSurfaceDisabledForegroundOpacity),
    backgroundColor: darkColorScheme.inverseSurface,
    disabledBackgroundColor:
        darkColorScheme.inverseSurface.withOpacity(disabledBackgroundOpacity),
    overlayColor: Colors.white.withOpacity(inverseSurfaceOverlayOpacity),
  );
  static final _darkSurface = ColorStyle(
    foregroundColor: darkColorScheme.onSurface,
    disabledForegroundColor:
        darkColorScheme.onSurface.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.surface,
    disabledBackgroundColor:
        darkColorScheme.surface.withOpacity(disabledBackgroundOpacity),
    overlayColor: Colors.white.withOpacity(overlayOpacity),
  );

  static final _darkError = ColorStyle(
    foregroundColor: darkColorScheme.onErrorContainer,
    disabledForegroundColor:
        darkColorScheme.onErrorContainer.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.errorContainer,
    disabledBackgroundColor:
        darkColorScheme.errorContainer.withOpacity(disabledBackgroundOpacity),
    overlayColor: darkColorScheme.onErrorContainer.withOpacity(overlayOpacity),
  );

  static final _darkSuccess = ColorStyle(
    foregroundColor: darkColorScheme.onTertiaryContainer,
    disabledForegroundColor: darkColorScheme.onTertiaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.tertiaryContainer,
    disabledBackgroundColor: darkColorScheme.tertiaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        darkColorScheme.onTertiaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightPrimary = ColorStyle(
    foregroundColor: lightColorScheme.onPrimary,
    disabledForegroundColor:
        lightColorScheme.primary.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.primary,
    disabledBackgroundColor:
        lightColorScheme.primary.withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightSecondary = ColorStyle(
    foregroundColor: lightColorScheme.onSecondary,
    disabledForegroundColor:
        lightColorScheme.secondary.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.secondary,
    disabledBackgroundColor:
        lightColorScheme.secondary.withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightInverseSurface = ColorStyle(
    foregroundColor: lightColorScheme.onInverseSurface,
    disabledForegroundColor:
        lightColorScheme.inverseSurface.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.inverseSurface,
    disabledBackgroundColor:
        lightColorScheme.inverseSurface.withOpacity(disabledBackgroundOpacity),
    overlayColor: Colors.black.withOpacity(inverseSurfaceOverlayOpacity),
  );
  static final _lightSurface = ColorStyle(
    foregroundColor: lightColorScheme.onSurface,
    disabledForegroundColor:
        lightColorScheme.surface.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.surface,
    disabledBackgroundColor:
        lightColorScheme.surface.withOpacity(disabledBackgroundOpacity),
    overlayColor: Colors.black.withOpacity(overlayOpacity),
  );

  static final _lightError = ColorStyle(
    foregroundColor: lightColorScheme.onError,
    disabledForegroundColor:
        lightColorScheme.error.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.error,
    disabledBackgroundColor:
        lightColorScheme.error.withOpacity(disabledBackgroundOpacity),
    overlayColor: lightColorScheme.onErrorContainer.withOpacity(overlayOpacity),
  );

  static final _lightSuccess = ColorStyle(
    foregroundColor: lightColorScheme.onTertiary,
    disabledForegroundColor:
        lightColorScheme.tertiary.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.tertiary,
    disabledBackgroundColor:
        lightColorScheme.tertiary.withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onTertiaryContainer.withOpacity(overlayOpacity),
  );

  static ColorStyle get primary => currentThemeColorStyle(
        darkColorStyle: _darkPrimary,
        lightColorStyle: _lightPrimary,
      );

  static ColorStyle get secondary => currentThemeColorStyle(
        darkColorStyle: _darkSecondary,
        lightColorStyle: _lightSecondary,
      );

  static ColorStyle get inverseSurface => currentThemeColorStyle(
        darkColorStyle: _darkInverseSurface,
        lightColorStyle: _lightInverseSurface,
      );

  static ColorStyle get surface => currentThemeColorStyle(
        darkColorStyle: _darkSurface,
        lightColorStyle: _lightSurface,
      );

  static ColorStyle get error => currentThemeColorStyle(
        darkColorStyle: _darkError,
        lightColorStyle: _lightError,
      );

  static ColorStyle get success => currentThemeColorStyle(
        darkColorStyle: _darkSuccess,
        lightColorStyle: _lightSuccess,
      );
}
