import 'package:flutter/material.dart';

import '../../app_models/color_style.dart';
import '../../app_models/types/button_constructor.dart';
import '../../constants/icon_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/container.dart';

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
          if (icon != null || isLoading) WidthSpacer.xs,
          if (child != null) child!,
        ],
      ),
    );
  }
}

extension Styles on ButtonStyleButton {
  static const _bigHeight = 65.0;
  static const _mediumHeight = 50.0;
  static const _bottomSheetHeight = 160.0;

  ButtonStyleButton bigHeight({
    required ButtonConstructor constructor,
  }) {
    return _heightAndShape(
      constructor: constructor,
      height: _bigHeight,
    );
  }

  ButtonStyleButton mediumHeight({
    required ButtonConstructor constructor,
  }) {
    return _heightAndShape(
      constructor: constructor,
      height: _mediumHeight,
    );
  }

  ButtonStyleButton bottomSheetStyle({
    required ButtonConstructor constructor,
    required OutlinedBorder shape,
  }) {
    return _heightAndShape(
      constructor: constructor,
      height: _bottomSheetHeight,
      shape: shape,
    );
  }

  ButtonStyleButton _heightAndShape({
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
