import 'package:flutter/material.dart';

Color dropdownColor(BuildContext context) =>
    Theme.of(context).colorScheme.background;

TextStyle? dropdownTextStyle(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        );

TextStyle? disabledDropdownTextStyle(BuildContext context) =>
    dropdownTextStyle(context)?.copyWith(
      color: Theme.of(context).colorScheme.outline,
    );
