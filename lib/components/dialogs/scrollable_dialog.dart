import 'package:flutter/material.dart';

// TODO delete if not needed later on
class ScrollableDialog extends StatelessWidget {
  const ScrollableDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final String title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  content,
                ],
              ),
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}
