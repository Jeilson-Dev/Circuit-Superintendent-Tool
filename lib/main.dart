import 'package:circuit_superintendent_tool/app.dart';
import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/features/splash_screen/splash_screen.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runApp(const SplashScreen());
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  final forceUpdate = await inject<ForceUpdateService>().forceUpdate();

  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDNS;
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(CSTApp(forceUpdate: forceUpdate)),
  );
}
