import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/app_models/bottom_nav_item.dart';
import 'package:wherewithal/extensions/build_context.dart';

import '../../components/add_bottom_sheet.dart';
import '../../constants/styles/container.dart';
import '../../l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.body,
    required this.bottomNav,
  });

  final Widget body;
  final List<BottomNavItem> bottomNav;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentBottomNavIndex = 0;

  void _onFabPressed() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => const AddBottomSheet(),
    );
  }

  void _onBottomNavItemTap(index) {
    context.go(widget.bottomNav[index].route.path);
    setState(() {
      _currentBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bottomNav[_currentBottomNavIndex].label(context)),
        actions: [
          IconButton(
            onPressed: () => context.pushSettings(),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: widget.body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentBottomNavIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onBottomNavItemTap,
        items: widget.bottomNav
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: Icon(
                  navItem.icon,
                ),
                label: navItem.label(context),
                tooltip: navItem.label(context),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        shape: containerShape,
        tooltip: localizations.add,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
