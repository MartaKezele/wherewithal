import 'package:flutter/material.dart';

class ColorStyle {
  final Color _foregroundColor;
  final Color _disabledForegroundColor;
  final Color? _backgroundColor;
  final Color? _disabledBackgroundColor;
  final Color? _overlayColor;

  ColorStyle({
    required Color foregroundColor,
    required Color disabledForegroundColor,
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? overlayColor,
  })  : _foregroundColor = foregroundColor,
        _backgroundColor = backgroundColor,
        _overlayColor = overlayColor,
        _disabledBackgroundColor = disabledBackgroundColor,
        _disabledForegroundColor = disabledForegroundColor;

  Color get foregroundColor => _foregroundColor;

  Color? get backgroundColor => _backgroundColor;

  Color? get overlayColor => _overlayColor;

  Color? get disabledBackgroundColor => _disabledBackgroundColor;

  Color get disabledForegroundColor => _disabledForegroundColor;
}
