import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../styles/text_button.dart';

ColorStyle textBtnActionResultColorStyle({
  required bool resultSuccess,
}) =>
    resultSuccess ? TextButtonStyles.success : TextButtonStyles.error;

Color actionResultContainerColor({
  required BuildContext context,
  required bool resultSuccess,
}) {
  return resultSuccess
      ? Theme.of(context).colorScheme.tertiaryContainer
      : Theme.of(context).colorScheme.errorContainer;
}

Color actionResultTextColor({
  required BuildContext context,
  required bool resultSuccess,
}) {
  return resultSuccess
      ? Theme.of(context).colorScheme.onTertiaryContainer
      : Theme.of(context).colorScheme.onErrorContainer;
}
