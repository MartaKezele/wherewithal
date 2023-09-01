import 'package:flutter/material.dart';
import 'package:wherewithal/app_models/color_style.dart';

extension Style on TextButton {
  TextButton addColorStyle({
    required ColorStyle colorStyle,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: colorStyle.foregroundColor,
        disabledForegroundColor: colorStyle.disabledForegroundColor,
      ).copyWith(
        overlayColor: MaterialStatePropertyAll(
          colorStyle.overlayColor,
        ),
      ),
      onPressed: onPressed,
      child: child ??
          const Placeholder(
            child: Text('Placeholder text'),
          ),
    );
  }
}
