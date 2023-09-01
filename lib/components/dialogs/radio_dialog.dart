import 'package:flutter/material.dart';
import 'package:wherewithal/constants/themes/container.dart';

import '../../constants/padding_size.dart';
import 'parts/cancel_button.dart';

const contentHeight = 350.0;

Future<T?> showRadioDialog<T>({
  required BuildContext context,
  required String title,
  required List<Widget> options,
  bool? restrictContentHeight,
}) {
  final scrollController = ScrollController();
  final backgroundColor = Theme.of(context).colorScheme.surface;
  final foregroundColor = Theme.of(context).colorScheme.onSurface;

  return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: containerShape,
          title: Text(
            title,
            style: TextStyle(
              color: foregroundColor,
            ),
          ),
          backgroundColor: backgroundColor,
          surfaceTintColor: foregroundColor,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingSize.lg,
                  ),
                  child: CancelButton(),
                ),
              ],
            ),
          ],
        );
      });
}
