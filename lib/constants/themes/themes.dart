import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';
import 'app_bar.dart';
import 'bottom_navigation_bar.dart';
import 'button.dart';
import 'card.dart';
import 'dialog.dart';
import 'floating_action_button.dart';
import 'list_tile.dart';
import 'tab_bar.dart';
import 'text.dart';

const themeMode = {
  AdaptiveThemeMode.light: ThemeMode.light,
  AdaptiveThemeMode.dark: ThemeMode.dark,
  AdaptiveThemeMode.system: ThemeMode.system,
};

final _themeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'MPLUSRounded1c',
);

ThemeData lightColorTheme(BuildContext context) => _themeData.copyWith(
      colorScheme: lightColorScheme,
      appBarTheme: lightAppBarTheme(context),
      scaffoldBackgroundColor: lightColorScheme.surface,
      floatingActionButtonTheme: lightFabThemeData,
      bottomNavigationBarTheme: lightBottomNavigationBarThemeData,
      listTileTheme: lightListTileThemeData,
      textTheme: lightTextTheme(context),
      filledButtonTheme: filledButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      tabBarTheme: lightTabBarTheme,
      dialogTheme: lightDialogTheme,
      cardTheme: lightCardTheme,
    );

ThemeData darkColorTheme(BuildContext context) => _themeData.copyWith(
      colorScheme: darkColorScheme,
      appBarTheme: darkAppBarTheme(context),
      scaffoldBackgroundColor: darkColorScheme.surface,
      floatingActionButtonTheme: darkFabThemeData,
      bottomNavigationBarTheme: darkBottomNavigationBarThemeData,
      listTileTheme: darkListTileThemeData,
      textTheme: darkTextTheme(context),
      filledButtonTheme: filledButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      tabBarTheme: darkTabBarTheme,
      dialogTheme: darkDialogTheme,
      cardTheme: darkCardTheme,
    );
