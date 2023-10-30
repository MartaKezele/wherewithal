final firstDate = DateTime.fromMillisecondsSinceEpoch(0);

DateTime beginningOfThisWeek() {
  final now = DateTime.now();
  return _beginningOfDay(now).subtract(
    Duration(days: now.weekday - 1),
  );
}

DateTime endOfThisWeek() {
  final now = DateTime.now();
  return endOfDay(now).add(
    Duration(days: 7 - now.weekday),
  );
}

DateTime _beginningOfDay(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime endOfDay(DateTime dateTime) {
  return DateTime(
      dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999, 999);
}
