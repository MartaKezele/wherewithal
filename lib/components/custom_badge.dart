import 'package:flutter/material.dart';

import '../constants/padding_size.dart';
import '../constants/styles/badge.dart';
import '../constants/styles/container.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: badgeWidth,
      padding: const EdgeInsets.all(PaddingSize.xxs),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(containerBorderRadius),
        ),
      ),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: foregroundColor,
            ),
      ),
    );
  }
}
