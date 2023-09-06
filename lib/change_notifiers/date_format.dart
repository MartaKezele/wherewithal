import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../config/shared_prefs_keys.dart';
import '../utils/prefs.dart';
import 'language.dart';

class DateFormatChangeNotifier extends ChangeNotifier {
  DateFormatChangeNotifier(this._dateFormatPattern);

  String? _dateFormatPattern;

  DateFormat? dateFormat() {
    final languageChangeNotifier = GetIt.I<LanguageChangeNotifier>();

    final localeString = languageChangeNotifier.language?.locale != null
        ? '${languageChangeNotifier.language?.locale.languageCode}_${languageChangeNotifier.language?.locale.countryCode}'
        : null;

    return DateFormat(
      _dateFormatPattern,
      localeString,
    );
  }

  set dateFormatPattern(String? value) {
    _dateFormatPattern = value;
    writeStringPref(
      SharedPrefsKeys.dateFormatPattern,
      value ?? '',
    );
    notifyListeners();
  }
}
