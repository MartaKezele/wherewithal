import 'package:flutter/material.dart';

import '../components/wrappers/screen.dart';
import '../constants/spacers.dart';
import '../l10n/app_localizations.dart';

class DataSetupScreen extends StatelessWidget {
  const DataSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Screen(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                localizations.creatingAccount,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          HeightSpacer.md,
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
