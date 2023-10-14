import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/styles/filled_button.dart';
import '../constants/styles/container.dart';
import '../l10n/app_localizations.dart';
import '../extensions/button/filled_button.dart';
import '../extensions/button/button_style_button.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({
    super.key,
    required this.addCategory,
    required this.addExpense,
    required this.addIncome,
  });

  final void Function() addCategory;
  final void Function() addExpense;
  final void Function() addIncome;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {
              context.pop();
              addExpense();
            },
            child: Text(localizations.expense),
          )
              .iconOnTop(
                icon: Icons.remove_rounded,
                colorStyle: FilledButtonStyles.error,
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
              addIncome();
            },
            child: Text(localizations.income),
          )
              .iconOnTop(
                icon: Icons.add_rounded,
                colorStyle: FilledButtonStyles.success,
              )
              .bottomSheetStyle(
                constructor: FilledButton.new,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.zero,
                  ),
                ),
              ),
        ),
        Expanded(
          child: FilledButton(
            onPressed: () {
              context.pop();
              addCategory();
            },
            child: Text(localizations.category),
          )
              .iconOnTop(
                icon: Icons.category_rounded,
                colorStyle: FilledButtonStyles.secondaryContainer,
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
    );
  }
}
