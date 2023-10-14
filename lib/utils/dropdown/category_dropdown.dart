import 'package:flutter/material.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;

CustomDropdownEntry<models.Category> categoryDropdownEntries(
  models.Category category,
  List<models.CategoryQueryDocumentSnapshot> categoriesDocs,
  BuildContext context,
) {
  return CustomDropdownEntry<models.Category>(
    value: category,
    title: category.title,
    foregroundColor: TransactionTypes.fromName(
      category.transactionType,
    )?.foregroundColor(context),
    backgroundColor: TransactionTypes.fromName(
      category.transactionType,
    )?.backgroundColor(context),
    subEntries: categoriesDocs
        .where((element) => element.data.parentCategoryId == category.id)
        .map(
          (categoryDoc) => categoryDropdownEntries(
            categoryDoc.data,
            categoriesDocs,
            context,
          ),
        )
        .toList(),
  );
}
