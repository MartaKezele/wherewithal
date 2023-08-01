import 'package:flutter/material.dart';

import '../models/action_result.dart';

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
      child: Text(
        result?.message ?? '',
      ),
    );
  }
}
