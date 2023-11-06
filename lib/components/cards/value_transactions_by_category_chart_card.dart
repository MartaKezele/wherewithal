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
import '../custom_expansion_panel.dart';
import 'analytics_card.dart';
import '../../extensions/button/text_button.dart';

class ValueTransactionsByCategoryChartCard extends StatefulWidget
    with GetItStatefulWidgetMixin {
  ValueTransactionsByCategoryChartCard({
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
  State<ValueTransactionsByCategoryChartCard> createState() =>
      _ValueTransactionsByCategoryChartCardState();
}

class _ValueTransactionsByCategoryChartCardState
    extends State<ValueTransactionsByCategoryChartCard> with GetItStateMixin {
  final _colorContainerSize = 15.0;
  final _selectedSectionRadius = 55.0;
  final _unselectedSectionRadius = 40.0;
  final _numberOfShowcasedSections = 3;

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    final sectionListTiles = widget.sections
        .asMap()
        .map(
          (index, section) => MapEntry(
            index,
            ListTile(
              leadingAndTrailingTextStyle:
                  Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: PaddingSize.sm,
                vertical: 0,
              ),
              selected: section == widget.selectedSection,
              selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
              title: Text(section.legendTitle),
              subtitle: Text(
                '${section.value.toStringAsFixed(priceFractionDigits)} $currency',
              ),
              trailing: Text(
                '${section.percentage.toStringAsFixed(priceFractionDigits)}%',
              ),
              leading: SizedBox(
                height: _colorContainerSize,
                width: _colorContainerSize,
                child: Container(
                  color: chartSectionColorFromIndex(index),
                ),
              ),
              onTap: () => widget.onLegendItemClicked(section),
            ),
          ),
        )
        .values
        .toList();

    return AnalyticsCard(
      title: widget.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.parentSectionTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${widget.parentSectionTotalValue.toStringAsFixed(priceFractionDigits)} $currency',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
          HeightSpacer.md,
          SizedBox(
            width: MediaQuery.of(context).size.width - 4 * PaddingSize.xxl,
            height: MediaQuery.of(context).size.width - 4 * PaddingSize.xxl,
            child: PieChart(
              PieChartData(
                sections: widget.sections.isNotEmpty
                    ? widget.sections
                        .asMap()
                        .map((index, section) {
                          return MapEntry(
                            index,
                            PieChartSectionData(
                              value: section.value,
                              color: chartSectionColorFromIndex(index),
                              showTitle: false,
                              radius: section == widget.selectedSection
                                  ? _selectedSectionRadius
                                  : _unselectedSectionRadius,
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
          if (widget.goBackFn != null || widget.moreDetailsFn != null)
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingSize.xxs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.goBackFn != null)
                    TextButton.icon(
                      onPressed: widget.goBackFn,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(localizations.goBack),
                    ).colorStyle(TextButtonStyles.surfaceVariant),
                  if (widget.moreDetailsFn != null)
                    TextButton.icon(
                      onPressed: widget.moreDetailsFn,
                      icon: Text(localizations.moreDetails),
                      label: const Icon(Icons.arrow_forward),
                    ).colorStyle(TextButtonStyles.surfaceVariant),
                ],
              ),
            ),
          HeightSpacer.xxs,
          if (widget.sections.isEmpty)
            Text(
              localizations.noData,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          if (widget.sections.isNotEmpty)
            CustomExpansionPanelList(
              expansionCallback: (_, isExpanded) {
                setState(() {
                  _isExpanded = isExpanded;
                });
              },
              elevation: 0.0,
              expandIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
              children: [
                CustomExpansionPanel(
                  backgroundColor: Colors.transparent,
                  isExpanded: _isExpanded,
                  showExpansionIcon:
                      sectionListTiles.length <= _numberOfShowcasedSections
                          ? false
                          : true,
                  headerBuilder: (context, isExpanded) {
                    return Column(
                      children: sectionListTiles
                          .take(_numberOfShowcasedSections)
                          .toList(),
                    );
                  },
                  body: Column(
                    children: sectionListTiles.length <=
                            _numberOfShowcasedSections
                        ? []
                        : sectionListTiles.sublist(_numberOfShowcasedSections),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
