import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles/filled_button.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';
import '../../extensions/build_context.dart';
import 'expense_income_bottom_sheet.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({
    super.key,
    required this.addExpenseCategory,
    required this.addIncomeCategory,
    required this.addExpenseTransaction,
    required this.addIncomeTransaction,
    required this.addBudget,
  });

  final void Function() addExpenseCategory;
  final void Function() addIncomeCategory;
  final void Function() addExpenseTransaction;
  final void Function() addIncomeTransaction;
  final void Function() addBudget;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pop();
                  context.pushCreateReceipt();
                },
                child: Text(localizations.receipt),
              )
                  .iconOnTop(
                    icon: Icons.receipt_long_rounded,
                    colorStyle: FilledButtonStyles.primaryContainer,
                  )
                  .bottomSheetStyle(
                    constructor: FilledButton.new,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          containerBorderRadius,
                        ),
                      ),
                    ),
                  ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pop();
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    builder: (BuildContext context) => ExpenseIncomeBottomSheet(
                      addExpense: addExpenseTransaction,
                      addIncome: addIncomeTransaction,
                    ),
                  );
                },
                child: Text(localizations.transaction),
              )
                  .iconOnTop(
                    icon: Icons.wallet_rounded,
                    colorStyle: FilledButtonStyles.inverseSurface,
                  )
                  .bottomSheetStyle(
                    constructor: FilledButton.new,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          containerBorderRadius,
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pop();
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    builder: (BuildContext context) => ExpenseIncomeBottomSheet(
                      addExpense: addExpenseCategory,
                      addIncome: addIncomeCategory,
                    ),
                  );
                },
                child: Text(localizations.category),
              )
                  .iconOnTop(
                    icon: Icons.category_rounded,
                    colorStyle: FilledButtonStyles.inverseSurface,
                  )
                  .bottomSheetStyle(
                    constructor: FilledButton.new,
                    shape: const RoundedRectangleBorder(),
                  ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pop();
                  addBudget();
                },
                child: Text(localizations.budget),
              )
                  .iconOnTop(
                    icon: Icons.savings_rounded,
                    colorStyle: FilledButtonStyles.primaryContainer,
                  )
                  .bottomSheetStyle(
                    constructor: FilledButton.new,
                    shape: const RoundedRectangleBorder(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
