import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/build_context.dart';

class Sub1CategoryView extends StatelessWidget {
  const Sub1CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('sub 1 category view'),
          FilledButton(
            onPressed: () => context.pushSub2CategoryView(
              categoryId: 1,
              sub1categoryId: 1,
              sub2categoryId: 1,
            ),
            child: const Text('go to sub 2 category view'),
          ),
        ],
      ),
    );
  }
}
