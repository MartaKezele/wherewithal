import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../change_notifiers/auth.dart';
import '../../../components/categories_list_view.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../models/models.dart' as models;

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = TransactionTypes.values
        .map(
          (transactionType) => Tab(
            icon: Icon(transactionType.icon),
            text: transactionType.localizedName(context),
          ),
        )
        .toList();

    final tabContents = TransactionTypes.values.map((transactionType) {
      return CategoriesListView(
        ref: models.usersRef
            .doc(GetIt.I<AuthChangeNotifier>().id)
            .categories
            .whereTransactionType(isEqualTo: transactionType.name)
            .whereParentCategoryId(isNull: true)
            .orderByTitle(),
        foregroundColor: transactionType.foregroundColor(context),
      );
    }).toList();

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
