import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../change_notifiers/currency.dart';
import '../../config/fraction_digits.dart';
import '../../l10n/app_localizations.dart';
import '../../models/enums/transaction_types.dart';
import 'custom_card.dart';

class OverviewCard extends StatelessWidget with GetItMixin {
  OverviewCard({
    super.key,
    required this.income,
    required this.expense,
  });

  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );
    final divider = Divider(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
    final valueTextStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w900,
        );
    final titleTextStyle = Theme.of(context).textTheme.bodyLarge;
    final difference = income - expense;

    double percentageOfIncomeSpent = 0.0;
    if (income > 0) {
      percentageOfIncomeSpent = (expense / income) * 100;
    }

    return CustomCard(
      title: localizations.overview,
      child: Column(
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  Text(
                    localizations.income,
                    style: titleTextStyle?.copyWith(
                      color: TransactionTypes.income.foregroundColor(context),
                    ),
                  ),
                  Text(
                    '${TransactionTypes.income.operand} ${income.toStringAsFixed(priceFractionDigits)} $currency',
                    textAlign: TextAlign.end,
                    style: valueTextStyle?.copyWith(
                      color: TransactionTypes.income.foregroundColor(context),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    localizations.expense,
                    style: titleTextStyle?.copyWith(
                      color: TransactionTypes.expense.foregroundColor(context),
                    ),
                  ),
                  Text(
                    '${TransactionTypes.expense.operand} ${expense.toStringAsFixed(priceFractionDigits)} $currency',
                    textAlign: TextAlign.end,
                    style: valueTextStyle?.copyWith(
                      color: TransactionTypes.expense.foregroundColor(context),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  divider,
                  divider,
                ],
              ),
              TableRow(
                children: [
                  const Text(''),
                  Text(
                    '${difference > 0 ? TransactionTypes.income.operand : TransactionTypes.expense.operand} ${difference.abs().toStringAsFixed(priceFractionDigits)} $currency',
                    textAlign: TextAlign.end,
                    style: valueTextStyle?.copyWith(
                      color: difference > 0
                          ? TransactionTypes.income.foregroundColor(context)
                          : TransactionTypes.expense.foregroundColor(context),
                    ),
                  ),
                ],
              ),
              if (income > 0)
                TableRow(
                  children: [
                    Text(
                        localizations.spentXPercentageOdIncome(
                          percentageOfIncomeSpent,
                        ),
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Text(''),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
