import 'package:flutter/material.dart';

import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';

TextTheme lightTextTheme(BuildContext context) =>
    Theme.of(context).textTheme.apply(
          bodyColor: lightColorScheme.onSurface,
          displayColor: lightColorScheme.onSurface,
        );

TextTheme darkTextTheme(BuildContext context) =>
    Theme.of(context).textTheme.apply(
          bodyColor: darkColorScheme.onSurface,
          displayColor: darkColorScheme.onSurface,
        );
