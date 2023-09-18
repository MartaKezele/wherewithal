import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/constants/themes/dialog.dart';
import 'package:wherewithal/extensions/button/text_button.dart';

import '../../constants/padding_size.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';

const contentHeight = 350.0;

Future<T?> showRadioDialog<T>({
  required BuildContext context,
  required String title,
  required List<Widget> options,
  bool? restrictContentHeight,
}) {
  final localizations = AppLocalizations.of(context);
  final scrollController = ScrollController();

  return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: containerShape,
          title: Text(
            title,
          ),
          children: [
            SizedBox(
              height: restrictContentHeight == true ? contentHeight : null,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ...options,
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingSize.lg,
                  ),
                  child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(localizations.cancel),
                  ).colorStyle(dialogBtnColorStyle),
                ),
              ],
            ),
          ],
        );
      });
}
