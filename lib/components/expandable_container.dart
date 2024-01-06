import 'package:flutter/material.dart';

import '../constants/padding_size.dart';
import 'custom_expansion_panel.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({
    super.key,
    required this.widgets,
    this.numberOfShowcasedWidgets = 3,
    this.title,
    this.backgroundColor,
    this.padding = false,
  });

  final List<Widget> widgets;
  final int numberOfShowcasedWidgets;
  final String? title;
  final Color? backgroundColor;
  final bool? padding;

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final padding = widget.padding == true ? PaddingSize.md : 0.0;

    return Card(
      elevation: 0,
      color: widget.backgroundColor ?? Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          top: padding,
          left: padding,
          right: padding,
        ),
        child: CustomExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.all(0),
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
                  widget.widgets.length <= widget.numberOfShowcasedWidgets
                      ? false
                      : true,
              headerBuilder: (context, isExpanded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.title != null)
                      Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ...widget.widgets
                        .take(widget.numberOfShowcasedWidgets)
                        .toList()
                  ],
                );
              },
              body: Column(
                children: widget.widgets.length <=
                        widget.numberOfShowcasedWidgets
                    ? []
                    : widget.widgets.sublist(widget.numberOfShowcasedWidgets),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
