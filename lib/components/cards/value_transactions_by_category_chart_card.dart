import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../app_models/pie_section_data.dart';
import '../../change_notifiers/currency.dart';
import '../../config/fraction_digits.dart';
import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/text_button.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/chart/chart_section_color.dart';
import 'analytics_card.dart';
import '../../extensions/button/text_button.dart';

class ValueTransactionsByCategoryChartCard extends StatelessWidget
    with GetItMixin {
  ValueTransactionsByCategoryChartCard({
    super.key,
    required this.title,
    required this.sections,
    required this.onLegendItemClicked,
    this.goBackFn,
    this.moreDetailsFn,
    this.selectedSectionId,
  });

  final String title;

  final List<PieSectionData> sections;
  final void Function(String? categoryId) onLegendItemClicked;
  final void Function()? goBackFn;
  final void Function()? moreDetailsFn;
  final String? selectedSectionId;

  final colorContainerSize = 15.0;
  final selectedSectionRadius = 55.0;
  final unselectedSectionRadius = 40.0;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    return AnalyticsCard(
      title: title,
      child: SizedBox(
        height: sections.isNotEmpty
            ? MediaQuery.of(context).size.height / 2.25
            : MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
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
                                      radius: section.id == selectedSectionId
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
                                  radius: 22,
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
                ],
              ),
            ),
            HeightSpacer.xs,
            if (sections.isEmpty)
              Text(
                localizations.noData,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            if (sections.isNotEmpty)
              Expanded(
                flex: 2,
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: sections.length,
                    itemBuilder: (context, index) {
                      final section = sections[index];
                      return ListTile(
                        leadingAndTrailingTextStyle:
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: PaddingSize.sm,
                          vertical: 0,
                        ),
                        selected: section.id == selectedSectionId,
                        selectedColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        textColor:
                            Theme.of(context).colorScheme.onSurfaceVariant,
                        title: Text(section.legendTitle),
                        subtitle: Text(
                          '${section.value.toStringAsFixed(priceFractionDigits)} $currency',
                        ),
                        trailing: Text(
                          '${section.percentage.toStringAsFixed(priceFractionDigits)}%',
                        ),
                        leading: SizedBox(
                          height: colorContainerSize,
                          width: colorContainerSize,
                          child: Container(
                            color: chartSectionColorFromIndex(index),
                          ),
                        ),
                        onTap: () => onLegendItemClicked(section.id),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
