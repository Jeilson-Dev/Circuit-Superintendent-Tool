import 'package:circuit_superintendent_tool/components/settings_menu_section_widget.dart';
import 'package:circuit_superintendent_tool/components/theme_switcher.dart';
import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static String get path => 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settingsPageTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.x8),
          child: Column(children: [
            const ThemeSwitcher(),
            SectionSettingsMenuWidget(
              title: 'Gerenciar Congregações',
              legend: 'Criar, editar ou excluir congregações',
              content: Row(
                children: [
                  TextButton(
                    child: Text('Gerenciar Congregações'),
                    onPressed: () {
                      context.go('/${SettingsPage.path}/${ManageCongregationPage.path}');
                    },
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
