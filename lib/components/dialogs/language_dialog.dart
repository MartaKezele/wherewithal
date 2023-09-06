import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/language.dart';
import '../../change_notifiers/language.dart';
import '../../config/countries.dart';
import '../../constants/themes/flag.dart';
import '../../utils/app_localizations.dart';
import 'parts/radio_tile_option.dart';
import 'radio_dialog.dart';

Future<void> languageDialog(BuildContext context) async {
  final localizations = AppLocalizations.of(context);

  final languageChangeNotifier = GetIt.I<LanguageChangeNotifier>();

  countries
      .sort((a, b) => a.language.nativeName.compareTo(b.language.nativeName));

  final languageRadioTiles = countries
      .map((country) => RadioTileDialogOption<Language>(
            value: country.language,
            groupValue: languageChangeNotifier.language,
            title: country.language.nativeName,
            secondary: SvgPicture.asset(
              country.flagAssetPath,
              semanticsLabel:
                  '${localizations.flagImage} - ${country.language.nativeName}',
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
    title: localizations.language,
    options: languageRadioTiles,
  );

  if (selectedLanguage != null) {
    languageChangeNotifier.language = selectedLanguage;
  }
}
