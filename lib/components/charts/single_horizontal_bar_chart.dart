import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/styles/container.dart';

const _horizontalBarChartHeight = 30.0;

class SingleHorizontalBarChart extends StatelessWidget {
  const SingleHorizontalBarChart({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _horizontalBarChartHeight,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(containerBorderRadius),
            ),
            color: Theme.of(context).colorScheme.outline.withOpacity(0.6),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: min(1, percentage / 100),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(containerBorderRadius),
                  ),
                  color: percentage <= 100.0
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
