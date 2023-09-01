import 'currency.dart';
import 'language.dart';

class Country {
  final String _nativeName;
  final Language _language;
  final Currency _currency;
  final String _flagAssetPath;

  Country({
    required String nativeName,
    required Language language,
    required Currency currency,
    required String flagAssetPath,
  })  : _nativeName = nativeName,
        _language = language,
        _currency = currency,
        _flagAssetPath = flagAssetPath;

  Currency get currency => _currency;

  Language get language => _language;

  String get nativeName => _nativeName;

  String get flagAssetPath => _flagAssetPath;
}
