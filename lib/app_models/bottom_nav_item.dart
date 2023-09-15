import 'package:flutter/material.dart';
import 'package:wherewithal/app_models/named_go_route.dart';

class BottomNavItem {
  final IconData icon;
  final NamedGoRoute route;
  final String Function(BuildContext context) label;

  BottomNavItem({
    required this.icon,
    required this.route,
    required this.label,
  });
}
