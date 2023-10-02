import 'package:flutter/material.dart';

import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';

const tabIndicatorWidth = 3.0;

final lightTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: BoxDecoration(
    color: lightColorScheme.inversePrimary,
    border: Border(
      bottom: BorderSide(
        color: lightColorScheme.onPrimaryContainer,
        width: tabIndicatorWidth,
      ),
    ),
  ),
  labelColor: lightColorScheme.onPrimaryContainer,
  unselectedLabelColor: lightColorScheme.secondary,
);

final darkTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: BoxDecoration(
    color: darkColorScheme.inversePrimary,
    border: Border(
      bottom: BorderSide(
        color: darkColorScheme.onPrimaryContainer,
        width: tabIndicatorWidth,
      ),
    ),
  ),
  labelColor: darkColorScheme.onPrimaryContainer,
  unselectedLabelColor: darkColorScheme.onSurface,
);
