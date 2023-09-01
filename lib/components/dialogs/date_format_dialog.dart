import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wherewithal/components/dialogs/parts/radio_tile_option.dart';
import 'package:wherewithal/components/dialogs/radio_dialog.dart';

import '../../change_notifiers/date_format.dart';
import '../../config/date_format_patterns.dart';

Future<void> dateFormatDialog(
  BuildContext context,
) async {
  final locale = Localizations.localeOf(context);

  final dateFormatChangeNotifier = Provider.of<DateFormatChangeNotifier>(
    context,
    listen: false,
  );

  final dateFormatRadioTiles = dateFormatPatterns.map((pattern) {
    final localeString = '${locale.languageCode}_${locale.countryCode}';
    final dateFormat = DateFormat(pattern, localeString);

    return RadioTileDialogOption<String?>(
      value: pattern,
      groupValue: dateFormatChangeNotifier.dateFormat(context)?.pattern,
      title: dateFormat.format(DateTime.now()),
      onChanged: (String? value) {
        context.pop(value);
      },
    );
  }).toList();

  final selectedDateFormatPattern = await showRadioDialog<String?>(
    context: context,
    title: 'Date format',
    options: dateFormatRadioTiles,
  );

  if (selectedDateFormatPattern != null) {
    dateFormatChangeNotifier.dateFormatPattern = selectedDateFormatPattern;
  }
}
