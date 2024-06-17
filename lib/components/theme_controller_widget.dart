import 'package:flutter/material.dart';

class ThemeController extends InheritedWidget {
  final void Function(ThemeMode themeMode) changeThemeMode;
  final ThemeMode themeMode;
  const ThemeController({super.key, required super.child, required this.changeThemeMode, required this.themeMode});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
