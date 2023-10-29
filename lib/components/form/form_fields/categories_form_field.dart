import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';

import '../../../app_models/custom_dropdown_entry.dart';
import '../../../constants/padding_size.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart' as models;
import '../../../utils/dropdown/category_dropdown.dart';
import '../../dropdown/custom_dropdown.dart';
import '../../error_content.dart';
import '../../loading_content.dart';

class CategoriesFormField extends StatelessWidget {
  const CategoriesFormField({
    super.key,
    required this.onSelectionChanged,
    required this.selectedCategories,
    required this.categoriesRef,
  });

  final FirestoreListenable<models.CategoryQuerySnapshot> categoriesRef;
  final List<models.Category> selectedCategories;
  final void Function(List<CustomDropdownEntry<models.Category>>)
      onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return FirestoreBuilder<models.CategoryQuerySnapshot>(
      ref: categoriesRef,
      builder: (
        context,
        AsyncSnapshot<models.CategoryQuerySnapshot> snapshot,
        Widget? child,
      ) {
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(PaddingSize.md),
            child: ErrorContent(
              text: localizations.couldNotLoadCategoriesFilter,
            ),
          );
        }

        if (!snapshot.hasData) {
          return const LoadingContent();
        }

        final docs = snapshot.requireData.docs;

        final baseCategories = docs.where(
          (element) => element.data.parentCategoryId == null,
        );

        return CustomDropdown<models.Category>(
          title: localizations.categories,
          selectedOptions: selectedCategories
              .map((category) =>
                  categoryDropdownEntries(category, docs, context))
              .toList(),
          onSelectionChanged: onSelectionChanged,
          options: baseCategories.map((categoryDoc) {
            return categoryDropdownEntries(
              categoryDoc.data,
              docs,
              context,
            );
          }).toList(),
          required: true,
        );
      },
    );
  }
}
