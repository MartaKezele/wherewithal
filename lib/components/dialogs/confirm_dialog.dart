import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/container.dart';
import '../../constants/styles/text_button.dart';
import '../../extensions/button/text_button.dart';

Future<T?> showConfirmDialog<T>({
  required BuildContext context,
  required String title,
  Widget? description,
  final void Function()? onOkPressed,
}) {
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
            child: Column(
              children: [
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: PaddingSize.xs,
                    ),
                    child: description,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        MaterialLocalizations.of(context).cancelButtonLabel,
                      ),
                    ).colorStyle(TextButtonStyles.surface),
                    WidthSpacer.sm,
                    TextButton(
                      onPressed: onOkPressed,
                      child: Text(
                        MaterialLocalizations.of(context).okButtonLabel,
                      ),
                    ).colorStyle(TextButtonStyles.surface),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
