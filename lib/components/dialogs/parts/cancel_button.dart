import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/constants/styles/text_button.dart';
import 'package:wherewithal/extensions/button/text_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: const Text('Cancel'),
    ).addColorStyle(colorStyle: TextButtonStyles.surface(context));
  }
}
