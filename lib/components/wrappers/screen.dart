import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    this.appBar,
    required this.body,
  });

  final AppBar? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar theme controls system UI overlay style,
      // therefore the appBar needs to always be set,
      // even if it shouldn't be shown on the screen.
      // ToolbarHeight is set to 0 so that the appBar doesn't show
      // but the system UI overlay styling is applied.
      appBar: appBar ?? AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.md),
        child: body,
      ),
    );
  }
}
