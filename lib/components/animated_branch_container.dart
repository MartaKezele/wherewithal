import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

const _animationDurationMs = 200;

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (index, navigator) {
          return AnimatedOpacity(
            opacity: index == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: _animationDurationMs),
            child: _branchNavigatorWrapper(index, navigator),
          );
        },
      ).toList(),
    );
  }
}
