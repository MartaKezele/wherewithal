import 'package:flutter/material.dart';

import '../constants/styles/filled_button.dart';
import '../constants/themes/container.dart';
import '../utils/app_localizations.dart';
import '../extensions/button/filled_button.dart';
import '../extensions/button/button_style_button.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              // TODO add new expense
            },
            icon: const Icon(Icons.remove_rounded),
            label: Text(localizations.expense),
          ).addColorStyle(FilledButtonStyles.error).addBottomSheetStyle(
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
          child: FilledButton.icon(
            onPressed: () {
              // TODO add new income
            },
            icon: const Icon(Icons.add_rounded),
            label: Text(localizations.income),
          ).addColorStyle(FilledButtonStyles.success).addBottomSheetStyle(
                constructor: FilledButton.new,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.zero,
                  ),
                ),
              ),
        ),
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              // TODO add new category
            },
            icon: const Icon(Icons.category_rounded),
            label: Text(localizations.category),
          ).addColorStyle(FilledButtonStyles.secondary).addBottomSheetStyle(
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
