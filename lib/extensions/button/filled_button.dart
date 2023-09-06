import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';

extension Style on FilledButton {
  FilledButton addColorStyle(ColorStyle colorStyle) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: colorStyle.backgroundColor,
        foregroundColor: colorStyle.foregroundColor,
        disabledBackgroundColor: colorStyle.disabledBackgroundColor,
        disabledForegroundColor: colorStyle.disabledForegroundColor,
      ).copyWith(
        overlayColor: MaterialStatePropertyAll(colorStyle.overlayColor),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
