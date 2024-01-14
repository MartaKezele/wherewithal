import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/action_result.dart';
import '../../app_models/cron_recurrence_interval.dart';
import '../../app_models/custom_dropdown_entry.dart';
import '../../app_models/months.dart';
import '../../app_models/recurrence_intervals.dart';
import '../../app_models/week_days.dart';
import '../../change_notifiers/auth.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../models/models.dart' as models;
import '../../utils/dropdown/transaction_type_dropdown.dart';
import '../dropdown/custom_dropdown.dart';
import 'custom_form.dart';
import 'form_fields/category_form_field.dart';
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

  RecurrenceIntervals? _selectedRecurrenceInterval;
  CronRecurrenceInterval? _selectedCron;

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
      recurrenceInterval: _selectedCron?.cronExpression,
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
            recurrenceInterval: valueTransaction.recurrenceInterval,
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
            parentCategoryId: widget.valueTransaction!.parentCategoryId,
          ),
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

  void _onTransactionTypesChanged(
    List<CustomDropdownEntry<TransactionTypes>> selection,
  ) {
    final selectedTransactionTypeNames =
        selection.map((dropdownEntry) => dropdownEntry.value.name);

    setState(() {
      _selectedTransactionTypes =
          selection.map((dropdownEntry) => dropdownEntry.value).toList();
      _selectedCategories.removeWhere(
        (element) => !selectedTransactionTypeNames.contains(
          element.transactionType,
        ),
      );
    });
  }

  void _onRecurrenceIntervalChanged(
    List<CustomDropdownEntry<RecurrenceIntervals?>> selection,
  ) {
    setState(() {
      if (selection.isNotEmpty) {
        _selectedRecurrenceInterval = selection.first.value;

        if (_selectedRecurrenceInterval != RecurrenceIntervals.oneTime &&
            _selectedCron == null) {
          _dateTime = DateTime.now();
          _selectedCron = CronRecurrenceInterval();
        }

        switch (selection.first.value) {
          case RecurrenceIntervals.oneTime:
            _selectedCron = null;
            break;
          case RecurrenceIntervals.day:
            _selectedCron?.day = null;
            _selectedCron?.weekDays = [];
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.week:
            _selectedCron?.weekDays = [];
            _selectedCron?.weekDays
                .add(WeekDays.fromNumber(DateTime.now().weekday)!);
            _selectedCron?.day = null;
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.month:
            _selectedCron?.day = DateTime.now().day;
            _selectedCron?.weekDays = [];
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.year:
            _selectedCron?.day = DateTime.now().day;
            _selectedCron?.month = Months.fromNumber(DateTime.now().month);
            _selectedCron?.weekDays = [];
            break;
          default:
            break;
        }
      }
    });
  }

  void _onWeekDayChanged(
    List<CustomDropdownEntry<WeekDays>> selection,
  ) {
    setState(() {
      _selectedCron?.weekDays = [];
      _selectedCron?.weekDays
          .addAll(selection.map((dropdownEntry) => dropdownEntry.value));
    });
  }

  void _onMonthChanged(
    List<CustomDropdownEntry<Months?>> selection,
  ) {
    setState(() {
      _selectedCron?.month = selection.first.value;
      if (selection.isNotEmpty &&
          _selectedCron?.day != null &&
          selection.first.value!.numberOfDays < _selectedCron!.day!) {
        _selectedCron?.day = null;
      }
    });
  }

  void _onDayChanged(
    List<CustomDropdownEntry<int?>> selection,
  ) {
    setState(() {
      _selectedCron?.day = selection.first.value;
    });
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

    if (widget.valueTransaction?.recurrenceInterval != null) {
      _selectedCron = CronRecurrenceInterval.fromCronExpression(
        widget.valueTransaction!.recurrenceInterval!,
      );
      _selectedRecurrenceInterval = _selectedCron?.recurrenceInterval;
    } else {
      _selectedRecurrenceInterval = RecurrenceIntervals.oneTime;
    }

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
          transactionType: _selectedTransactionTypes.isEmpty
              ? null
              : _selectedTransactionTypes.first,
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
          onSelectionChanged: _onTransactionTypesChanged,
          title: localizations.transactionType,
          required: true,
        ),
        CategoryFormField(
          onSelectionChanged: (selection) {
            setState(() {
              _selectedCategories = selection
                  .map((dropdownEntry) => dropdownEntry.value)
                  .toList();
            });
          },
          selectedCategories: _selectedCategories,
          categoriesRef: categoriesRef,
          required: true,
        ),
        CustomDropdown(
          required: true,
          options: RecurrenceIntervals.values
              .map(
                (recurrenceInterval) => CustomDropdownEntry(
                  value: recurrenceInterval,
                  title: recurrenceInterval.localizedName2(context),
                ),
              )
              .toList(),
          selectedOptions: [
            if (_selectedRecurrenceInterval != null)
              CustomDropdownEntry(
                value: _selectedRecurrenceInterval,
                title: _selectedRecurrenceInterval!.localizedName2(context),
              ),
          ],
          onSelectionChanged: _onRecurrenceIntervalChanged,
          title: localizations.repeat,
        ),
        if (_selectedRecurrenceInterval == RecurrenceIntervals.oneTime)
          DateFormField(
            required: true,
            setDateTime: (dateTime) {
              setState(() {
                _dateTime = dateTime;
              });
            },
            dateTime: _dateTime,
          ),
        if (_selectedRecurrenceInterval == RecurrenceIntervals.week)
          CustomDropdown<WeekDays>(
            multiselect: true,
            showSelectAllOption: false,
            required:
                _selectedCron?.recurrenceInterval == RecurrenceIntervals.week,
            options: WeekDays.values
                .map(
                  (weekDay) => CustomDropdownEntry(
                    value: weekDay,
                    title: weekDay.localizedName(context),
                  ),
                )
                .toList(),
            selectedOptions: _selectedCron?.weekDays == null
                ? []
                : _selectedCron!.weekDays
                    .map(
                      (weekDay) => CustomDropdownEntry(
                        value: weekDay,
                        title: weekDay.localizedName(context),
                      ),
                    )
                    .toList(),
            onSelectionChanged: _onWeekDayChanged,
            title: localizations.weekDay(1),
          ),
        if (_selectedRecurrenceInterval == RecurrenceIntervals.year)
          CustomDropdown(
            options: Months.values
                .map(
                  (month) => CustomDropdownEntry(
                    value: month,
                    title: month.localizedName(context),
                  ),
                )
                .toList(),
            selectedOptions: [
              if (_selectedCron?.month != null)
                CustomDropdownEntry(
                  value: _selectedCron!.month,
                  title: _selectedCron!.month!.localizedName(context),
                ),
            ],
            onSelectionChanged: _onMonthChanged,
            title: localizations.month(1),
          ),
        if ([RecurrenceIntervals.month, RecurrenceIntervals.year]
            .contains(_selectedRecurrenceInterval))
          CustomDropdown(
            options: List.generate(
              _selectedCron?.month?.numberOfDays ??
                  Months.february.numberOfDays,
              (index) => CustomDropdownEntry(
                value: index + 1,
                title: '${index + 1}',
              ),
            ),
            selectedOptions: [
              if (_selectedCron?.day != null)
                CustomDropdownEntry(
                  value: _selectedCron!.day,
                  title: _selectedCron!.day!.toString(),
                ),
            ],
            onSelectionChanged: _onDayChanged,
            title: localizations.day(1),
          ),
        if (_selectedRecurrenceInterval != null &&
            _selectedRecurrenceInterval != RecurrenceIntervals.oneTime)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _selectedCron?.repeatsLocalizedMessage(
                    context,
                  ) ??
                  '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
      ],
    );
  }
}
