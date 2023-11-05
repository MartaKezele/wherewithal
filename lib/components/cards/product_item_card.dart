import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../change_notifiers/auth.dart';
import '../../constants/padding_size.dart';
import '../../constants/styles/container.dart';
import '../../constants/styles/icon_button.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../form/form_fields/categories_form_field.dart';
import '../form/form_fields/price_value_form_field.dart';

import '../../models/models.dart' as models;
import '../../extensions/button/icon_button.dart';

class ProductItemCard extends StatelessWidget with GetItMixin {
  ProductItemCard({
    super.key,
    required this.titleController,
    required this.priceValueController,
    this.category,
    required this.onCategorySelectionChanged,
    required this.onRemove,
  });

  final TextEditingController titleController;
  final TextEditingController priceValueController;
  final models.Category? category;
  final void Function(List<CustomDropdownEntry<models.Category>>)
      onCategorySelectionChanged;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    models.CategoryQuery categoriesRef = models.usersRef
        .doc(userId)
        .categories
        .whereTransactionType(
          isEqualTo: TransactionTypes.expense.name,
        )
        .orderByTitle();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: PaddingSize.md,
            right: PaddingSize.md,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: const BorderRadius.all(
                Radius.circular(containerBorderRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: PaddingSize.md,
                right: PaddingSize.md,
                bottom: PaddingSize.md,
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      label: Text(localizations.title),
                    ),
                    autocorrect: false,
                  ),
                  PriceValueFormField(
                    controller: priceValueController,
                    transactionType: TransactionTypes.expense,
                  ),
                  CategoriesFormField(
                    onSelectionChanged: onCategorySelectionChanged,
                    selectedCategories: [if (category != null) category!],
                    categoriesRef: categoriesRef,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton.filled(
            onPressed: onRemove,
            icon: const Icon(Icons.close_rounded),
          ).colorStyle(FilledIconButtonStyles.error),
        ),
      ],
    );
  }
}
