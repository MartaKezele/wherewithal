import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app_models/action_result.dart';
import '../../app_models/custom_dropdown_entry.dart';
import '../../change_notifiers/auth.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/category_reasons.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/dropdown/transaction_type_dropdown.dart';
import '../../utils/form_field_validators.dart';
import '../dropdown/custom_dropdown.dart';
import 'custom_form.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({
    super.key,
    this.category,
    required this.formKey,
    this.disableTransactionTypeField = false,
  });

  final models.Category? category;
  final GlobalKey<FormState> formKey;
  final bool disableTransactionTypeField;

  @override
  State<CategoryForm> createState() => CategoryFormState();
}

class CategoryFormState extends State<CategoryForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _budgetController;

  List<TransactionTypes> _selectedTransactionTypes = [];
  List<CategoryReasons> _selectedCategoryReasons = [];

  models.Category categoryInfo() {
    assert(_selectedTransactionTypes.isNotEmpty);

    return models.Category(
      id: widget.category?.id ?? '',
      title: _titleController.text.trim(),
      transactionType: _selectedTransactionTypes.first.name,
      categoryReason: _selectedCategoryReasons.first.name,
      parentCategoryId: widget.category?.parentCategoryId,
      budget: double.tryParse(_budgetController.text),
    );
  }

  Future<ActionResult> updateCategory() async {
    final localizations = AppLocalizations.of(context);
    final category = categoryInfo();

    // TODO we need to update category info in all transactions
    // using cloud functions
    try {
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .categories
          .doc(category.id)
          .update(
            title: category.title,
            transactionType: category.transactionType,
            categoryReason: category.categoryReason,
            budget: category.budget,
          );

      return ActionResult(
        success: true,
        messageTitle: localizations.updatedCategory,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotUpdateCategory,
      );
    }
  }

  Future<ActionResult> addCategory() async {
    final localizations = AppLocalizations.of(context);

    try {
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .categories
          .add(categoryInfo());

      return ActionResult(
        success: true,
        messageTitle: localizations.createdCategory,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotCreateCategory,
      );
    }
  }

  void _initTransactionType() {
    if (widget.category != null) {
      final transactionType = TransactionTypes.fromName(
        widget.category!.transactionType,
      );
      if (transactionType != null) {
        _selectedTransactionTypes = [transactionType];
      }
    }
  }

  void _initCategoryReason() {
    if (widget.category != null) {
      final categoryReason = CategoryReasons.fromName(
        widget.category?.categoryReason,
      );
      if (categoryReason != null) {
        _selectedCategoryReasons = [categoryReason];
      }
    }
  }

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.category?.title);
    _budgetController = TextEditingController(
      text: widget.category?.budget != null
          ? widget.category!.budget.toString()
          : null,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initTransactionType();
    _initCategoryReason();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final transactionTypeOptions = TransactionTypes.values
        .map(
          (transactionType) => transactionTypeDropdownEntry(
            transactionType,
            context,
          ),
        )
        .toList();

    final categoryReasonOptions = CategoryReasons.values
        .map(
          (categoryReason) => CustomDropdownEntry(
            value: categoryReason,
            title: categoryReason.localizedName(context),
          ),
        )
        .toList();

    return CustomForm(
      formKey: widget.formKey,
      contents: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            label: Text('${localizations.title}*'),
          ),
          autocorrect: false,
          validator: (title) => requiredTextValidator(
            title,
            AppLocalizations.of(context),
          ),
        ),
        TextFormField(
          controller: _budgetController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: Text(localizations.budget),
          ),
        ),
        CustomDropdown<TransactionTypes>(
          options: transactionTypeOptions,
          selectedOptions: _selectedTransactionTypes
              .map((transactionType) =>
                  transactionTypeDropdownEntry(transactionType, context))
              .toList(),
          onSelectionChanged: (selection) {
            setState(() {
              _selectedTransactionTypes = selection
                  .map((dropdownEntry) => dropdownEntry.value)
                  .toList();
            });
          },
          title: localizations.transactionType,
          required: true,
        ),
        Visibility(
          visible: _selectedTransactionTypes.isNotEmpty &&
              _selectedTransactionTypes.first == TransactionTypes.expense,
          child: CustomDropdown<CategoryReasons>(
            options: categoryReasonOptions,
            selectedOptions: _selectedCategoryReasons
                .map((categoryReason) => CustomDropdownEntry(
                    value: categoryReason,
                    title: categoryReason.localizedName(context)))
                .toList(),
            onSelectionChanged: (selection) {
              setState(() {
                _selectedCategoryReasons = selection
                    .map((dropdownEntry) => dropdownEntry.value)
                    .toList();
              });
            },
            title: localizations.reason,
          ),
        ),
      ],
    );
  }
}
