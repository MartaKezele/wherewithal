import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../../utils/style.dart';
import 'opacity.dart';

class FilledButtonStyles {
  static final _darkPrimaryContainer = ColorStyle(
    foregroundColor: darkColorScheme.onPrimaryContainer,
    disabledForegroundColor: darkColorScheme.onPrimaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.primaryContainer,
    disabledBackgroundColor:
        darkColorScheme.primaryContainer.withOpacity(disabledBackgroundOpacity),
    overlayColor:
        darkColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkPrimary = ColorStyle(
    foregroundColor: darkColorScheme.primary,
    disabledForegroundColor:
        darkColorScheme.primary.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.onPrimary,
    disabledBackgroundColor:
        darkColorScheme.onPrimary.withOpacity(darkDisabledBackgroundOpacity2),
    overlayColor: darkColorScheme.primary.withOpacity(overlayOpacity),
  );

  static final _darkSecondaryContainer = ColorStyle(
    foregroundColor: darkColorScheme.onSecondaryContainer,
    disabledForegroundColor: darkColorScheme.onSecondaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.secondaryContainer,
    disabledBackgroundColor: darkColorScheme.secondaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        darkColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _darkSecondary = ColorStyle(
    foregroundColor: darkColorScheme.secondary,
    disabledForegroundColor:
        darkColorScheme.secondary.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.onSecondary,
    disabledBackgroundColor:
        darkColorScheme.onSecondary.withOpacity(darkDisabledBackgroundOpacity2),
    overlayColor: darkColorScheme.secondary.withOpacity(overlayOpacity),
  );

  static final _darkInverseSurface = ColorStyle(
    foregroundColor: darkColorScheme.inverseSurface,
    disabledForegroundColor: darkColorScheme.inverseSurface
        .withOpacity(inverseSurfaceDisabledForegroundOpacity),
    backgroundColor: darkColorScheme.onInverseSurface,
    disabledBackgroundColor:
        darkColorScheme.onInverseSurface.withOpacity(disabledBackgroundOpacity),
    overlayColor: darkColorScheme.inverseSurface.withOpacity(overlayOpacity),
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
        lightColorScheme.primary.withOpacity(lightDisabledBackgroundOpacity2),
    overlayColor:
        lightColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightSecondary = ColorStyle(
    foregroundColor: lightColorScheme.onSecondary,
    disabledForegroundColor:
        lightColorScheme.secondary.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.secondary,
    disabledBackgroundColor:
        lightColorScheme.secondary.withOpacity(lightDisabledBackgroundOpacity2),
    overlayColor:
        lightColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightPrimaryContainer = ColorStyle(
    foregroundColor: lightColorScheme.onPrimaryContainer,
    disabledForegroundColor: lightColorScheme.onPrimaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.primaryContainer,
    disabledBackgroundColor: lightColorScheme.primaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onPrimaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightSecondaryContainer = ColorStyle(
    foregroundColor: lightColorScheme.onSecondaryContainer,
    disabledForegroundColor: lightColorScheme.onSecondaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.secondaryContainer,
    disabledBackgroundColor: lightColorScheme.secondaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onSecondaryContainer.withOpacity(overlayOpacity),
  );

  static final _lightInverseSurface = ColorStyle(
    foregroundColor: lightColorScheme.inverseSurface,
    disabledForegroundColor:
        lightColorScheme.inverseSurface.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.onInverseSurface,
    disabledBackgroundColor: lightColorScheme.onInverseSurface
        .withOpacity(disabledBackgroundOpacity),
    overlayColor: lightColorScheme.inverseSurface.withOpacity(overlayOpacity),
  );

  static final _lightSurface = ColorStyle(
    foregroundColor: lightColorScheme.onSurface,
    disabledForegroundColor:
        lightColorScheme.onSurface.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.surface,
    disabledBackgroundColor:
        lightColorScheme.surface.withOpacity(disabledBackgroundOpacity),
    overlayColor: Colors.black.withOpacity(overlayOpacity),
  );

  static final _lightError = ColorStyle(
    foregroundColor: lightColorScheme.onErrorContainer,
    disabledForegroundColor: lightColorScheme.onErrorContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.errorContainer,
    disabledBackgroundColor:
        lightColorScheme.errorContainer.withOpacity(disabledBackgroundOpacity),
    overlayColor: lightColorScheme.onErrorContainer.withOpacity(overlayOpacity),
  );

  static final _lightSuccess = ColorStyle(
    foregroundColor: lightColorScheme.onTertiaryContainer,
    disabledForegroundColor: lightColorScheme.onTertiaryContainer
        .withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.tertiaryContainer,
    disabledBackgroundColor: lightColorScheme.tertiaryContainer
        .withOpacity(disabledBackgroundOpacity),
    overlayColor:
        lightColorScheme.onTertiaryContainer.withOpacity(overlayOpacity),
  );

  static ColorStyle get primaryContainer => currentThemeColorStyle(
        darkColorStyle: _darkPrimaryContainer,
        lightColorStyle: _lightPrimaryContainer,
      );

  static ColorStyle get secondaryContainer => currentThemeColorStyle(
        darkColorStyle: _darkSecondaryContainer,
        lightColorStyle: _lightSecondaryContainer,
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

  static ColorStyle get enterAppPrimary => currentThemeColorStyle(
        darkColorStyle: _darkPrimaryContainer,
        lightColorStyle: _lightPrimary,
      );

  static ColorStyle get enterAppSecondary => currentThemeColorStyle(
        darkColorStyle: _darkSecondaryContainer,
        lightColorStyle: _lightSecondary,
      );
}
