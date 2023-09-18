import 'package:flutter/material.dart';

import '../../../components/wrappers/screen.dart';

class Sub2CategoryView extends StatelessWidget {
  const Sub2CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      body: const Column(
        children: [
          Text('sub 2 category view'),
        ],
      ),
    );
  }
}
