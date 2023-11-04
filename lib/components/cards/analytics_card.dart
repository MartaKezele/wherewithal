import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/container.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surfaceVariant;
    final foregroundColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Card(
      shape: containerShape,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(PaddingSize.sm),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: foregroundColor),
              ),
            ),
            HeightSpacer.xxs,
            Divider(
              color: foregroundColor,
            ),
            HeightSpacer.sm,
            child,
          ],
        ),
      ),
    );
  }
}
