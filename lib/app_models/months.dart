import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

enum Months {
  january(number: 1, numberOfDays: 31),
  february(number: 2, numberOfDays: 28),
  march(number: 3, numberOfDays: 31),
  april(number: 4, numberOfDays: 30),
  may(number: 5, numberOfDays: 31),
  june(number: 6, numberOfDays: 30),
  july(number: 7, numberOfDays: 31),
  august(number: 8, numberOfDays: 31),
  september(number: 9, numberOfDays: 30),
  october(number: 10, numberOfDays: 31),
  november(number: 11, numberOfDays: 30),
  december(number: 12, numberOfDays: 31);

  const Months({
    required this.number,
    required this.numberOfDays,
  });

  static Months? fromNumber(int number) {
    final filteredMonths = values.where((element) => element.number == number);
    return filteredMonths.isEmpty ? null : filteredMonths.first;
  }

  final int number;
  final int numberOfDays;

  String localizedName(
    BuildContext context,
  ) {
    return switch (this) {
      january => AppLocalizations.of(context).january,
      february => AppLocalizations.of(context).february,
      march => AppLocalizations.of(context).march,
      april => AppLocalizations.of(context).april,
      may => AppLocalizations.of(context).may,
      june => AppLocalizations.of(context).june,
      july => AppLocalizations.of(context).july,
      august => AppLocalizations.of(context).august,
      september => AppLocalizations.of(context).september,
      october => AppLocalizations.of(context).october,
      november => AppLocalizations.of(context).november,
      december => AppLocalizations.of(context).december,
    };
  }
}
