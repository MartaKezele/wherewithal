import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app_models/action_result.dart';
import '../../app_models/types/firestore_category.dart';
import '../../constants/styles/dropdown_form_field_button.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/category_reasons.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/form_field_validators.dart';
import 'custom_form.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({
    super.key,
    this.category,
    this.updateFn,
    this.addSubcategoryFn,
    required this.formKey,
    this.disableTransactionTypeField = false,
  });

  final models.Category? category;
  final Future<void> Function({
    double? budget,
    FieldValue budgetFieldValue,
    String? categoryReason,
    FieldValue categoryReasonFieldValue,
    String title,
    FieldValue titleFieldValue,
    String transactionType,
    FieldValue transactionTypeFieldValue,
  })? updateFn;
  final Future<CategoryDocumentReferenceType> Function(models.Category value)?
      addSubcategoryFn;
  final GlobalKey<FormState> formKey;
  final bool disableTransactionTypeField;

  @override
  State<CategoryForm> createState() => CategoryFormState();
}

class CategoryFormState extends State<CategoryForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _budgetController;

  CategoryReasons? _selectedCategoryReason;
  late TransactionTypes? _selectedTransactionType;

  models.Category categoryInfo() {
    assert(_selectedTransactionType != null);

    return models.Category(
      id: widget.category?.id ?? '',
      title: _titleController.text.trim(),
      transactionType: _selectedTransactionType!.name,
      categoryReason: _selectedCategoryReason?.name,
      budget: double.tryParse(_budgetController.text),
    );
  }

  Future<ActionResult> updateCategory() async {
    assert(widget.updateFn != null);

    final localizations = AppLocalizations.of(context);
    final category = categoryInfo();

    try {
      await widget.updateFn!(
        budget: category.budget,
        categoryReason: category.categoryReason,
        title: category.title,
        transactionType: category.transactionType,
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
    assert(widget.addSubcategoryFn != null);
    final localizations = AppLocalizations.of(context);

    try {
      await widget.addSubcategoryFn!(categoryInfo());

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

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.category?.title);
    _budgetController = TextEditingController(
      text: widget.category?.budget != null
          ? widget.category!.budget.toString()
          : null,
    );
    _selectedCategoryReason = CategoryReasons.fromName(
      widget.category?.categoryReason,
    );
    _selectedTransactionType = TransactionTypes.fromName(
      widget.category?.transactionType,
    );
    super.initState();
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

    final categoryReasonItems = CategoryReasons.values
        .map((categoryReason) => DropdownMenuItem(
              value: categoryReason,
              child: Text(
                categoryReason.localizedName(context),
              ),
            ))
        .toList();

    final transactionTypeItems = TransactionTypes.values
        .map((transactionType) => DropdownMenuItem(
              value: transactionType,
              child: Text(
                transactionType.localizedName(context),
                style: widget.disableTransactionTypeField
                    ? disabledDropdownTextStyle(context)
                    : dropdownTextStyle(context),
              ),
            ))
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
          validator: (title) => requiredValidator(
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
        DropdownButtonFormField(
          style: dropdownTextStyle(context),
          dropdownColor: dropdownColor(context),
          value: TransactionTypes.fromName(widget.category?.transactionType),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            label: Text('${localizations.transactionType}*'),
          ),
          items: transactionTypeItems,
          validator: (transactionType) => requiredValidator(
            transactionType?.name,
            AppLocalizations.of(context),
          ),
          onChanged: widget.disableTransactionTypeField
              ? null
              : (TransactionTypes? value) {
                  setState(() {
                    _selectedTransactionType = value;
                  });
                },
        ),
        Visibility(
          visible: _selectedTransactionType == TransactionTypes.expense,
          child: DropdownButtonFormField(
            style: dropdownTextStyle(context),
            dropdownColor: dropdownColor(context),
            value: _selectedCategoryReason,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              label: Text(localizations.reason),
            ),
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(
                  localizations.none,
                ),
              ),
              ...categoryReasonItems,
            ],
            onChanged: (value) {
              setState(() {
                _selectedCategoryReason = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
