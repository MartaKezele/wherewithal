import 'package:flutter/material.dart';

import '../app_models/color_style.dart';

ColorStyle currentThemeColorStyle({
  required BuildContext context,
  required ColorStyle darkColorStyle,
  required ColorStyle lightColorStyle,
}) {
  return Theme.of(context).brightness == Brightness.dark
      ? darkColorStyle
      : lightColorStyle;
}
