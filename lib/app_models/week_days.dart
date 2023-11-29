import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

enum WeekDays {
  monday(value: 1),
  tuesday(value: 2),
  wednesday(value: 3),
  thursday(value: 4),
  friday(value: 5),
  saturday(value: 6),
  sunday(value: 7);

  const WeekDays({
    required this.value,
  });

  final int value;

  static WeekDays? fromNumber(int number) {
    final filteredWeekDays = values.where((element) => element.value == number);
    return filteredWeekDays.isEmpty ? null : filteredWeekDays.first;
  }

  String localizedName(
    BuildContext context,
  ) {
    return switch (this) {
      monday => AppLocalizations.of(context).monday,
      tuesday => AppLocalizations.of(context).tuesday,
      wednesday => AppLocalizations.of(context).wednesday,
      thursday => AppLocalizations.of(context).thursday,
      friday => AppLocalizations.of(context).friday,
      saturday => AppLocalizations.of(context).saturday,
      sunday => AppLocalizations.of(context).sunday,
    };
  }
}
