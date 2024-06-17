import 'package:circuit_superintendent_tool/components/force_update_widget.dart';
import 'package:circuit_superintendent_tool/components/theme_controller_widget.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/core/routes.dart';
import 'package:circuit_superintendent_tool/core/theme/app_theme.dart';
import 'package:circuit_superintendent_tool/features/splash_screen/splash_screen.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const SplashScreen());
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  final forceUpdate = await inject<ForceUpdateService>().forceUpdate();

  runApp(CSTApp(forceUpdate: forceUpdate));
}

class CSTApp extends StatefulWidget {
  const CSTApp({super.key, required this.forceUpdate});
  final bool forceUpdate;

  @override
  State<CSTApp> createState() => _CSTAppState();
}

class _CSTAppState extends State<CSTApp> {
  final routes = AppRoute.router('/home');
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
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

  void _changeTheme(ThemeMode themeMode) => setState(() => _themeMode = themeMode);
}
