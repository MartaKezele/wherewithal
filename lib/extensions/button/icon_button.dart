import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';

extension Style on IconButton {
  ButtonStyle? _iconBtnStyle(ColorStyle colorStyle) {
    return IconButton.styleFrom(
      backgroundColor: colorStyle.backgroundColor,
      foregroundColor: colorStyle.foregroundColor,
      disabledBackgroundColor: colorStyle.disabledBackgroundColor,
      disabledForegroundColor: colorStyle.disabledForegroundColor,
    ).copyWith(
      overlayColor: MaterialStatePropertyAll(colorStyle.overlayColor),
    );
  }

  IconButton colorStyle(ColorStyle colorStyle) {
    return IconButton(
      style: _iconBtnStyle(colorStyle),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
