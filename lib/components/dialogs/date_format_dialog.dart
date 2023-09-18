import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../change_notifiers/date_format.dart';
import '../../config/date_format_patterns.dart';
import '../../l10n/app_localizations.dart';
import 'parts/radio_tile_option.dart';
import 'radio_dialog.dart';

Future<void> dateFormatDialog(
  BuildContext context,
) async {
  final localizations = AppLocalizations.of(context);

  final locale = Localizations.localeOf(context);

  final dateFormatChangeNotifier = GetIt.I<DateFormatChangeNotifier>();

  final dateFormatRadioTiles = dateFormatPatterns.map((pattern) {
    final localeString = '${locale.languageCode}_${locale.countryCode}';
    final dateFormat = DateFormat(pattern, localeString);

    return RadioTileDialogOption<String?>(
      value: pattern,
      groupValue: dateFormatChangeNotifier.dateFormat?.pattern,
      title: dateFormat.format(DateTime.now()),
      onChanged: (String? value) {
        context.pop(value);
      },
    );
  }).toList();

  final selectedDateFormatPattern = await showRadioDialog<String?>(
    context: context,
    title: localizations.dateFormat,
    options: dateFormatRadioTiles,
  );

  if (selectedDateFormatPattern != null) {
    dateFormatChangeNotifier.dateFormatPattern = selectedDateFormatPattern;
  }
}
