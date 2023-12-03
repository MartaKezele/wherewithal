import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles/filled_button.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';
import '../../extensions/build_context.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({
    super.key,
    required this.addCategory,
    required this.addExpense,
    required this.addIncome,
    required this.addBudget,
  });

  final void Function() addCategory;
  final void Function() addExpense;
  final void Function() addIncome;
  final void Function() addBudget;

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
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
                  widget.addCategory();
                },
                child: Text(localizations.category),
              )
                  .iconOnTop(
                    icon: Icons.category_rounded,
                    colorStyle: FilledButtonStyles.inverseSurface,
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
                  widget.addBudget();
                },
                child: Text(localizations.budget),
              )
                  .iconOnTop(
                    icon: Icons.savings_rounded,
                    colorStyle: FilledButtonStyles.primaryContainer,
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
                    shape: const RoundedRectangleBorder(),
                  ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  context.pop();
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    builder: (BuildContext context) => Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              context.pop();
                              widget.addExpense();
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
                              widget.addIncome();
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
                    shape: const RoundedRectangleBorder(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
