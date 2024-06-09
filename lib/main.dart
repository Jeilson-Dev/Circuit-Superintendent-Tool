import 'package:circuit_superintendent_tool/components/force_update_widget.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/core/routes.dart';
import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/features/congregations/congregations_page.dart';
import 'package:circuit_superintendent_tool/features/splash_screen/splash_screen.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:flutter/material.dart';

const routes = AppRoute.router;

void main() async {
  runApp(const SplashScreen());
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  final forceUpdate = await inject<ForceUpdateService>().forceUpdate();

  runApp(ForceUpdateWrapper(forceUpdate: forceUpdate, forceUpdateService: inject<ForceUpdateService>(), child: const CSTApp()));
}

class CSTApp extends StatefulWidget {
  const CSTApp({super.key});

  @override
  State<CSTApp> createState() => _CSTAppState();
}

class _CSTAppState extends State<CSTApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600)),
        routerConfig: routes('/${CongregationPage.path}'),
        debugShowCheckedModeBanner: false);
  }
}
