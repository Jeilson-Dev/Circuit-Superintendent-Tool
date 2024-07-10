import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/app_settings.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_page.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:hive/hive.dart';

class CSTApp extends StatefulWidget {
  const CSTApp({super.key, required this.forceUpdate});
  final bool forceUpdate;

  @override
  State<CSTApp> createState() => _CSTAppState();
}

class _CSTAppState extends State<CSTApp> {
  final routes = AppRoute.router('/${VisitsPage.path}');
  final appSettingsBox = inject<Box<AppSettings>>();
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final appSettings = appSettingsBox.get(AppSettings.key);
    _themeMode = AppSettings.convert(appSettings?.themeMode);
    ThemeMode themeMode = _themeMode;
    var brightness = MediaQuery.of(context).platformBrightness;
    if (_themeMode == ThemeMode.system) {
      themeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }
    return ThemeController(
      themeMode: _themeMode,
      changeThemeMode: _changeTheme,
      child: widget.forceUpdate
          ? MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              themeMode: themeMode,
              theme: AppTheme.appThemeLight,
              darkTheme: AppTheme.appThemeDark,
              home: ForceUpdateWidget(forceUpdateService: inject<ForceUpdateService>()))
          : MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              themeMode: themeMode,
              theme: AppTheme.appThemeLight,
              darkTheme: AppTheme.appThemeDark,
              routerConfig: routes,
              debugShowCheckedModeBanner: false),
    );
  }

  void _changeTheme(ThemeMode themeMode) => setState(() {
        appSettingsBox.put(AppSettings.key, AppSettings(themeMode: themeMode.name));
        _themeMode = themeMode;
      });
}
