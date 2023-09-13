import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/theme_mode.dart';
import 'parts/radio_tile_option.dart';
import 'radio_dialog.dart';

Future<void> themeModeDialog(BuildContext context) async {
  final themeModeRadioTiles = AdaptiveThemeMode.values
      .map((mode) => RadioTileDialogOption(
            value: mode,
            groupValue: AdaptiveTheme.of(context).mode,
            title: themeModeName(mode: mode),
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
      AdaptiveTheme.of(context).setLight();
      break;
    case AdaptiveThemeMode.dark:
      AdaptiveTheme.of(context).setDark();
      break;
    case AdaptiveThemeMode.system:
      AdaptiveTheme.of(context).setSystem();
      break;
    default:
      break;
  }
}
