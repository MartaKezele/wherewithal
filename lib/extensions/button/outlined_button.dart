import 'package:flutter/material.dart';
import 'package:wherewithal/app_models/color_style.dart';

extension Style on OutlinedButton {
  static const _borderWidth = 0.8;
  static const _disabledBorderOpacity = 0.15;

  OutlinedButton addColorStyle({
    required ColorStyle colorStyle,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorStyle.foregroundColor,
        disabledForegroundColor: colorStyle.disabledForegroundColor,
      ).copyWith(
          overlayColor: MaterialStatePropertyAll(
            colorStyle.overlayColor,
          ),
          side: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                width: _borderWidth,
                color: colorStyle.disabledForegroundColor
                    .withOpacity(_disabledBorderOpacity),
              );
            }
            return BorderSide(
              width: _borderWidth,
              color: colorStyle.foregroundColor,
            );
          })),
      onPressed: onPressed,
      child: child,
    );
  }
}
