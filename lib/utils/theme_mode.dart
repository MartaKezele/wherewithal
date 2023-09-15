import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

String themeModeName({
  required BuildContext context,
  AdaptiveThemeMode? mode,
}) {
  switch (mode ?? AdaptiveTheme.of(context).mode) {
    case AdaptiveThemeMode.dark:
      return AppLocalizations.of(context).dark;
    case AdaptiveThemeMode.light:
      return AppLocalizations.of(context).light;
    case AdaptiveThemeMode.system:
      return AppLocalizations.of(context).system;
  }
}
