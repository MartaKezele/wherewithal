import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

enum CategoryReasons {
  need,
  want,
  investment;

  static CategoryReasons? fromName(String? name) {
    if (name == null) {
      return null;
    }
    try {
      return CategoryReasons.values.byName(name);
    } on ArgumentError catch (_) {
      return null;
    }
  }

  String localizedName(BuildContext context) {
    return switch (this) {
      CategoryReasons.need => AppLocalizations.of(context).need,
      CategoryReasons.want => AppLocalizations.of(context).want,
      CategoryReasons.investment => AppLocalizations.of(context).investment,
    };
  }
}
