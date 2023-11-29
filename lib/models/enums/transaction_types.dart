import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum TransactionTypes {
  expense(
    icon: Icons.remove_rounded,
    operand: '-',
  ),
  income(
    icon: Icons.add_rounded,
    operand: '+',
  );

  final IconData icon;
  final String operand;

  const TransactionTypes({
    required this.icon,
    required this.operand,
  });

  static TransactionTypes? fromName(String? name) {
    if (name == null) {
      return null;
    }
    try {
      return TransactionTypes.values.byName(name);
    } on ArgumentError catch (_) {
      return null;
    }
  }

  String localizedName(BuildContext context) {
    return switch (this) {
      expense => AppLocalizations.of(context).expense,
      income => AppLocalizations.of(context).income,
    };
  }

  Color foregroundColor(BuildContext context) {
    return switch (this) {
      expense =>
        Theme.of(context).colorScheme.onErrorContainer,
      income =>
        Theme.of(context).colorScheme.onTertiaryContainer,
    };
  }

  Color backgroundColor(BuildContext context) {
    return switch (this) {
      expense => Theme.of(context).colorScheme.errorContainer,
      income =>
        Theme.of(context).colorScheme.tertiaryContainer,
    };
  }
}
