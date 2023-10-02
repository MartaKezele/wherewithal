import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class NoDataContent extends StatelessWidget {
  const NoDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).noData,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
