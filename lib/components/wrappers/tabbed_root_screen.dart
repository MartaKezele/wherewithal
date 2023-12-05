import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_models/tab_stateful_shell_branch.dart';
import '../home_app_bar.dart';

class TabbedRootScreen extends StatefulWidget {
  TabbedRootScreen({
    super.key,
    required this.navigationShell,
    required this.children,
    required this.appBarTitle,
  }) {
    assert(navigationShell.route.branches
        .every((branch) => branch is TabStatefulShellBranch));
  }

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  final String appBarTitle;

  @override
  State<StatefulWidget> createState() => _TabbedRootScreenState();
}

class _TabbedRootScreenState extends State<TabbedRootScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: widget.children.length,
    vsync: this,
    initialIndex: widget.navigationShell.currentIndex,
  );

  void _onTabTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(index);
  }

  @override
  void didUpdateWidget(covariant TabbedRootScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.navigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = widget.navigationShell.route.branches.map((branch) {
      final tabBranch = branch as TabStatefulShellBranch;
      return Tab(
        text: tabBranch.label(context),
        icon: Icon(tabBranch.icon),
      );
    }).toList();

    return Scaffold(
      appBar: homeAppBar(
          title: widget.appBarTitle,
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
            onTap: (int tappedIndex) => _onTabTap(context, tappedIndex),
          ),
          context: context),
      body: TabBarView(
        controller: _tabController,
        children: widget.children,
      ),
    );
  }
}
