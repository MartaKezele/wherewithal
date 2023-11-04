import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';
import 'icon.dart';

TextStyle? _appBarTitleTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge;

AppBarTheme lightAppBarTheme(BuildContext context) => AppBarTheme(
      backgroundColor: lightColorScheme.primaryContainer,
      foregroundColor: lightColorScheme.onPrimaryContainer,
      iconTheme: iconTheme.copyWith(
        color: lightColorScheme.onPrimaryContainer,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightColorScheme.primary,
      ),
      titleTextStyle: _appBarTitleTextStyle(context)?.copyWith(
        color: lightColorScheme.onPrimaryContainer,
      ),
    );

AppBarTheme darkAppBarTheme(BuildContext context) => AppBarTheme(
      backgroundColor: darkColorScheme.primaryContainer,
      foregroundColor: darkColorScheme.onPrimaryContainer,
      iconTheme: iconTheme.copyWith(
        color: darkColorScheme.onPrimaryContainer,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkColorScheme.onPrimary,
      ),
      titleTextStyle: _appBarTitleTextStyle(context)?.copyWith(
        color: darkColorScheme.onPrimaryContainer,
      ),
    );
