import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import 'analytics.dart';
import 'value_transaction_history.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final tabs = [
      Tab(
        icon: const Icon(Icons.bar_chart_rounded),
        text: localizations.analytics,
      ),
      Tab(
        icon: const Icon(Icons.history_rounded),
        text: localizations.history,
      ),
    ];

    final tabContents = [
      Analytics(),
      TransactionHistory(),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: TabBar(tabs: tabs),
          ),
          Expanded(
            child: TabBarView(
              children: tabContents,
            ),
          ),
        ],
      ),
    );
  }
}
