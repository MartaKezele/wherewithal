import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../change_notifiers/auth.dart';
import '../../change_notifiers/currency.dart';
import '../../change_notifiers/date_format.dart';
import '../../config/fraction_digits.dart';
import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/themes/card.dart';
import '../../l10n/app_localizations.dart';
import '../../models/models.dart' as models;
import '../../utils/budget.dart';
import '../charts/single_horizontal_bar_chart.dart';
import '../error_content.dart';
import '../loading_content.dart';
import '../../extensions/build_context.dart';

class BudgetCard extends StatefulWidget with GetItStatefulWidgetMixin {
  BudgetCard({
    super.key,
    required this.budgetId,
    required this.title,
    required this.budget,
    required this.dateTimeRange,
    required this.categoryIds,
    this.showDates = false,
  });

  final String budgetId;
  final String title;
  final double budget;
  final DateTimeRange dateTimeRange;
  final List<String> categoryIds;
  final bool showDates;

  @override
  State<BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );
    final currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );
    final dateFormat = watchOnly(
      (DateFormatChangeNotifier changeNotifier) => changeNotifier.dateFormat,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.sm),
      child: FirestoreBuilder(
        ref: models.usersRef
            .doc(userId)
            .valueTransactions
            .whereRecurrenceInterval(isNull: true)
            .whereCategoryId(whereIn: widget.categoryIds)
            .whereDateTime(
              isGreaterThanOrEqualTo: widget.dateTimeRange.start,
              isLessThanOrEqualTo: widget.dateTimeRange.end,
            ),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return ErrorContent(
              text: localizations.couldNotFetchDataForBudget(widget.title),
            );
          }

          if (!snapshot.hasData) {
            return const LoadingContent();
          }

          final docs = snapshot.requireData.docs;

          double totalValue = 0;

          if (docs.isNotEmpty) {
            totalValue = docs
                .map((transactionDocSnapshot) =>
                    transactionDocSnapshot.data.value)
                .reduce((value, element) => value + element);
          }

          final percentage = calculatePercentage(totalValue, widget.budget);

          return GestureDetector(
            onTap: () {
              context.pushBudgetView(widget.budgetId);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: cardForegroundColor(context),
                    ),
                  ],
                ),
                HeightSpacer.sm,
                SingleHorizontalBarChart(percentage: percentage),
                HeightSpacer.xs,
                if (widget.showDates)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${dateFormat?.format(widget.dateTimeRange.start)}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '${dateFormat?.format(widget.dateTimeRange.end)}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                HeightSpacer.xxs,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${totalValue.toStringAsFixed(priceFractionDigits)} $currency (${percentage.toStringAsFixed(priceFractionDigits)}%)',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: percentage <= 100.0
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context).colorScheme.error,
                          ),
                    ),
                    Text(
                      '${widget.budget.toStringAsFixed(priceFractionDigits)} $currency',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
