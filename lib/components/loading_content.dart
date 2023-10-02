import 'package:flutter/material.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
