import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/themes/card.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.child,
    this.showDivider = true,
    this.showSpacer = true,
  });

  final String title;
  final Widget child;
  final bool showDivider;
  final bool showSpacer;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    ?.copyWith(color: cardForegroundColor(context)),
              ),
            ),
            HeightSpacer.xxs,
            if (showDivider)
              Divider(
                color: cardForegroundColor(context),
              ),
            if (showSpacer) HeightSpacer.sm,
            child,
          ],
        ),
      ),
    );
  }
}
