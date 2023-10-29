import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final AppBar? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar theme controls system UI overlay style,
      // therefore the appBar needs to always be set,
      // even if it shouldn't be shown on the screen.
      // ToolbarHeight is set to 0 so that the appBar doesn't show
      // but the system UI overlay styling is applied.
      appBar: appBar ?? AppBar(toolbarHeight: 0),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.md),
        child: body,
      ),
    );
  }
}
