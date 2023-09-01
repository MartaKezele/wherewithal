import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    // TODO finish error screen
    return Screen(
      appBar: AppBar(),
      child: Column(
        children: [
          Text(title ?? 'Generic error message'),
          if (description != null) Text(description!),
        ],
      ),
    );
  }
}
