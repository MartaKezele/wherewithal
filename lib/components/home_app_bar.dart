import 'package:flutter/material.dart';

import '../../../extensions/build_context.dart';

PreferredSizeWidget homeAppBar({
  required String title,
  PreferredSizeWidget? bottom,
  required BuildContext context,
}) {
  return AppBar(
    title: Text(title),
    bottom: bottom,
    actions: [
      IconButton(
        onPressed: () => context.pushSettings(),
        icon: const Icon(Icons.settings_rounded),
      ),
    ],
  );
}
