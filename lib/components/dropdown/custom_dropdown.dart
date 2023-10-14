import 'package:flutter/material.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';
import 'modal_bottom_sheet_dropdown.dart';

class CustomDropdown<T> extends StatelessWidget {
  CustomDropdown({
    super.key,
    required this.options,
    required this.selectedOptions,
    this.multiselect = false,
    required this.onSelectionChanged,
    required this.title,
    this.required = false,
  }) : _textController = TextEditingController(
            text: selectedOptions
                .map((dropdownEntry) => dropdownEntry.title)
                .join(', '));

  final String title;
  final List<CustomDropdownEntry<T>> options;
  final List<CustomDropdownEntry<T>> selectedOptions;
  final bool multiselect;
  final void Function(List<CustomDropdownEntry<T>>) onSelectionChanged;
  final bool required;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    if (selectedOptions.isEmpty && multiselect) {
      _textController.text = AppLocalizations.of(context).all;
    }

    return TextFormField(
      readOnly: true,
      controller: _textController,
      maxLines: null,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        label: Text(title),
        suffixIcon: const Icon(
          Icons.arrow_drop_down_rounded,
        ),
      ),
      validator: required
          ? (_) {
              if (selectedOptions.isEmpty) {
                return localizations.valueIsRequired;
              }
              return null;
            }
          : null,
      onTap: () {
        showModalBottomSheet(
          useRootNavigator: true,
          useSafeArea: true,
          context: context,
          shape: containerShape,
          builder: (context) {
            return ModalBottomSheetDropdown(
              multiselect: multiselect,
              onSelectionChanged: onSelectionChanged,
              options: options,
              selectedOptions: selectedOptions,
            );
          },
        );
      },
    );
  }
}