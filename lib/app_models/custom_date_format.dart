import 'package:intl/intl.dart';

class CustomDateFormat {
  final String name;
  final DateFormat format;

  CustomDateFormat({
    required this.name,
    required this.format,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomDateFormat &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
