import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/pie_section_data.dart';
import '../../change_notifiers/currency.dart';
import '../../config/fraction_digits.dart';
import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/pie_chart.dart';
import '../../constants/styles/text_button.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/chart/chart_section_color.dart';
import '../charts/pie_chart_legend_list_tile.dart';
import '../expandable_container.dart';
import 'custom_card.dart';
import '../../extensions/button/text_button.dart';

class ValueTransactionsByCategoryCard extends StatelessWidget
    with GetItMixin {
  ValueTransactionsByCategoryCard({
    super.key,
    required this.title,
    required this.sections,
    required this.onLegendItemClicked,
    this.goBackFn,
    this.moreDetailsFn,
    this.selectedSection,
    required this.parentSectionTitle,
    required this.parentSectionTotalValue,
  });

  final String title;

  final List<PieSectionData> sections;
  final void Function(PieSectionData? section) onLegendItemClicked;
  final void Function()? goBackFn;
  final void Function()? moreDetailsFn;
  final PieSectionData? selectedSection;
  final String parentSectionTitle;
  final double parentSectionTotalValue;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    final legendListTiles = sections
        .asMap()
        .map(
          (index, section) => MapEntry(
            index,
            PieChartLegendListTile(
              selected: section == selectedSection,
              title: section.legendTitle,
              subtitle:
                  '${section.value.toStringAsFixed(priceFractionDigits)} $currency',
              trailing:
                  '${section.percentage.toStringAsFixed(priceFractionDigits)}%',
              legendColor: chartSectionColorFromIndex(index),
              onTap: () => onLegendItemClicked(section),
            ),
          ),
        )
        .values
        .toList();

    return CustomCard(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                parentSectionTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${parentSectionTotalValue.toStringAsFixed(priceFractionDigits)} $currency',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
          HeightSpacer.md,
          SizedBox(
            width: pieChartSize(context),
            height: pieChartSize(context),
            child: PieChart(
              PieChartData(
                sections: sections.isNotEmpty
                    ? sections
                        .asMap()
                        .map((index, section) {
                          return MapEntry(
                            index,
                            PieChartSectionData(
                              value: section.value,
                              color: chartSectionColorFromIndex(index),
                              showTitle: false,
                              radius: section == selectedSection
                                  ? selectedSectionRadius
                                  : unselectedSectionRadius,
                            ),
                          );
                        })
                        .values
                        .toList()
                    : [
                        PieChartSectionData(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(0.5),
                          showTitle: false,
                          radius: unselectedSectionRadius,
                        ),
                      ],
              ),
            ),
          ),
          if (goBackFn != null || moreDetailsFn != null)
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingSize.xxs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (goBackFn != null)
                    TextButton.icon(
                      onPressed: goBackFn,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(localizations.goBack),
                    ).colorStyle(TextButtonStyles.surfaceVariant),
                  if (moreDetailsFn != null)
                    TextButton.icon(
                      onPressed: moreDetailsFn,
                      icon: Text(localizations.moreDetails),
                      label: const Icon(Icons.arrow_forward),
                    ).colorStyle(TextButtonStyles.surfaceVariant),
                ],
              ),
            ),
          HeightSpacer.xxs,
          if (sections.isEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingSize.sm,
                bottom: PaddingSize.xxs,
              ),
              child: Text(
                localizations.noData,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          if (sections.isNotEmpty)
            ExpandableContainer(
              widgets: legendListTiles,
            ),
        ],
      ),
    );
  }
}
