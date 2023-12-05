import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabStatefulShellBranch extends StatefulShellBranch {
  TabStatefulShellBranch({
    required this.label,
    required this.icon,
    required super.routes,
  });

  final String Function(BuildContext context) label;
  final IconData icon;
}

class TabStatefulShellRoute extends StatefulShellRoute {
  TabStatefulShellRoute({
    required this.tabBranches,
    required super.navigatorContainerBuilder,
    super.builder,
  }) : super(branches: tabBranches);

  final List<TabStatefulShellBranch> tabBranches;
}
