import 'currency.dart';
import 'language.dart';

class Country {
  final String nativeName;
  final Language language;
  final Currency currency;
  final String flagAssetPath;

  Country({
    required this.nativeName,
    required this.language,
    required this.currency,
    required this.flagAssetPath,
  });
}
