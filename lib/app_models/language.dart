import 'package:flutter/material.dart';

class Language {
  final String nativeName;
  final Locale locale;

  String get fullLocaleString => '${locale.languageCode}_${locale.countryCode}';

  Language({
    required this.nativeName,
    required this.locale,
  });
}
