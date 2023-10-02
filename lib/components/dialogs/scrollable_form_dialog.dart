import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/action_result.dart';
import '../../constants/padding_size.dart';
import '../../constants/styles/container.dart';
import '../../constants/styles/text_button.dart';
import 'parts/submit_dialog_button.dart';
import '../../extensions/button/text_button.dart';

Future<T?> showScrollableFormDialog<T>({
  required BuildContext context,
  required String title,
  required Widget form,
  required Future<ActionResult> Function() onSubmit,
  required String submitBtnText,
  required GlobalKey<FormState> formKey,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: containerShape,
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSize.md,
                ),
                child: form,
              ),
              ButtonBar(
                layoutBehavior: ButtonBarLayoutBehavior.padded,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      MaterialLocalizations.of(context).cancelButtonLabel,
                    ),
                  ).colorStyle(TextButtonStyles.surface),
                  SubmitDialogButton(
                    formKey: formKey,
                    onSubmit: onSubmit,
                    text: submitBtnText,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
