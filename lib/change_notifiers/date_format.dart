import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../config/shared_prefs_keys.dart';
import '../utils/prefs.dart';
import 'language.dart';

class DateFormatChangeNotifier extends ChangeNotifier {
  DateFormatChangeNotifier(this._dateFormatPattern);

  String? _dateFormatPattern;

  DateFormat? dateFormat(BuildContext context) {
    var languageChangeNotifier = Provider.of<LanguageChangeNotifier>(
      context,
      listen: false,
    );
    var localeString = languageChangeNotifier.language?.locale != null
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
