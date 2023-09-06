import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../config/router.dart';
import '../styles/text_button.dart';

ColorStyle textBtnActionResultColorStyle({
  required bool resultSuccess,
}) =>
    resultSuccess ? TextButtonStyles.success : TextButtonStyles.error;

Color actionResultContainerColor({
  required bool resultSuccess,
}) {
  assert(navigatorKey.currentContext != null);
  return resultSuccess
      ? Theme.of(navigatorKey.currentContext!).colorScheme.tertiaryContainer
      : Theme.of(navigatorKey.currentContext!).colorScheme.errorContainer;
}

Color actionResultTextColor({
  required bool resultSuccess,
}) {
  assert(navigatorKey.currentContext != null);
  return resultSuccess
      ? Theme.of(navigatorKey.currentContext!).colorScheme.onTertiaryContainer
      : Theme.of(navigatorKey.currentContext!).colorScheme.onErrorContainer;
}
