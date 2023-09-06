import 'package:flutter/material.dart';

import '../app_models/color_style.dart';
import '../config/router.dart';

ColorStyle currentThemeColorStyle({
  required ColorStyle darkColorStyle,
  required ColorStyle lightColorStyle,
}) {
  assert(navigatorKey.currentContext != null);
  return Theme.of(navigatorKey.currentContext!).brightness == Brightness.dark
      ? darkColorStyle
      : lightColorStyle;
}
