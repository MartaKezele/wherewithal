import 'package:flutter/material.dart';
import 'package:wherewithal/extensions/build_context.dart';

import '../../../l10n/app_localizations.dart';
import '../../../mock_data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final tabs = [
      Tab(
        icon: const Icon(Icons.remove_rounded),
        text: localizations.expense,
      ),
      Tab(
        icon: const Icon(Icons.add_rounded),
        text: localizations.income,
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: TabBar(
              tabs: tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  children: MockData.expenseCategories
                      .map(
                        (category) => ListTile(
                          title: Text(category.title),
                          trailing: category.budget != null
                              ? Text('${category.budget}')
                              : null,
                          textColor:
                              Theme.of(context).colorScheme.onErrorContainer,
                          onTap: () => context.pushCategoryView(
                            categoryId: category.id,
                          ),
                        ),
                      )
                      .toList(),
                ),
                ListView(
                  children: MockData.incomeCategories
                      .map(
                        (category) => ListTile(
                          title: Text(category.title),
                          trailing: category.budget != null
                              ? Text('${category.budget}')
                              : null,
                          textColor:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          onTap: () => context.pushCategoryView(
                            categoryId: category.id,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
