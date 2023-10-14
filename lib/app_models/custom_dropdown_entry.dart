import 'package:flutter/material.dart';

class CustomDropdownEntry<T> {
  final T value;
  final String title;
  final List<CustomDropdownEntry<T>> subEntries;
  final Color? foregroundColor;
  final Color? backgroundColor;

  CustomDropdownEntry({
    required this.value,
    required this.title,
    this.subEntries = const [],
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  bool operator ==(Object other) =>
      other is CustomDropdownEntry &&
      other.runtimeType == runtimeType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;
}
