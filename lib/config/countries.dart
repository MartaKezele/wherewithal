import 'package:flutter/material.dart';

import '../app_models/country.dart';
import '../app_models/currency.dart';
import '../app_models/language.dart';

final Currency _euro = Currency(
  nativeName: 'Euro',
  code: 'EUR',
  symbol: '€',
  flagAssetPath: 'assets/images/flags/eu.svg',
);
final Currency _usDollar = Currency(
  nativeName: 'US Dollar',
  code: 'USD',
  symbol: '\$',
);

final Country _unitedStates = Country(
  nativeName: 'United States',
  language: Language(
    nativeName: 'English (US)',
    locale: const Locale('en', 'US'),
  ),
  currency: _usDollar,
  flagAssetPath: 'assets/images/flags/us.svg',
);

final Country _croatia = Country(
  nativeName: 'Hrvatska',
  language: Language(
    nativeName: 'Hrvatski',
    locale: const Locale('hr', 'HR'),
  ),
  currency: _euro,
  flagAssetPath: 'assets/images/flags/hr.svg',
);

final Country defaultCountry = _unitedStates;

final countries = [
  _unitedStates,
  _croatia,
];
