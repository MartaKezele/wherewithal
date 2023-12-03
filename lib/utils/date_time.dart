import '../app_models/months.dart';

DateTime beginningOfThisYear() {
  return DateTime(DateTime.now().year, 1, 1);
}

DateTime endOfThisYear() {
  return endOfDay(
    DateTime(
      DateTime.now().year,
      12,
      31,
    ),
  );
}

DateTime beginningOfThisMonth() {
  return DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
}

DateTime endOfThisMonth() {
  final now = DateTime.now();
  return endOfDay(
    DateTime(
      now.year,
      now.month,
      Months.fromNumber(now.month)!.numberOfDays,
    ),
  );
}

DateTime beginningOfThisWeek() {
  final now = DateTime.now();
  return _beginningOfDay(now).subtract(
    Duration(days: now.weekday - 1),
  );
}

DateTime endOfThisWeek() {
  final now = DateTime.now();
  return endOfDay(
    now.add(
      Duration(days: 7 - now.weekday),
    ),
  );
}

DateTime beginningOfToday() {
  return _beginningOfDay(DateTime.now());
}

DateTime endOfToday() {
  return endOfDay(DateTime.now());
}

DateTime _beginningOfDay(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime endOfDay(DateTime dateTime) {
  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    23,
    59,
    59,
    999,
    999,
  );
}
