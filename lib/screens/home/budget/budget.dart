import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../app_models/cron_recurrence_interval.dart';
import '../../../app_models/custom_dropdown_entry.dart';
import '../../../app_models/recurrence_intervals.dart';
import '../../../change_notifiers/auth.dart';
import '../../../components/cards/budget_card.dart';
import '../../../components/cards/custom_card.dart';
import '../../../components/dropdown/custom_dropdown.dart';
import '../../../components/error_content.dart';
import '../../../components/expandable_container.dart';
import '../../../components/home_app_bar.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../components/wrappers/screen.dart';
import '../../../constants/padding_size.dart';
import '../../../constants/spacers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart' as models;
import '../../../utils/date_time.dart';

class Budget extends StatefulWidget with GetItStatefulWidgetMixin {
  Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> with GetItStateMixin {
  List<RecurrenceIntervals> _selectedRecurrenceIntervals = [];

  void _onRecurrenceIntervalChanged(
    List<CustomDropdownEntry<RecurrenceIntervals?>> selection,
  ) {
    setState(() {
      _selectedRecurrenceIntervals = selection
          .where((recurrenceInterval) => recurrenceInterval.value != null)
          .map((recurrenceInterval) => recurrenceInterval.value!)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    return Screen(
      appBar: homeAppBar(
        title: localizations.budget,
        context: context,
      ),
      body: FirestoreBuilder(
        ref: models.usersRef.doc(userId).budgets.orderByTitle(),
        builder: (
          context,
          snapshot,
          child,
        ) {
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(PaddingSize.md),
              child: ErrorContent(),
            );
          }

          if (!snapshot.hasData) {
            return const LoadingContent();
          }

          final docs = snapshot.requireData.docs;

          final budgets = docs.map((budgetDoc) => budgetDoc.data);

          final List<models.Budget> dailyBudgets = [];
          final List<models.Budget> weeklyBudgets = [];
          final List<models.Budget> monthlyBudgets = [];
          final List<models.Budget> yearlyBudgets = [];
          final List<models.Budget> oneTimeBudgets = [];

          for (final budget in budgets) {
            if (budget.recurrenceInterval == null) {
              oneTimeBudgets.add(budget);
              continue;
            }
            final cron = CronRecurrenceInterval.fromCronExpression(
              budget.recurrenceInterval!,
            );

            switch (cron.recurrenceInterval) {
              case RecurrenceIntervals.day:
                dailyBudgets.add(budget);
                break;
              case RecurrenceIntervals.week:
                weeklyBudgets.add(budget);
                break;
              case RecurrenceIntervals.month:
                monthlyBudgets.add(budget);
                break;
              case RecurrenceIntervals.year:
                yearlyBudgets.add(budget);
                break;
              case RecurrenceIntervals.oneTime:
              default:
                break;
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomDropdown(
                  options: RecurrenceIntervals.values
                      .map(
                        (recurrenceInterval) => CustomDropdownEntry(
                          value: recurrenceInterval,
                          title: recurrenceInterval.localizedName2(context),
                        ),
                      )
                      .toList(),
                  selectedOptions: _selectedRecurrenceIntervals
                      .map(
                        (recurrenceInterval) => CustomDropdownEntry(
                          value: recurrenceInterval,
                          title: recurrenceInterval.localizedName2(context),
                        ),
                      )
                      .toList(),
                  onSelectionChanged: _onRecurrenceIntervalChanged,
                  title: localizations.recurrence,
                  showSelectAllOption: true,
                  multiselect: true,
                ),
                HeightSpacer.lg,
                if (_selectedRecurrenceIntervals.isEmpty ||
                    _selectedRecurrenceIntervals
                        .contains(RecurrenceIntervals.day))
                  CustomCard(
                    title: RecurrenceIntervals.day.localizedName2(
                      context,
                    ),
                    showSpacer: dailyBudgets.isEmpty,
                    child: dailyBudgets.isEmpty
                        ? const NoDataContent()
                        : ExpandableContainer(
                            widgets: dailyBudgets
                                .map(
                                  (budget) => BudgetCard(
                                    budgetId: budget.id,
                                    title: budget.title,
                                    budget: budget.budget,
                                    categoryIds: budget.categoryIds,
                                    dateTimeRange: DateTimeRange(
                                      start: beginningOfToday(),
                                      end: endOfToday(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                HeightSpacer.lg,
                if (_selectedRecurrenceIntervals.isEmpty ||
                    _selectedRecurrenceIntervals
                        .contains(RecurrenceIntervals.week))
                  CustomCard(
                    title: RecurrenceIntervals.week.localizedName2(
                      context,
                    ),
                    showSpacer: weeklyBudgets.isEmpty,
                    child: weeklyBudgets.isEmpty
                        ? const NoDataContent()
                        : ExpandableContainer(
                            widgets: weeklyBudgets
                                .map(
                                  (budget) => BudgetCard(
                                    budgetId: budget.id,
                                    title: budget.title,
                                    budget: budget.budget,
                                    categoryIds: budget.categoryIds,
                                    dateTimeRange: DateTimeRange(
                                      start: beginningOfThisWeek(),
                                      end: endOfThisWeek(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                HeightSpacer.lg,
                if (_selectedRecurrenceIntervals.isEmpty ||
                    _selectedRecurrenceIntervals
                        .contains(RecurrenceIntervals.month))
                  CustomCard(
                    title: RecurrenceIntervals.month.localizedName2(
                      context,
                    ),
                    showSpacer: monthlyBudgets.isEmpty,
                    child: monthlyBudgets.isEmpty
                        ? const NoDataContent()
                        : ExpandableContainer(
                            widgets: monthlyBudgets
                                .map(
                                  (budget) => BudgetCard(
                                    budgetId: budget.id,
                                    title: budget.title,
                                    budget: budget.budget,
                                    categoryIds: budget.categoryIds,
                                    dateTimeRange: DateTimeRange(
                                      start: beginningOfThisMonth(),
                                      end: endOfThisMonth(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                HeightSpacer.lg,
                if (_selectedRecurrenceIntervals.isEmpty ||
                    _selectedRecurrenceIntervals
                        .contains(RecurrenceIntervals.year))
                  CustomCard(
                    title: RecurrenceIntervals.year.localizedName2(
                      context,
                    ),
                    showSpacer: yearlyBudgets.isEmpty,
                    child: yearlyBudgets.isEmpty
                        ? const NoDataContent()
                        : ExpandableContainer(
                            widgets: yearlyBudgets
                                .map(
                                  (budget) => BudgetCard(
                                    budgetId: budget.id,
                                    title: budget.title,
                                    budget: budget.budget,
                                    categoryIds: budget.categoryIds,
                                    dateTimeRange: DateTimeRange(
                                      start: beginningOfThisYear(),
                                      end: endOfThisYear(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                HeightSpacer.lg,
                if (_selectedRecurrenceIntervals.isEmpty ||
                    _selectedRecurrenceIntervals
                        .contains(RecurrenceIntervals.oneTime))
                  CustomCard(
                    title: RecurrenceIntervals.oneTime.localizedName2(
                      context,
                    ),
                    showSpacer: oneTimeBudgets.isEmpty,
                    child: oneTimeBudgets.isEmpty
                        ? const NoDataContent()
                        : ExpandableContainer(
                            widgets: oneTimeBudgets
                                .map(
                                  (budget) => BudgetCard(
                                    budgetId: budget.id,
                                    title: budget.title,
                                    budget: budget.budget,
                                    categoryIds: budget.categoryIds,
                                    dateTimeRange: DateTimeRange(
                                      start: budget.startDateTime!,
                                      end: budget.endDateTime!,
                                    ),
                                    showDates: true,
                                  ),
                                )
                                .toList(),
                          ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
