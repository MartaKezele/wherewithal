import 'package:flutter/material.dart';

import 'custom_expansion_panel.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({
    super.key,
    required this.widgets,
    this.numberOfShowcasedWidgets = 3,
  });

  final List<Widget> widgets;
  final int numberOfShowcasedWidgets;

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionPanelList(
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
              children:
                  widget.widgets.take(widget.numberOfShowcasedWidgets).toList(),
            );
          },
          body: Column(
            children: widget.widgets.length <= widget.numberOfShowcasedWidgets
                ? []
                : widget.widgets.sublist(widget.numberOfShowcasedWidgets),
          ),
        ),
      ],
    );
  }
}
