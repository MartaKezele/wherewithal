import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/action_result.dart';
import '../../app_models/custom_dropdown_entry.dart';
import '../../change_notifiers/auth.dart';
import '../../change_notifiers/currency.dart';
import '../../constants/padding_size.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/dropdown/category_dropdown.dart';
import '../../utils/dropdown/transaction_type_dropdown.dart';
import '../../utils/form_field_validators.dart';
import '../dropdown/custom_dropdown.dart';
import '../error_content.dart';
import '../loading_content.dart';
import 'custom_form.dart';
import 'form_fields/date_form_field.dart';

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

    final currencySymbol = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    final valuePrefixSuffixTextStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: _selectedTransactionTypes.first.foregroundColor(context),
            );

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
        TextFormField(
          controller: _valueController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: Text('${localizations.value}*'),
            prefix: Container(
              padding: const EdgeInsets.only(
                right: PaddingSize.xxs,
              ),
              child: Text(
                _selectedTransactionTypes.first.operand,
                style: valuePrefixSuffixTextStyle,
              ),
            ),
            suffix: Container(
              padding: const EdgeInsets.only(
                left: PaddingSize.xxs,
              ),
              child: Text(
                '$currencySymbol',
                style: valuePrefixSuffixTextStyle,
              ),
            ),
          ),
          validator: (value) => requiredDoubleValidator(
            value,
            AppLocalizations.of(
              context,
            ),
          ),
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
        CustomDropdown<TransactionTypes>(
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
        ),
        FirestoreBuilder<models.CategoryQuerySnapshot>(
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
              selectedOptions: _selectedCategories
                  .map((category) =>
                      categoryDropdownEntries(category, docs, context))
                  .toList(),
              onSelectionChanged: (selection) {
                setState(() {
                  _selectedCategories = selection
                      .map((dropdownEntry) => dropdownEntry.value)
                      .toList();
                });
              },
              options: baseCategories.map((categoryDoc) {
                return categoryDropdownEntries(
                  categoryDoc.data,
                  docs,
                  context,
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
