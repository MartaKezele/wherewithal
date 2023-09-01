import 'package:flutter/material.dart';
import 'package:wherewithal/constants/padding_size.dart';

import '../app_models/action_result.dart';

class ActionResultMessage extends StatelessWidget {
  const ActionResultMessage({
    super.key,
    required this.result,
  });

  final ActionResult? result;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: result != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingSize.sm,
        ),
        child: Text(
          result?.messageTitle ?? '',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: result == null
                    ? null
                    : result!.success
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.error,
              ),
        ),
      ),
    );
  }
}
