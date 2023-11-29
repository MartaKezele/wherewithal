import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'months.dart';
import 'recurrence_intervals.dart';
import 'week_days.dart';

class CronRecurrenceInterval {
  int? day;
  List<WeekDays> weekDays;
  Months? month;

  CronRecurrenceInterval({
    this.day,
    this.weekDays = const [],
    this.month,
  });

  factory CronRecurrenceInterval.fromCronExpression(String cronExpression) {
    // min hour day month weekdays
    //  1   2    3    4      5
    //  *   *    *    *      *
    final values = cronExpression.split(' ');

    final weekDayNumbers = values[4].split(',');

    final weekDays = weekDayNumbers
        .map((number) => int.tryParse(number))
        .where((number) => number != null)
        .map((number) => WeekDays.fromNumber(number!))
        .where((weekDay) => weekDay != null)
        .toList();

    final List<WeekDays> list = [];

    for (final element in weekDays) {
      if (element != null) {
        list.add(element);
      }
    }

    final monthNumber = int.tryParse(values[3]);

    return CronRecurrenceInterval(
      day: int.tryParse(values[2]),
      weekDays: list,
      month: monthNumber == null ? null : Months.fromNumber(monthNumber),
    );
  }

  RecurrenceIntervals? get recurrenceInterval {
    for (final interval in RecurrenceIntervals.values) {
      if (interval.regExpPattern != null &&
          RegExp(interval.regExpPattern!).hasMatch(cronExpression)) {
        return interval;
      }
    }
    return null;
  }

  String get cronExpression {
    final weekDaysStr = (weekDays.isEmpty)
        ? '*'
        : weekDays.map((weekDay) => weekDay.value).join(',');
    return '0 0 ${day ?? '*'} ${month?.number ?? '*'} $weekDaysStr';
  }

  String? localizedMessage(
    BuildContext context,
  ) {
    final weekDaysStr = weekDays
        .map(
          (weekDay) => weekDay.localizedName(context),
        )
        .join(',');

    return switch (recurrenceInterval) {
      RecurrenceIntervals.day => AppLocalizations.of(context).repeatsEveryDay,
      RecurrenceIntervals.week => weekDays.isEmpty
          ? null
          : AppLocalizations.of(context).repeatsEveryWeekOn(weekDaysStr),
      RecurrenceIntervals.month => day == null
          ? null
          : AppLocalizations.of(context).repeatsEveryMonthOnDay(day!),
      RecurrenceIntervals.year => day == null || month == null
          ? null
          : AppLocalizations.of(context).repeatsEveryYearOnDayOfMonth(
              day!,
              month!.number,
              month!.localizedName(context),
            ),
      RecurrenceIntervals.oneTime => null,
      null => null,
    };
  }
}
