import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/constants/spacers.dart';
import 'package:wherewithal/constants/themes/dialog.dart';
import 'package:wherewithal/extensions/button/text_button.dart';

import '../../constants/padding_size.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';

Future<T?> showConfirmDialog<T>({
  required BuildContext context,
  required String title,
  final void Function()? onOkPressed,
}) {
  final localizations = AppLocalizations.of(context);

  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        shape: containerShape,
        title: Text(
          title,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSize.lg,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(localizations.cancel),
                ).colorStyle(dialogBtnColorStyle),
                WidthSpacer.sm,
                TextButton(
                  onPressed: onOkPressed,
                  child: Text(localizations.ok),
                ).colorStyle(dialogBtnColorStyle),
              ],
            ),
          ),
        ],
      );
    },
  );
}
