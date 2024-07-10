import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_page.dart';
import 'package:circuit_superintendent_tool/services/hive_service.dart';

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
            child: SingleChildScrollView(
                child: Column(children: [
              const ThemeSwitcher(),
              SectionSettingsMenuWidget(
                title: AppLocalizations.of(context)!.settingsPageManageCongregationsTitle,
                legend: AppLocalizations.of(context)!.settingsPageManageCongregationsLegend,
                content: Row(
                  children: [
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.settingsPageManageCongregationsButton),
                      onPressed: () {
                        context.go('/${SettingsPage.path}/${ManageCongregationPage.path}');
                      },
                    ),
                  ],
                ),
              ),
              SectionSettingsMenuWidget(
                title: AppLocalizations.of(context)!.settingsPageDataBaseManagementTitle,
                legend: AppLocalizations.of(context)!.settingsPageDataBaseManagementLegend,
                content: Row(children: [
                  TextButton(child: Text(AppLocalizations.of(context)!.settingsPageDataBaseManagementButton), onPressed: () => _showMyDialog()),
                ]),
              ),
              AppNav.placeholder()
            ]))));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AppDialog(
        title: AppLocalizations.of(context)!.settingsPageDataBaseManagementClearDatabaseTitle,
        verticalSizePercentage: 0.65,
        content: _DialogContent(),
      ),
    );
  }
}

class _DialogContent extends StatefulWidget {
  @override
  State<_DialogContent> createState() => __DialogContentState();
}

class __DialogContentState extends State<_DialogContent> {
  HiveService hiveService = inject<HiveService>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24, vertical: AppSpacing.x12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.settingsPageDataBaseManagementClearDatabaseCancel,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.error400),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.settingsPageDataBaseManagementClearDatabaseConfirm,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary600),
                  ),
                  onPressed: () async {
                    hiveService.deleteAllData();
                    if (context.mounted) Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
