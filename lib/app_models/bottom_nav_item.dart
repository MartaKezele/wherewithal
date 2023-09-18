import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavItem {
  final IconData icon;
  final GoRoute route;
  final String Function(BuildContext context) label;

  BottomNavItem({
    required this.icon,
    required this.route,
    required this.label,
  });
}
