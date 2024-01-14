import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../models/models.dart' as models;
import '../../app_models/action_result.dart';
import '../../app_models/cron_recurrence_interval.dart';
import '../../app_models/custom_dropdown_entry.dart';
import '../../app_models/months.dart';
import '../../app_models/recurrence_intervals.dart';
import '../../app_models/week_days.dart';
import '../../change_notifiers/auth.dart';
import '../../constants/padding_size.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import '../../utils/dropdown/category_dropdown.dart';
import '../../utils/form_field_validators.dart';
import '../dropdown/custom_dropdown.dart';
import '../error_content.dart';
import '../loading_content.dart';
import 'custom_form.dart';
import 'form_fields/date_form_field.dart';
import 'form_fields/price_value_form_field.dart';

class BudgetForm extends StatefulWidget with GetItStatefulWidgetMixin {
  BudgetForm({
    super.key,
    required this.formKey,
    this.budget,
  });

  final GlobalKey<FormState> formKey;
  final models.Budget? budget;

  @override
  State<BudgetForm> createState() => BudgetFormState();
}

class BudgetFormState extends State<BudgetForm> with GetItStateMixin {
  late final TextEditingController _titleController;
  late final TextEditingController _budgetController;

  DateTime? _startDateTime;
  DateTime? _endDateTime;
  List<models.Category> _selectedCategories = [];
  RecurrenceIntervals? _selectedRecurrenceInterval;
  CronRecurrenceInterval? _selectedCron;

  models.Budget _budgetInfo() {
    final budget = double.tryParse(_budgetController.text);

    assert(budget != null);
    assert(_selectedCategories.isNotEmpty);
    assert(_titleController.text.isNotEmpty);

    return models.Budget(
      id: widget.budget?.id ?? '',
      title: _titleController.text,
      categoryIds: _selectedCategories.map((category) => category.id).toList(),
      recurrenceInterval: _selectedCron?.cronExpression,
      startDateTime: _startDateTime,
      endDateTime: _endDateTime,
      budget: budget!,
    );
  }

  Future<ActionResult> updateBudget() async {
    final localizations = AppLocalizations.of(context);
    final budget = _budgetInfo();

    try {
      final budgetInfo = _budgetInfo();
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .budgets
          .doc(budget.id)
          .update(
            title: budgetInfo.title,
            categoryIds: budgetInfo.categoryIds,
            recurrenceInterval: budgetInfo.recurrenceInterval,
            startDateTime: budgetInfo.startDateTime,
            endDateTime: budgetInfo.endDateTime,
            budget: budgetInfo.budget,
          );
      return ActionResult(
        success: true,
        messageTitle: localizations.updatedBudget,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotUpdateBudget,
      );
    }
  }

  Future<ActionResult> addBudget() async {
    final localizations = AppLocalizations.of(context);

    try {
      await models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .budgets
          .add(_budgetInfo());

      return ActionResult(
        success: true,
        messageTitle: localizations.createdBudget,
      );
    } catch (_) {
      return ActionResult(
        success: false,
        messageTitle: localizations.couldNotCreateBudget,
      );
    }
  }

  Future<void> _initCategoryData(String userId) async {
    if (widget.budget != null) {
      final categoryQuerySnapshot = await models.usersRef
          .doc(userId)
          .categories
          .whereDocumentId(
            whereIn: widget.budget!.categoryIds,
          )
          .get();

      setState(() {
        _selectedCategories = categoryQuerySnapshot.docs
            .map((categoryDoc) => categoryDoc.data)
            .toList();
      });
    }
  }

  void _onRecurrenceIntervalChanged(
    List<CustomDropdownEntry<RecurrenceIntervals?>> selection,
  ) {
    setState(() {
      if (selection.isNotEmpty) {
        _selectedRecurrenceInterval = selection.first.value;

        if (_selectedRecurrenceInterval != RecurrenceIntervals.oneTime &&
            _selectedCron == null) {
          _startDateTime = DateTime.now();
          _endDateTime = null;
          _selectedCron = CronRecurrenceInterval();
        }

        switch (selection.first.value) {
          case RecurrenceIntervals.oneTime:
            _selectedCron = null;
            _startDateTime ??= DateTime.now();
            break;
          case RecurrenceIntervals.day:
            _selectedCron?.day = null;
            _selectedCron?.weekDays = [];
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.week:
            _selectedCron?.weekDays = [];
            _selectedCron?.weekDays.add(WeekDays.monday);
            _selectedCron?.day = null;
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.month:
            _selectedCron?.day = 1;
            _selectedCron?.weekDays = [];
            _selectedCron?.month = null;
            break;
          case RecurrenceIntervals.year:
            _selectedCron?.day = 1;
            _selectedCron?.month = Months.january;
            _selectedCron?.weekDays = [];
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.budget?.title,
    );

    _budgetController = TextEditingController(
      text: widget.budget?.budget != null
          ? widget.budget!.budget.toString()
          : null,
    );

    if (widget.budget?.startDateTime != null &&
        widget.budget?.endDateTime != null) {
      _selectedRecurrenceInterval = RecurrenceIntervals.oneTime;
      _startDateTime = widget.budget?.startDateTime;
      _endDateTime = widget.budget?.endDateTime;
    }

    if (widget.budget?.recurrenceInterval != null) {
      _selectedCron = CronRecurrenceInterval.fromCronExpression(
        widget.budget!.recurrenceInterval!,
      );
      _selectedRecurrenceInterval = _selectedCron?.recurrenceInterval;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );
    if (userId != null) {
      _initCategoryData(userId);
    }
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

    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    models.CategoryQuery categoriesRef = models.usersRef
        .doc(userId)
        .categories
        .whereTransactionType(isEqualTo: TransactionTypes.expense.name)
        .orderByTitle();

    return CustomForm(
      formKey: widget.formKey,
      contents: [
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            label: Text('${localizations.title}*'),
          ),
          autocorrect: false,
          validator: (value) => requiredTextValidator(
            value,
            localizations,
          ),
        ),
        PriceValueFormField(
          controller: _budgetController,
          transactionType: TransactionTypes.expense,
        ),
        FirestoreBuilder(
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
                  text: localizations.couldNotLoadCategories,
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.all(PaddingSize.md),
                child: LoadingContent(),
              );
            }

            final docs = snapshot.requireData.docs;

            final baseCategories = docs.where(
              (element) => element.data.parentCategoryId == null,
            );

            return CustomDropdown(
              title: localizations.categories,
              multiselect: true,
              showSelectAllOption: false,
              selectedOptions: _selectedCategories
                  .map((e) => categoryDropdownEntries(e, docs, context))
                  .toList(),
              onSelectionChanged: (selection) {
                setState(() {
                  _selectedCategories =
                      selection.map((element) => element.value).toList();
                });
              },
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
                _startDateTime = dateTime;
              });
            },
            dateTime: _startDateTime,
            title: localizations.startDate,
          ),
        if (_selectedRecurrenceInterval == RecurrenceIntervals.oneTime)
          DateFormField(
            required: true,
            setDateTime: (dateTime) {
              setState(() {
                _endDateTime = dateTime;
              });
            },
            dateTime: _endDateTime,
            title: localizations.endDate,
          ),
      ],
    );
  }
}
