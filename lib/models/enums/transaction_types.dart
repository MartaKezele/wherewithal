import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum TransactionTypes {
  expense(icon: Icons.remove_rounded),
  income(icon: Icons.add_rounded);

  final IconData icon;

  const TransactionTypes({
    required this.icon,
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
      TransactionTypes.expense => AppLocalizations.of(context).expense,
      TransactionTypes.income => AppLocalizations.of(context).income,
    };
  }

  Color foregroundColor(BuildContext context) {
    return switch (this) {
      TransactionTypes.expense =>
        Theme.of(context).colorScheme.onErrorContainer,
      TransactionTypes.income =>
        Theme.of(context).colorScheme.onTertiaryContainer,
    };
  }
}
