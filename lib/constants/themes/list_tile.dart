import 'package:flutter/material.dart';

import '../../config/color_schemes/dark.dart';
import '../../config/color_schemes/light.dart';
import '../padding_size.dart';

const _listTileContentPadding = EdgeInsets.symmetric(
  horizontal: PaddingSize.md,
  vertical: PaddingSize.xxs,
);

const _listTileThemeData = ListTileThemeData(
  contentPadding: _listTileContentPadding,
);

final lightListTileThemeData = _listTileThemeData.copyWith(
  iconColor: lightColorScheme.onSurface,
  textColor: lightColorScheme.onSurface,
);

final darkListTileThemeData = _listTileThemeData.copyWith(
  iconColor: darkColorScheme.onSurface,
  textColor: darkColorScheme.onSurface,
);

const leadingIconSize = PaddingSize.lg;