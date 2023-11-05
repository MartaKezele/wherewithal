import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/action_result.dart';
import '../../app_models/custom_dropdown_entry.dart';
import '../../change_notifiers/auth.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/dropdown/transaction_type_dropdown.dart';
import '../dropdown/custom_dropdown.dart';
import 'custom_form.dart';
import 'form_fields/categories_form_field.dart';
import 'form_fields/date_form_field.dart';
import 'form_fields/price_value_form_field.dart';

class ValueTransactionForm extends StatefulWidget
    with GetItStatefulWidgetMixin {
  ValueTransactionForm({
    super.key,
    this.valueTransaction,
    required this.formKey,
    this.transactionType,
  });

  final GlobalKey<FormState> formKey;
  final models.ValueTransaction? valueTransaction;
  final TransactionTypes? transactionType;

  @override
  State<ValueTransactionForm> createState() => ValueTransactionFormState();
}

class ValueTransactionFormState extends State<ValueTransactionForm>
    with GetItStateMixin {
  late final TextEditingController _titleController;
  late final TextEditingController _valueController;

  DateTime? _dateTime;
  List<TransactionTypes> _selectedTransactionTypes = [];
  List<models.Category> _selectedCategories = [];

  models.ValueTransaction _valueTransactionInfo() {
    final value = double.tryParse(_valueController.text);

    assert(value != null);
    assert(_dateTime != null);
    assert(_selectedTransactionTypes.isNotEmpty);
    assert(_selectedCategories.isNotEmpty);

    return models.ValueTransaction(
      id: widget.valueTransaction?.id ?? '',
      title: _titleController.text.isEmpty ? null : _titleController.text,
      dateTime: _dateTime!,
      value: value!,
      categoryId: _selectedCategories.first.id,
      categoryTitle: _selectedCategories.first.title,
      categoryTransactionType: _selectedTransactionTypes.first.name,
      categoryReason: _selectedCategories.first.categoryReason,
      parentCategoryId: _selectedCategories.first.parentCategoryId,
    );
  }

  Future<ActionResult> updateValueTransaction() async {
    final localizations = AppLocalizations.of(context);
    final valueTransaction = _valueTransactionInfo();

    try {
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .valueTransactions
          .doc(valueTransaction.id)
          .update(
            title: valueTransaction.title,
            dateTime: valueTransaction.dateTime,
            value: valueTransaction.value,
            categoryId: valueTransaction.categoryId,
            categoryTitle: valueTransaction.categoryTitle,
            categoryTransactionType: valueTransaction.categoryTransactionType,
            categoryReason: valueTransaction.categoryReason,
            parentCategoryId: valueTransaction.parentCategoryId,
          );
      return ActionResult(
        success: true,
        messageTitle: localizations.updatedTransaction,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotUpdateTransaction,
      );
    }
  }

  Future<ActionResult> addValueTransaction() async {
    final localizations = AppLocalizations.of(context);

    try {
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .valueTransactions
          .add(_valueTransactionInfo());

      return ActionResult(
        success: true,
        messageTitle: localizations.createdTransaction,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotCreateTransaction,
      );
    }
  }

  Future<void> _initCategoryData() async {
    if (widget.valueTransaction != null) {
      setState(() {
        _selectedCategories = [
          models.Category(
            id: widget.valueTransaction!.categoryId,
            title: widget.valueTransaction!.categoryTitle,
            transactionType: widget.valueTransaction!.categoryTransactionType,
            categoryReason: widget.valueTransaction!.categoryReason,
          )
        ];
      });
    }
  }

  Future<void> _initTransactionTypeData() async {
    final selectedTransactionType = TransactionTypes.fromName(
          widget.valueTransaction?.categoryTransactionType,
        ) ??
        widget.transactionType;

    if (selectedTransactionType != null) {
      _selectedTransactionTypes.add(
        selectedTransactionType,
      );
    }
  }

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.valueTransaction?.title,
    );

    _valueController = TextEditingController(
      text: widget.valueTransaction?.value != null
          ? widget.valueTransaction!.value.toString()
          : null,
    );

    _dateTime = widget.valueTransaction?.dateTime ?? DateTime.now();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initTransactionTypeData();
    _initCategoryData();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    models.CategoryQuery categoriesRef =
        models.usersRef.doc(userId).categories.orderByTitle();

    if (_selectedTransactionTypes.isNotEmpty) {
      categoriesRef = categoriesRef.whereTransactionType(
        whereIn: _selectedTransactionTypes
            .map((dropdownEntry) => dropdownEntry.name)
            .toList(),
      );
    }

    return CustomForm(
      formKey: widget.formKey,
      contents: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            label: Text(localizations.title),
          ),
          autocorrect: false,
        ),
        PriceValueFormField(
          controller: _valueController,
          transactionType: _selectedTransactionTypes.first,
        ),
        DateFormField(
          required: true,
          setDateTime: (dateTime) {
            setState(() {
              _dateTime = dateTime;
            });
          },
          dateTime: _dateTime,
        ),
        CustomDropdown(
          options: TransactionTypes.values
              .map(
                (transactionType) => CustomDropdownEntry(
                  value: transactionType,
                  title: transactionType.localizedName(context),
                  foregroundColor: transactionType.foregroundColor(context),
                  backgroundColor: transactionType.backgroundColor(context),
                ),
              )
              .toList(),
          selectedOptions: _selectedTransactionTypes
              .map((transactionType) =>
                  transactionTypeDropdownEntry(transactionType, context))
              .toList(),
          onSelectionChanged: (selection) {
            final selectedTransactionTypeNames =
                selection.map((dropdownEntry) => dropdownEntry.value.name);

            setState(() {
              _selectedTransactionTypes = selection
                  .map((dropdownEntry) => dropdownEntry.value)
                  .toList();
              _selectedCategories.removeWhere(
                (element) => !selectedTransactionTypeNames.contains(
                  element.transactionType,
                ),
              );
            });
          },
          title: localizations.transactionType,
          required: true,
        ),
        CategoriesFormField(
          onSelectionChanged: (selection) {
            setState(() {
              _selectedCategories = selection
                  .map((dropdownEntry) => dropdownEntry.value)
                  .toList();
            });
          },
          selectedCategories: _selectedCategories,
          categoriesRef: categoriesRef,
        ),
      ],
    );
  }
}
