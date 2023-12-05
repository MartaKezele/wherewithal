import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/padding_size.dart';
import '../../constants/styles/container.dart';
import '../../constants/styles/text_button.dart';
import '../../extensions/button/text_button.dart';
import '../../l10n/app_localizations.dart';

Future<T?> showListViewDialog<T>({
  required BuildContext context,
  required String title,
  required List<Widget> options,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: containerShape,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSize.md,
                vertical: PaddingSize.sm,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: options,
              ),
            ),
            const Divider(height: 0),
            ButtonBar(
              layoutBehavior: ButtonBarLayoutBehavior.constrained,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    AppLocalizations.of(context).cancel,
                  ),
                ).colorStyle(TextButtonStyles.surface)
              ],
            ),
          ],
        ),
      );
    },
  );
}
