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

class CategoryFormField extends StatelessWidget {
  const CategoryFormField({
    super.key,
    required this.onSelectionChanged,
    required this.selectedCategories,
    required this.categoriesRef,
    this.required = false,
  });

  final FirestoreListenable<models.CategoryQuerySnapshot> categoriesRef;
  final List<models.Category> selectedCategories;
  final void Function(List<CustomDropdownEntry<models.Category>>)
      onSelectionChanged;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return FirestoreBuilder(
      ref: categoriesRef,
      builder: (
        context,
        snapshot,
        child,
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

        return CustomDropdown(
          title: localizations.category,
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
          required: required,
        );
      },
    );
  }
}
