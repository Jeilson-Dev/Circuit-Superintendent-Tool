import 'package:circuit_superintendent_tool/components/settings_menu_section_widget.dart';
import 'package:circuit_superintendent_tool/components/theme_controller_widget.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return SectionSettingsMenuWidget(
      title: AppLocalizations.of(context)!.settingsPageTitleThemeSelector,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ThemeModeIcon(label: AppLocalizations.of(context)!.settingsPageTitleThemeSelectorLight, icon: Icons.light_mode, themeMode: ThemeMode.light),
          _ThemeModeIcon(label: AppLocalizations.of(context)!.settingsPageTitleThemeSelectorDark, icon: Icons.dark_mode, themeMode: ThemeMode.dark),
          _ThemeModeIcon(label: AppLocalizations.of(context)!.settingsPageTitleThemeSelectorAuto, icon: Icons.smartphone, themeMode: ThemeMode.system),
        ],
      ),
    );
  }
}

class _ThemeModeIcon extends StatelessWidget {
  const _ThemeModeIcon({required this.label, required this.icon, required this.themeMode});
  final String label;
  final IconData icon;

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appBarTheme;
    final themeSwitcher = context.dependOnInheritedWidgetOfExactType<ThemeController>()!;
    final Color selected = theme.actionsIconTheme!.color!.withOpacity(themeSwitcher.themeMode == themeMode ? 1 : 0.3);
    final Color background = theme.actionsIconTheme!.color!.withOpacity(themeSwitcher.themeMode != themeMode ? 0.3 : 0.2);

    return InkWell(
      onTap: () => themeSwitcher.changeThemeMode(themeMode),
      child: Container(
        width: AppSpacing.x80,
        height: AppSpacing.x76,
        decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(AppSpacing.x12)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.x4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: selected),
              Text(label, style: AppTextTheme.bodyMedium.copyWith(color: selected)),
            ],
          ),
        ),
      ),
    );
  }
}
