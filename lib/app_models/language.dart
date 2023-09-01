import 'package:flutter/material.dart';

class Language {
  final String _nativeName;
  final Locale _locale;

  Language({
    required String nativeName,
    required Locale locale,
  })  : _nativeName = nativeName,
        _locale = locale;

  String get nativeName => _nativeName;

  Locale get locale => _locale;
}
