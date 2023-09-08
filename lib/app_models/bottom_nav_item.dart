import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String label;
  final String tooltip;
  final Widget screen;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.screen,
  });
}
