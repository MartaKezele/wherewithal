import 'package:adaptive_theme/adaptive_theme.dart';

import '../config/router.dart';
import 'app_localizations.dart';

String themeModeName({AdaptiveThemeMode? mode}) {
  if (mode == null) {
    assert(navigatorKey.currentContext != null);
  }

  switch (mode ?? AdaptiveTheme.of(navigatorKey.currentContext!).mode) {
    case AdaptiveThemeMode.dark:
      return AppLocalizations.ofCurrentContext().dark;
    case AdaptiveThemeMode.light:
      return AppLocalizations.ofCurrentContext().light;
    case AdaptiveThemeMode.system:
      return AppLocalizations.ofCurrentContext().system;
  }
}
