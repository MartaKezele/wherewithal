import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/components/dialogs/parts/radio_tile_option.dart';
import 'package:wherewithal/components/dialogs/radio_dialog.dart';

import '../../app_models/language.dart';
import '../../change_notifiers/language.dart';
import '../../config/countries.dart';
import '../../constants/themes/flag.dart';

Future<void> languageDialog(BuildContext context) async {
  final languageChangeNotifier = Provider.of<LanguageChangeNotifier>(
    context,
    listen: false,
  );

  countries
      .sort((a, b) => a.language.nativeName.compareTo(b.language.nativeName));

  final languageRadioTiles = countries
      .map((country) => RadioTileDialogOption<Language>(
            value: country.language,
            groupValue: languageChangeNotifier.language,
            title: country.language.nativeName,
            secondary: SvgPicture.asset(
              country.flagAssetPath,
              semanticsLabel: '${country.language.nativeName} flag image',
              height: flagImageHeight,
              width: flagImageWidth,
            ),
            onChanged: (Language? value) {
              context.pop(value);
            },
          ))
      .toList();

  final selectedLanguage = await showRadioDialog<Language>(
    context: context,
    title: 'Language',
    options: languageRadioTiles,
  );

  if (selectedLanguage != null) {
    languageChangeNotifier.language = selectedLanguage;
  }
}
