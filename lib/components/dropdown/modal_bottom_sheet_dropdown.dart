import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../constants/padding_size.dart';
import '../../constants/styles/outlined_button.dart';
import '../../l10n/app_localizations.dart';
import '../drag_indicator.dart';
import '../../extensions/button/outlined_button.dart';
import '../no_data_content.dart';
import 'all_dropdown_tile.dart';
import 'dropdown_tile.dart';

class ModalBottomSheetDropdown<T> extends StatefulWidget {
  const ModalBottomSheetDropdown({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.multiselect,
    required this.onSelectionChanged,
  });

  final List<CustomDropdownEntry<T>> options;
  final List<CustomDropdownEntry<T>> selectedOptions;
  final bool multiselect;
  final void Function(List<CustomDropdownEntry<T>>) onSelectionChanged;

  @override
  State<ModalBottomSheetDropdown> createState() =>
      _ModalBottomSheetDropdownState<T>();
}

class _ModalBottomSheetDropdownState<T>
    extends State<ModalBottomSheetDropdown<T>> {
  late List<CustomDropdownEntry<T>> _selectedOptions;

  @override
  void initState() {
    _selectedOptions = widget.selectedOptions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingSize.xxs,
                bottom: PaddingSize.lg,
              ),
              child: DragIndicator(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        Expanded(
          child: widget.options.isEmpty
              ? const NoDataContent()
              : ListView(
                  children: [
                    if (widget.multiselect == true)
                      AllDropdownTile(
                        selectedTiles: _selectedOptions,
                        parentSetState: setState,
                        onSelectionChanged: widget.onSelectionChanged,
                      ),
                    ...widget.options.map(
                      (option) {
                        return DropdownTile(
                          dropdownEntry: option,
                          selectedTiles: _selectedOptions,
                          parentSetState: setState,
                          onSelectionChanged: widget.onSelectionChanged,
                          multiselect: widget.multiselect,
                        );
                      },
                    ),
                  ],
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingSize.md),
          child: OutlinedButton(
            onPressed: () {
              context.pop();
            },
            child: Text(localizations.close),
          ).colorStyle(OutlinedButtonStyles.primary),
        ),
      ],
    );
  }
}
