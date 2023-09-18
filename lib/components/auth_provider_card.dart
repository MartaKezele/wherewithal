import 'package:flutter/material.dart';

import '../constants/spacers.dart';
import '../constants/styles/card.dart';
import '../constants/styles/container.dart';

class AuthProviderCard extends StatelessWidget {
  const AuthProviderCard({
    super.key,
    required this.title,
    required this.buttons,
  });

  final String title;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: containerShape,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (buttons.isNotEmpty) HeightSpacer.sm,
            if (buttons.isNotEmpty)
              Row(
                children: buttons,
              ),
          ],
        ),
      ),
    );
  }
}
