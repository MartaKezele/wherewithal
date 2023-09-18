import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/build_context.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('category view'),
          FilledButton(
            onPressed: () => context.pushSub1CategoryView(
              categoryId: 1,
              sub1categoryId: 1,
            ),
            child: const Text('go to sub 1 category view'),
          ),
        ],
      ),
    );
  }
}
