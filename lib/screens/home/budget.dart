import 'package:flutter/material.dart';

import '../../components/home_app_bar.dart';
import '../../l10n/app_localizations.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: homeAppBar(
        title: localizations.budget,
        context: context,
      ),
      body: Placeholder(
        child: Text(localizations.budget),
      ),
    );
  }
}
