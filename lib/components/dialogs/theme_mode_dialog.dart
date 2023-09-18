import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/config/router.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/theme_mode.dart';
import 'parts/radio_tile_option.dart';
import 'radio_dialog.dart';

Future<void> themeModeDialog(BuildContext context) async {
  final themeModeRadioTiles = AdaptiveThemeMode.values
      .map((mode) => RadioTileDialogOption(
            value: mode,
            groupValue: AdaptiveTheme.of(context).mode,
            title: themeModeName(context: context, mode: mode),
            onChanged: (AdaptiveThemeMode? value) {
              context.pop(value);
            },
          ))
      .toList();

  switch (await showRadioDialog<AdaptiveThemeMode>(
    context: context,
    title: AppLocalizations.of(context).themeMode,
    options: themeModeRadioTiles,
  )) {
    case AdaptiveThemeMode.light:
      AdaptiveTheme.of(navigatorKey.currentContext!).setLight();
      break;
    case AdaptiveThemeMode.dark:
      AdaptiveTheme.of(navigatorKey.currentContext!).setDark();
      break;
    case AdaptiveThemeMode.system:
      AdaptiveTheme.of(navigatorKey.currentContext!).setSystem();
      break;
    default:
      break;
  }
}
