import 'package:flutter/material.dart';

import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import 'icon.dart';

const _bottomNavigationBarThemeData = BottomNavigationBarThemeData(
  selectedIconTheme: iconTheme,
  unselectedIconTheme: iconTheme,
);

final lightBottomNavigationBarThemeData =
    _bottomNavigationBarThemeData.copyWith(
  backgroundColor: lightColorScheme.primaryContainer,
  selectedItemColor: lightColorScheme.onPrimaryContainer,
  unselectedItemColor: lightColorScheme.secondary,
);

final darkBottomNavigationBarThemeData =
    _bottomNavigationBarThemeData.copyWith(
  backgroundColor: darkColorScheme.primaryContainer,
  selectedItemColor: darkColorScheme.onPrimaryContainer,
  unselectedItemColor: darkColorScheme.onSurface,
);
