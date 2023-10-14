final firstDate = DateTime.fromMillisecondsSinceEpoch(0);

DateTime beginningOfToday() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime endOfDay(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999, 999);
}
