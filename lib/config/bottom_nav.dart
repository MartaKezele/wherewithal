import 'package:flutter/material.dart';
import 'package:wherewithal/components/sections/recurring_transactions.dart';
import 'package:wherewithal/config/router.dart';

import '../app_models/bottom_nav_item.dart';
import '../components/sections/budget.dart';
import '../components/sections/categories.dart';
import '../components/sections/insights.dart';
import '../l10n/app_localizations.dart';

List<BottomNavItem> bottomNav() {
  assert(navigatorKey.currentContext != null);
  final localizations = AppLocalizations.of(navigatorKey.currentContext!);

  return [
    BottomNavItem(
      icon: Icons.insights_rounded,
      label: localizations.insights,
      tooltip: localizations.insights,
      screen: const Insights(),
    ),
    BottomNavItem(
      icon: Icons.event_repeat_rounded,
      label: localizations.recurringTransactions,
      tooltip: localizations.recurringTransactions,
      screen: const RecurringTransactions(),
    ),
    BottomNavItem(
      icon: Icons.category_rounded,
      label: localizations.categories,
      tooltip: localizations.categories,
      screen: const Categories(),
    ),
    BottomNavItem(
      icon: Icons.savings,
      label: localizations.budget,
      tooltip: localizations.budget,
      screen: const Budget(),
    ),
  ];
}
