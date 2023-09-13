import 'package:flutter/material.dart';
import 'package:wherewithal/constants/spacers.dart';

import '../../app_models/color_style.dart';

extension Style on FilledButton {
  ButtonStyle? _filledBtnStyle(ColorStyle colorStyle) {
    return FilledButton.styleFrom(
      backgroundColor: colorStyle.backgroundColor,
      foregroundColor: colorStyle.foregroundColor,
      disabledBackgroundColor: colorStyle.disabledBackgroundColor,
      disabledForegroundColor: colorStyle.disabledForegroundColor,
    ).copyWith(
      overlayColor: MaterialStatePropertyAll(colorStyle.overlayColor),
    );
  }

  FilledButton colorStyle(ColorStyle colorStyle) {
    return FilledButton(
      style: _filledBtnStyle(colorStyle),
      onPressed: onPressed,
      child: child,
    );
  }

  FilledButton iconOnTop({
    required IconData icon,
    required ColorStyle colorStyle,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: _filledBtnStyle(colorStyle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return colorStyle.disabledForegroundColor;
              }
              return colorStyle.foregroundColor;
            }),
          ),
          HeightSpacer.xxs,
          if (child != null) child!,
        ],
      ),
    );
  }
}
