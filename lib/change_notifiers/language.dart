import 'package:flutter/material.dart';

import '../app_models/language.dart';
import '../config/keys/shared_prefs.dart';
import '../utils/prefs.dart';

class LanguageChangeNotifier extends ChangeNotifier {
  LanguageChangeNotifier(this._language);

  Language? _language;

  Language? get language => _language;

  set language(Language? value) {
    _language = value;
    writeStringPref(
      SharedPrefsKeys.languageCode,
      value?.locale.languageCode ?? '',
    );
    writeStringPref(
      SharedPrefsKeys.countryCode,
      value?.locale.countryCode ?? '',
    );
    notifyListeners();
  }
}
