import 'package:flutter/material.dart';

import '../../constants/icon_size.dart';

// TODO delete if not needed later on
class LoadingIconButton extends StatelessWidget {
  const LoadingIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.isLoading,
    required this.constructor,
  });

  final IconData icon;

  final void Function() onPressed;
  final bool isLoading;
  final Widget Function({
    required Widget icon,
    required void Function()? onPressed,
    bool autofocus,
  }) constructor;

  @override
  Widget build(BuildContext context) {
    return constructor(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox(
              width: IconSize.md,
              height: IconSize.md,
              child: CircularProgressIndicator(),
            )
          : Icon(
              icon,
              size: IconSize.md,
            ),
    );
  }
}
