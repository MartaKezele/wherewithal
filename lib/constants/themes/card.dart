import 'package:flutter/material.dart';

import '../color_schemes/dark.dart';
import '../color_schemes/light.dart';
import '../styles/container.dart';

Color cardForegroundColor(BuildContext context) =>
    Theme.of(context).colorScheme.onSurfaceVariant;

const _cardTheme = CardTheme(
  shape: containerShape,
);

final lightCardTheme = _cardTheme.copyWith(
  color: lightColorScheme.surfaceVariant,
);

final darkCardTheme = _cardTheme.copyWith(
  color: darkColorScheme.surfaceVariant,
);
