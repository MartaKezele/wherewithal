import 'package:flutter/material.dart';

import '../app_models/currency.dart';
import '../config/keys/shared_prefs.dart';
import '../utils/prefs.dart';

class CurrencyChangeNotifier extends ChangeNotifier {
  CurrencyChangeNotifier(this._currency);

  Currency? _currency;

  Currency? get currency => _currency;

  set currency(Currency? value) {
    _currency = value;
    writeStringPref(
      SharedPrefsKeys.currency,
      value?.code ?? '',
    ).then((_) => notifyListeners());
  }
}