import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../config/keys/shared_prefs.dart';
import '../utils/prefs.dart';
import 'language.dart';

class DateFormatChangeNotifier extends ChangeNotifier {
  DateFormatChangeNotifier(this._dateFormatPattern);

  String? _dateFormatPattern;

  DateFormat? get dateFormat {
    return DateFormat(
      _dateFormatPattern,
      GetIt.I<LanguageChangeNotifier>().language?.fullLocaleString,
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
