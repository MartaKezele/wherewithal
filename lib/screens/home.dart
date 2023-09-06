import 'package:flutter/material.dart';

import '../extensions/build_context.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.pushSettings(),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
