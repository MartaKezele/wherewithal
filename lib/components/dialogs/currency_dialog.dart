import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/components/dialogs/radio_dialog.dart';

import '../../app_models/currency.dart';
import '../../change_notifiers/currency.dart';
import '../../config/countries.dart';
import '../../constants/themes/flag.dart';
import 'parts/radio_tile_option.dart';

Future<void> currencyDialog(
  BuildContext context,
) async {
  final currencyChangeNotifier = Provider.of<CurrencyChangeNotifier>(
    context,
    listen: false,
  );

  final currencies = countries
      .map((country) {
        country.currency.flagAssetPath ??= country.flagAssetPath;
        return country.currency;
      })
      .toSet()
      .toList();

  currencies.sort((a, b) => a.nativeName.compareTo(b.nativeName));

  final currencyRadioTiles = currencies.map((currency) {
    return RadioTileDialogOption<Currency?>(
      value: currency,
      groupValue: currencyChangeNotifier.currency,
      title: currency.nativeName,
      subtitle: '${currency.code} (${currency.symbol})',
      secondary: SvgPicture.asset(
        currency.flagAssetPath ?? '',
        semanticsLabel: 'flag image',
        height: flagImageHeight,
        width: flagImageWidth,
      ),
      onChanged: (Currency? value) {
        context.pop(value);
      },
    );
  }).toList();

  final selectedCurrency = await showRadioDialog<Currency?>(
    context: context,
    title: 'Currency',
    options: currencyRadioTiles,
  );

  if (selectedCurrency != null) {
    currencyChangeNotifier.currency = selectedCurrency;
  }
}
