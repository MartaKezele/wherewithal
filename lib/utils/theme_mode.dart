import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

String themeModeName({required BuildContext context, AdaptiveThemeMode? mode}) {
  switch (mode ?? AdaptiveTheme.of(context).mode) {
    case AdaptiveThemeMode.dark:
      return 'Dark';
    case AdaptiveThemeMode.light:
      return 'Light';
    case AdaptiveThemeMode.system:
      return 'System';
  }
}
