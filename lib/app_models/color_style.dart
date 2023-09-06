import 'package:flutter/material.dart';

class ColorStyle {
  final Color foregroundColor;
  final Color disabledForegroundColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? overlayColor;

  ColorStyle({
    required this.foregroundColor,
    required this.disabledForegroundColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.overlayColor,
  });
}
