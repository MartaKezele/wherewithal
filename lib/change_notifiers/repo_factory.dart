import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../config/countries.dart';
import '../dal/repo_factory.dart';
import '../l10n/app_localizations.dart';
import 'language.dart';

class RepoFactoryChangeNotifier extends ChangeNotifier {
  RepoFactoryChangeNotifier(this._repoFactory);

  final RepoFactory _repoFactory;

  RepoFactory get repoFactory {
    _repoFactory.localizations = AppLocalizations.fromLocale(
        GetIt.I<LanguageChangeNotifier>().language?.fullLocaleString ??
            defaultCountry.language.fullLocaleString);

    return _repoFactory;
  }
}
