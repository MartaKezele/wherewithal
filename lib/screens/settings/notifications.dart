import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      body: const Placeholder(
        child: Text('Notifications'),
      ),
    );
  }
}
