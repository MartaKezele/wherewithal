import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/styles/text_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../extensions/button/text_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: Text(AppLocalizations.of(context).cancel),
    ).colorStyle(TextButtonStyles.surface);
  }
}
