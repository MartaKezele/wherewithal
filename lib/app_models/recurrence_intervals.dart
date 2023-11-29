// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

enum RecurrenceIntervals {
  // daily cron example: 0 0 * * * (Repeats every day)
  // hours and minutes are always 0 (beggining of day)
  day(regExpPattern: r'0\s0\s\*\s\*\s\*'),
  // weekly cron example: 0 0 * * 1,2 (Repeats every week on Monday and Tuesday)
  week(regExpPattern: r'0\s0\s\*\s\*\s([1-7],?){1,7}'),
  // monthly cron example: 0 0 13 * * (Repeats every month on the 13th day)
  month(regExpPattern: r'0\s0\s([1-9]|[12][0-9]|3[01])\s\*\s\*'),
  // yearly cron example:0 0 13 5 * (Repeats every year on 13th May)
  year(regExpPattern: r'0\s0\s([1-9]|[12][0-9]|3[01])\s([1-9]|1[0-2])\s\*');

  const RecurrenceIntervals({
    required this.regExpPattern,
  });

  final String regExpPattern;

  String localizedName({
    required BuildContext context,
    int howMany = 1,
  }) {
    return switch (this) {
      day => AppLocalizations.of(context).day(howMany),
      week => AppLocalizations.of(context).week(howMany),
      month => AppLocalizations.of(context).month(howMany),
      year => AppLocalizations.of(context).year(howMany),
    };
  }

  String localizedName2(BuildContext context) {
    return switch (this) {
      day => AppLocalizations.of(context).daily,
      week => AppLocalizations.of(context).weekly,
      month => AppLocalizations.of(context).monthly,
      year => AppLocalizations.of(context).yearly,
    };
  }
}
