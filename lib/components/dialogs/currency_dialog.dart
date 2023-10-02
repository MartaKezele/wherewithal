import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/currency.dart';
import '../../change_notifiers/currency.dart';
import '../../config/countries.dart';
import '../../constants/styles/flag.dart';
import '../../l10n/app_localizations.dart';
import 'list_view_dialog.dart';
import 'parts/radio_tile_option.dart';

Future<void> currencyDialog(
  BuildContext context,
) async {
  final localizations = AppLocalizations.of(context);

  final currencyChangeNotifier = GetIt.I<CurrencyChangeNotifier>();

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
        semanticsLabel: localizations.flagImage,
        height: flagImageHeight,
        width: flagImageWidth,
      ),
      onChanged: (Currency? value) {
        context.pop(value);
      },
    );
  }).toList();

  final selectedCurrency = await showListViewDialog<Currency?>(
    context: context,
    title: localizations.currency,
    options: currencyRadioTiles,
  );

  if (selectedCurrency != null) {
    currencyChangeNotifier.currency = selectedCurrency;
  }
}
