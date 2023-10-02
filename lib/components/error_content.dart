import 'package:flutter/material.dart';

import '../constants/icon_size.dart';
import '../constants/spacers.dart';
import '../l10n/app_localizations.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fgColor = Theme.of(context).colorScheme.onErrorContainer;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_rounded,
          color: fgColor,
          size: IconSize.xxl,
        ),
        HeightSpacer.md,
        Text(
          AppLocalizations.of(context).genericErrorMsg,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: fgColor,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
