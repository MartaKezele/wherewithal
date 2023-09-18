import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wherewithal/change_notifiers/language.dart';
import 'package:wherewithal/config/countries.dart';
import 'package:wherewithal/dal/auth_repo.dart';
import 'package:wherewithal/l10n/app_localizations.dart';

class AuthRepoChangeNotifier extends ChangeNotifier {
  AuthRepoChangeNotifier(this._authRepo);

  final AuthRepo _authRepo;

  AuthRepo get authRepo {
    final languageChangeNotifier = GetIt.I<LanguageChangeNotifier>();

    final localeString = languageChangeNotifier.language?.locale != null
        ? '${languageChangeNotifier.language?.locale.languageCode}_${languageChangeNotifier.language?.locale.countryCode}'
        : null;

    _authRepo.localizations =
        AppLocalizations.fromLocale(localeString ?? defaultLocaleStr);

    return _authRepo;
  }
}
