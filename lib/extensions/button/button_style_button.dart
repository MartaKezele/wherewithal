import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../app_models/types/button_constructor.dart';
import '../../constants/icon_size.dart';
import '../../constants/padding_size.dart';
import '../../constants/themes/container.dart';

extension Loading on ButtonStyleButton {
  ButtonStyleButton loadingBtn({
    required ButtonConstructor constructor,
    required bool isLoading,
    required ColorStyle colorStyle,
    Widget? icon,
  }) {
    return constructor(
      onPressed: enabled
          ? isLoading
              ? null
              : onPressed
          : null,
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            SizedBox(
              width: IconSize.md,
              height: IconSize.md,
              child: CircularProgressIndicator(
                color: colorStyle.disabledForegroundColor,
              ),
            ),
          if (icon != null && !isLoading)
            SizedBox(
              width: IconSize.md,
              height: IconSize.md,
              child: icon,
            ),
          const SizedBox(
            width: PaddingSize.xs,
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

extension Padding on ButtonStyleButton {
  static const _bigHeight = 65.0;
  static const _mediumHeight = 50.0;
  static const _bottomSheetHeight = 160.0;

  ButtonStyleButton addBigHeight({
    required ButtonConstructor constructor,
  }) {
    return _addHeightAndShape(
      constructor: constructor,
      height: _bigHeight,
    );
  }

  ButtonStyleButton addMediumHeight({
    required ButtonConstructor constructor,
  }) {
    return _addHeightAndShape(
      constructor: constructor,
      height: _mediumHeight,
    );
  }

  ButtonStyleButton addBottomSheetStyle({
    required ButtonConstructor constructor,
    required OutlinedBorder shape,
  }) {
    return _addHeightAndShape(
      constructor: constructor,
      height: _bottomSheetHeight,
      shape: shape,
    );
  }

  ButtonStyleButton _addHeightAndShape({
    required ButtonConstructor constructor,
    required double height,
    OutlinedBorder shape = containerShape,
  }) {
    return constructor(
      style: (style ?? const ButtonStyle()).copyWith(
        fixedSize: MaterialStatePropertyAll(
          Size(
            double.infinity,
            height,
          ),
        ),
        shape: MaterialStatePropertyAll(
          shape,
        ),
      ),
      onPressed: onPressed,
      child: child ??
          const Placeholder(
            child: Text('Child param not passed to button.'),
          ),
    );
  }
}
