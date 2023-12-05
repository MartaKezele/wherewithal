import '../../app_models/custom_dropdown_entry.dart';

bool subentrySelected(
  List<CustomDropdownEntry> selectedTiles,
  CustomDropdownEntry dropdownEntry,
) {
  if (selectedTiles.contains(dropdownEntry)) {
    return true;
  } else if (dropdownEntry.subEntries.isEmpty) {
    return false;
  }
  for (final entry in dropdownEntry.subEntries) {
    if (subentrySelected(selectedTiles, entry)) {
      return true;
    }
  }
  return false;
}
