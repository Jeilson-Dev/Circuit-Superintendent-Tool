import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 4)
class AppSettings {
  static const key = 'app_settings';
  static const themeModeKey = 'theme_mode';
  AppSettings({required this.themeMode});

  @HiveField(0)
  String themeMode;

  static ThemeMode convert(String? value) {
    if (value == ThemeMode.dark.name) return ThemeMode.dark;
    if (value == ThemeMode.light.name) return ThemeMode.light;
    return ThemeMode.system;
  }
}
