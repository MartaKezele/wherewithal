import 'package:flutter/material.dart';
import 'package:wherewithal/config/routes.dart';

import '../app_models/bottom_nav_item.dart';
import '../l10n/app_localizations.dart';

List<BottomNavItem> bottomNavItems = [
  BottomNavItem(
    icon: Icons.insights_rounded,
    route: TopLevelRoutes.insights,
    label: (BuildContext context) => AppLocalizations.of(context).insights,
  ),
  BottomNavItem(
    icon: Icons.event_repeat_rounded,
    route: TopLevelRoutes.recurringTransactions,
    label: (BuildContext context) =>
        AppLocalizations.of(context).recurringTransactions,
  ),
  BottomNavItem(
    icon: Icons.category_rounded,
    route: TopLevelRoutes.categories,
    label: (BuildContext context) => AppLocalizations.of(context).categories,
  ),
  BottomNavItem(
    icon: Icons.savings,
    route: TopLevelRoutes.budget,
    label: (BuildContext context) => AppLocalizations.of(context).budget,
  ),
];
