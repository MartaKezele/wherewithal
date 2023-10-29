import 'package:flutter/material.dart';

import '../../constants/spacers.dart';

const overlayOpacity = 0.6;

class LoadingOverlayWrapper extends StatelessWidget {
  const LoadingOverlayWrapper({
    super.key,
    required this.loading,
    this.loadingMessage,
    required this.child,
  });

  final bool loading;
  final String? loadingMessage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(overlayOpacity);
    final foregroundColor = Theme.of(context).colorScheme.surface;

    return Stack(
      children: [
        child,
        if (loading)
          ModalBarrier(
            dismissible: false,
            color: backgroundColor,
          ),
        if (loading)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: foregroundColor,
                ),
                HeightSpacer.lg,
                if (loadingMessage != null)
                  Text(
                    loadingMessage!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: foregroundColor,
                        ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
