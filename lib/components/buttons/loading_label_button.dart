import 'package:flutter/material.dart';

import '../../constants/icon_size.dart';
import '../../constants/padding_size.dart';

class LoadingLabelButton extends StatelessWidget {
  const LoadingLabelButton({
    super.key,
    this.icon,
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.constructor,
    this.enabled = true,
  });

  final IconData? icon;
  final String label;
  final void Function() onPressed;
  final bool isLoading;
  final ButtonStyleButton Function({
    required Widget child,
    required void Function()? onPressed,
  }) constructor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return constructor(
      onPressed: enabled
          ? isLoading
              ? null
              : onPressed
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              width: IconSize.md,
              height: IconSize.md,
              child: CircularProgressIndicator(),
            ),
          if (icon != null && !isLoading) Icon(icon, size: IconSize.md),
          const SizedBox(
            width: PaddingSize.xs,
          ),
          Text(label),
        ],
      ),
    );
  }
}
