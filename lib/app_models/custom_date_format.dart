import 'package:intl/intl.dart';

class CustomDateFormat {
  final String _name;
  final DateFormat _format;

  CustomDateFormat({
    required String name,
    required DateFormat format,
  })  : _name = name,
        _format = format;

  DateFormat get format => _format;

  String get name => _name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomDateFormat &&
          runtimeType == other.runtimeType &&
          _name == other._name;

  @override
  int get hashCode => _name.hashCode;
}
