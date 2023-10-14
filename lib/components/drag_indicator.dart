import 'package:flutter/material.dart';

import '../constants/styles/overlay_banner.dart';

class DragIndicator extends StatelessWidget {
  const DragIndicator({
    super.key,
     this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(dragIndicatorContainerRadius),
        ),
        color: color,
      ),
      height: dragIndicatorHeight,
      width: dragIndicatorWidth,
      child: const SizedBox(),
    );
  }
}
