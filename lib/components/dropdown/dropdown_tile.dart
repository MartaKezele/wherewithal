import 'package:flutter/material.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../constants/padding_size.dart';
import 'custom_expansion_tile.dart';

class DropdownTile<T> extends StatelessWidget {
  const DropdownTile({
    super.key,
    required this.dropdownEntry,
    required this.selectedTiles,
    required this.parentSetState,
    required this.onSelectionChanged,
    this.multiselect = false,
  });

  final CustomDropdownEntry<T> dropdownEntry;
  final List<CustomDropdownEntry<T>> selectedTiles;
  final void Function(void Function()) parentSetState;
  final void Function(List<CustomDropdownEntry<T>>) onSelectionChanged;
  final bool multiselect;

  void _addSubentries(List<CustomDropdownEntry<T>> subEntries) {
    for (final element in subEntries) {
      if (!selectedTiles.contains(element)) {
        selectedTiles.add(element);
      }
      _addSubentries(element.subEntries);
    }
  }

  void _removeSubentries(List<CustomDropdownEntry<T>> subEntries) {
    for (final element in subEntries) {
      _removeSubentries(element.subEntries);
      selectedTiles.remove(element);
    }
  }

  void _checkboxOnChanged(bool? value) {
    parentSetState(() {
      if (value == true && !selectedTiles.contains(dropdownEntry)) {
        _addSubentries(dropdownEntry.subEntries);
        selectedTiles.add(dropdownEntry);
      }
      if (value == false) {
        selectedTiles.remove(dropdownEntry);
        _removeSubentries(dropdownEntry.subEntries);
      }
      onSelectionChanged(selectedTiles);
    });
  }

  void _radioOnChanged(T? value) {
    parentSetState(() {
      if (value == null) {
        selectedTiles.clear();
      } else if (selectedTiles
          .map((element) => element.value)
          .contains(value)) {
        selectedTiles.clear();
      } else {
        selectedTiles.clear();
        selectedTiles.add(dropdownEntry);
      }
      onSelectionChanged(selectedTiles);
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = dropdownEntry.subEntries.isEmpty
        ? Colors.transparent
        : dropdownEntry.foregroundColor;

    final collapsedIconColor = dropdownEntry.subEntries.isEmpty
        ? Colors.transparent
        : dropdownEntry.foregroundColor;

    final subtiles = dropdownEntry.subEntries
        .map(
          (dropdownEntry) => Padding(
            padding: const EdgeInsets.only(left: PaddingSize.lg),
            child: DropdownTile(
              dropdownEntry: dropdownEntry,
              selectedTiles: selectedTiles,
              parentSetState: parentSetState,
              onSelectionChanged: onSelectionChanged,
              multiselect: multiselect,
            ),
          ),
        )
        .toList();

    final checkbox = Checkbox(
      activeColor: dropdownEntry.foregroundColor,
      checkColor: dropdownEntry.backgroundColor,
      value: selectedTiles.contains(dropdownEntry),
      onChanged: _checkboxOnChanged,
    );

    final radio = FittedBox(
      child: Radio<T?>(
        activeColor: dropdownEntry.foregroundColor,
        value: dropdownEntry.value,
        groupValue: selectedTiles.isEmpty ? null : selectedTiles.first.value,
        onChanged: _radioOnChanged,
        toggleable: true,
      ),
    );

    return CustomExpansionTile(
      shape: const BeveledRectangleBorder(),
      title: Text(dropdownEntry.title),
      iconColor: iconColor,
      collapsedIconColor: collapsedIconColor,
      textColor: dropdownEntry.foregroundColor,
      collapsedTextColor: dropdownEntry.foregroundColor,
      backgroundColor: dropdownEntry.subEntries.isEmpty
          ? null
          : dropdownEntry.backgroundColor,
      leading: multiselect ? checkbox : radio,
      onTap: () => multiselect
          ? _checkboxOnChanged(!selectedTiles.contains(dropdownEntry))
          : _radioOnChanged(dropdownEntry.value),
      children: subtiles,
    );
  }
}
