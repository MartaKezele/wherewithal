import 'package:flutter/material.dart';

import '../components/wrappers/screen.dart';
import '../utils/app_localizations.dart';

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
          Text(title ?? AppLocalizations.of(context).genericErrorMsg),
          if (description != null) Text(description!),
        ],
      ),
    );
  }
}
