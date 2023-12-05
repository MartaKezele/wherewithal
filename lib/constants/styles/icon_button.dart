import '../../app_models/color_style.dart';
import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';
import '../../utils/style.dart';
import 'opacity.dart';

class FilledIconButtonStyles {
  static final _darkError = ColorStyle(
    foregroundColor: darkColorScheme.onError,
    disabledForegroundColor:
        darkColorScheme.onError.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.error,
    disabledBackgroundColor:
        darkColorScheme.error.withOpacity(disabledBackgroundOpacity),
    overlayColor: darkColorScheme.onError.withOpacity(overlayOpacity),
  );

  static final _darkSuccess = ColorStyle(
    foregroundColor: darkColorScheme.onTertiary,
    disabledForegroundColor:
        darkColorScheme.onTertiary.withOpacity(disabledForegroundOpacity),
    backgroundColor: darkColorScheme.tertiary,
    disabledBackgroundColor:
        darkColorScheme.tertiary.withOpacity(disabledBackgroundOpacity),
    overlayColor: darkColorScheme.onTertiary.withOpacity(overlayOpacity),
  );

  static final _lightError = ColorStyle(
    foregroundColor: lightColorScheme.onError,
    disabledForegroundColor:
        lightColorScheme.onError.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.error,
    disabledBackgroundColor:
        lightColorScheme.error.withOpacity(disabledBackgroundOpacity),
    overlayColor: lightColorScheme.onError.withOpacity(overlayOpacity),
  );

  static final _lightSuccess = ColorStyle(
    foregroundColor: lightColorScheme.onTertiary,
    disabledForegroundColor:
        lightColorScheme.onTertiary.withOpacity(disabledForegroundOpacity),
    backgroundColor: lightColorScheme.tertiary,
    disabledBackgroundColor:
        lightColorScheme.tertiary.withOpacity(disabledBackgroundOpacity),
    overlayColor: lightColorScheme.onTertiary.withOpacity(overlayOpacity),
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
