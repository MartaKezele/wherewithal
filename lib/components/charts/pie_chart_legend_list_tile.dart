import 'package:flutter/material.dart';

import '../../constants/padding_size.dart';
import '../../constants/styles/pie_chart.dart';

class PieChartLegendListTile extends StatelessWidget {
  const PieChartLegendListTile({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.legendColor,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final String trailing;
  final Color legendColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leadingAndTrailingTextStyle:
          Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: PaddingSize.sm,
        vertical: 0,
      ),
      selected: selected,
      selectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
      selectedTileColor: Theme.of(context).colorScheme.outlineVariant,
      textColor: Theme.of(context).colorScheme.onSurfaceVariant,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(trailing),
      leading: SizedBox(
        height: legendColorContainerSize,
        width: legendColorContainerSize,
        child: Container(
          color: legendColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
