import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../app_models/pie_section_data.dart';
import '../../../change_notifiers/auth.dart';
import '../../../components/cards/cash_flow_card.dart';
import '../../../components/cards/value_transactions_by_category_chart_card.dart';
import '../../../components/error_content.dart';
import '../../../components/form/form_fields/date_range_form_field.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../config/date_time_picker.dart';
import '../../../constants/padding_size.dart';
import '../../../constants/spacers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../models/models.dart' as models;
import '../../../utils/categories.dart';
import '../../../utils/percentage.dart';

class Analytics extends StatefulWidget with GetItStatefulWidgetMixin {
  Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> with GetItStateMixin {
  DateTimeRange? _dateTimeRange = DateTimeRange(
    start: beginningOfThisMonth(),
    end: endOfDay(DateTime.now()),
  );

  final List<PieSectionData?> _parentExpenseSections = [null];
  final List<PieSectionData?> _parentIncomeSections = [null];
  PieSectionData? _selectedExpenseSection;
  PieSectionData? _selectedIncomeSection;

  double _totalValueTransactionValue(
    Iterable<models.ValueTransaction> valueTransactions,
  ) {
    final values = valueTransactions.map((element) => element.value);
    return values.isEmpty
        ? 0
        : values.reduce(
            (value, element) => value + element,
          );
  }

  List<PieSectionData> _transactionsByCategoriesPieSections(
    PieSectionData? parentSection,
    Iterable<models.Category> categories,
    Iterable<models.ValueTransaction> valueTransactions,
  ) {
    final baseCategories = categories.where(
      (element) => element.parentCategoryId == parentSection?.id,
    );

    var totalValue = 0.0;
    final List<double> totalCategoryValues = [];

    for (final category in baseCategories) {
      final categoryFamilyIds =
          categoryFamily(category, categories).map((category) => category.id);

      final totalCategoryValue = _totalValueTransactionValue(
        valueTransactions.where(
          (valueTransaction) =>
              categoryFamilyIds.contains(valueTransaction.categoryId),
        ),
      );

      totalCategoryValues.add(totalCategoryValue);
      totalValue += totalCategoryValue;
    }

    final List<PieSectionData> sections = [];

    if (parentSection != null) {
      final totalParentCategoryValue = _totalValueTransactionValue(
        valueTransactions.where(
          (valueTransaction) => valueTransaction.categoryId == parentSection.id,
        ),
      );
      if (totalParentCategoryValue > 0 && totalValue > 0.0) {
        totalValue += totalParentCategoryValue;
        sections.add(
          PieSectionData(
            id: parentSection.id,
            value: totalParentCategoryValue,
            legendTitle: parentSection.legendTitle,
            percentage: percentage(totalParentCategoryValue, totalValue),
            disableLegend: true,
          ),
        );
      }
    }

    for (final index in Iterable.generate(totalCategoryValues.length)) {
      final percentage = totalValue == 0.0
          ? 0.0
          : totalCategoryValues[index] * 100 / totalValue;

      sections.add(
        PieSectionData(
          id: baseCategories.toList()[index].id,
          value: totalCategoryValues[index],
          legendTitle: baseCategories.toList()[index].title,
          percentage: percentage,
        ),
      );
    }

    final filteredSections =
        sections.where((element) => element.value > 0.0).toList();

    filteredSections.sort(
      (section1, section2) => -section1.value.compareTo(section2.value),
    );

    return filteredSections;
  }

  Future<void> _onDateTimeRangeChange(DateTimeRange? dateTimeRange) async {
    setState(() {
      _dateTimeRange = dateTimeRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    models.ValueTransactionQuery valueTransactionsRef =
        models.usersRef.doc(userId).valueTransactions.whereDateTime(
              isGreaterThanOrEqualTo: _dateTimeRange?.start,
              isLessThanOrEqualTo: _dateTimeRange?.end,
            );

    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingSize.xs,
        left: PaddingSize.xs,
        right: PaddingSize.xs,
      ),
      child: FirestoreBuilder(
        ref: valueTransactionsRef,
        child: DateRangeFormField(
          setDateTimeRange: _onDateTimeRangeChange,
          dateTimeRange: _dateTimeRange,
          required: true,
          autoValidateMode: AutovalidateMode.always,
        ),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return const ErrorContent();
          }

          if (!snapshot.hasData) {
            return const LoadingContent();
          }

          final docs = snapshot.requireData.docs;

          if (docs.isEmpty) {
            return const NoDataContent();
          }

          final valueTransactions = docs.map((doc) => doc.data);

          final expenseValueTransactions = valueTransactions.where(
            (valueTransaction) =>
                valueTransaction.categoryTransactionType ==
                TransactionTypes.expense.name,
          );

          final incomeValueTransactions = valueTransactions.where(
            (valueTransaction) =>
                valueTransaction.categoryTransactionType ==
                TransactionTypes.income.name,
          );

          final totalExpense =
              _totalValueTransactionValue(expenseValueTransactions);

          final totalIncome =
              _totalValueTransactionValue(incomeValueTransactions);

          return SingleChildScrollView(
            child: Column(
              children: [
                if (child != null) child,
                HeightSpacer.md,
                CashFlowCard(
                  expense: totalExpense,
                  income: totalIncome,
                ),
                HeightSpacer.md,
                FirestoreBuilder(
                  ref: models.usersRef.doc(userId).categories,
                  builder: (context, snapshot, child) {
                    if (snapshot.hasError) {
                      return const ErrorContent();
                    }

                    if (!snapshot.hasData) {
                      return const LoadingContent();
                    }

                    final docs = snapshot.requireData.docs;

                    if (docs.isEmpty) {
                      return const NoDataContent();
                    }

                    final categories = docs.map((doc) => doc.data);

                    final expenseCategories = categories.where(
                      (category) =>
                          category.transactionType ==
                          TransactionTypes.expense.name,
                    );
                    final incomeCategories = categories.where(
                      (category) =>
                          category.transactionType ==
                          TransactionTypes.income.name,
                    );

                    final expenseByCategoriesData =
                        _transactionsByCategoriesPieSections(
                      _parentExpenseSections.last,
                      expenseCategories,
                      expenseValueTransactions,
                    );
                    final incomeByCategoriesData =
                        _transactionsByCategoriesPieSections(
                      _parentIncomeSections.last,
                      incomeCategories,
                      incomeValueTransactions,
                    );

                    return Column(
                      children: [
                        ValueTransactionsByCategoryChartCard(
                          title: localizations.spendingByCategories,
                          sections: expenseByCategoriesData,
                          selectedSection: _selectedExpenseSection,
                          parentSectionTitle:
                              _parentExpenseSections.last?.legendTitle ??
                                  localizations.total,
                          parentSectionTotalValue:
                              _parentExpenseSections.last?.value ??
                                  totalExpense,
                          onLegendItemClicked: (section) {
                            setState(() {
                              _selectedExpenseSection = section;
                            });
                          },
                          moreDetailsFn: _selectedExpenseSection == null ||
                                  _selectedExpenseSection?.disableLegend ==
                                      true ||
                                  _transactionsByCategoriesPieSections(
                                    _selectedExpenseSection,
                                    expenseCategories,
                                    expenseValueTransactions,
                                  ).isEmpty
                              ? null
                              : () {
                                  setState(() {
                                    _parentExpenseSections
                                        .add(_selectedExpenseSection);
                                    _selectedExpenseSection = null;
                                  });
                                },
                          goBackFn: _parentExpenseSections.last == null
                              ? null
                              : () {
                                  setState(() {
                                    _parentExpenseSections.removeLast();
                                  });
                                },
                        ),
                        HeightSpacer.md,
                        ValueTransactionsByCategoryChartCard(
                          title: localizations.incomeByCategories,
                          sections: incomeByCategoriesData,
                          selectedSection: _selectedIncomeSection,
                          parentSectionTitle:
                              _parentIncomeSections.last?.legendTitle ??
                                  localizations.total,
                          parentSectionTotalValue:
                              _parentIncomeSections.last?.value ?? totalIncome,
                          onLegendItemClicked: (section) {
                            setState(() {
                              _selectedIncomeSection = section;
                            });
                          },
                          moreDetailsFn: _selectedIncomeSection == null ||
                                  _selectedIncomeSection?.disableLegend ==
                                      true ||
                                  _transactionsByCategoriesPieSections(
                                    _selectedIncomeSection,
                                    incomeCategories,
                                    incomeValueTransactions,
                                  ).isEmpty
                              ? null
                              : () {
                                  setState(() {
                                    _parentIncomeSections
                                        .add(_selectedIncomeSection);
                                    _selectedIncomeSection = null;
                                  });
                                },
                          goBackFn: _parentIncomeSections.last == null
                              ? null
                              : () {
                                  setState(() {
                                    _parentIncomeSections.removeLast();
                                  });
                                },
                        ),
                      ],
                    );
                  },
                ),
                HeightSpacer.xl,
              ],
            ),
          );
        },
      ),
    );
  }
}
