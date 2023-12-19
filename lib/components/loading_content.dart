import 'package:flutter/material.dart';

import '../constants/padding_size.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({
    super.key,
    this.color,
    this.title,
  });

  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: PaddingSize.md,
            ),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        CircularProgressIndicator(
          color: color ?? Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }
}
