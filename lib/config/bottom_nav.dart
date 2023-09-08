import 'package:flutter/material.dart';

import '../app_models/bottom_nav_item.dart';
import '../components/sections/budget.dart';
import '../components/sections/categories.dart';
import '../components/sections/insights.dart';
import '../components/sections/recurring_transactions.dart';
import '../utils/app_localizations.dart';

List<BottomNavItem> bottomNav() {
  final localizations = AppLocalizations.ofCurrentContext();

  return [
    BottomNavItem(
      icon: Icons.insights_rounded,
      label: localizations.insights,
      tooltip: localizations.insights,
      screen: const Insights(),
    ),
    BottomNavItem(
      icon: Icons.attach_money_rounded,
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
