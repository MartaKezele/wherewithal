import 'package:flutter/material.dart';

import '../app_models/bottom_nav_item.dart';
import '../components/add_bottom_sheet.dart';
import '../config/bottom_nav.dart';
import '../extensions/build_context.dart';
import '../l10n/app_localizations.dart';
import '../constants/themes/container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  int _bottomNavIndex = 0;
  late List<BottomNavItem> _bottomNav;
  late String _appBarTitle;

  void onFabPressed() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) => const AddBottomSheet(),
    );
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
      _appBarTitle = _bottomNav[index].label;
    });
  }

  @override
  didChangeDependencies() {
    WidgetsBinding.instance.addObserver(this);
    _bottomNav = bottomNav();
    _appBarTitle = _bottomNav[_bottomNavIndex].label;
    super.didChangeDependencies();
  }

  @override
  void didChangeLocales(List<Locale>? locale) {
    _appBarTitle = _bottomNav[0].label;
    super.didChangeLocales(locale);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: [
          IconButton(
            onPressed: () => context.pushSettings(),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: _bottomNav[_bottomNavIndex].screen,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onBottomNavItemTapped,
        items: _bottomNav
            .map(
              (navItem) => BottomNavigationBarItem(
                icon: Icon(
                  navItem.icon,
                ),
                label: navItem.label,
                tooltip: navItem.tooltip,
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFabPressed,
        shape: containerShape,
        tooltip: localizations.add,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
