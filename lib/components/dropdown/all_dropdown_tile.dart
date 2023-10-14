import 'package:flutter/material.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../l10n/app_localizations.dart';

class AllDropdownTile<T> extends StatelessWidget {
  const AllDropdownTile({
    super.key,
    required this.selectedTiles,
    required this.parentSetState,
    required this.onSelectionChanged,
  });

  final List<CustomDropdownEntry<T>> selectedTiles;
  final void Function(void Function()) parentSetState;
  final void Function(List<CustomDropdownEntry<T>>) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ExpansionTile(
      shape: const BeveledRectangleBorder(),
      title: Text(localizations.all),
      iconColor: Colors.transparent,
      collapsedIconColor: Colors.transparent,
      leading: Checkbox(
        value: selectedTiles.isEmpty,
        onChanged: (value) {
          parentSetState(() {
            if (value == true) {
              selectedTiles.clear();
              onSelectionChanged(selectedTiles);
            }
          });
        },
      ),
    );
  }
}