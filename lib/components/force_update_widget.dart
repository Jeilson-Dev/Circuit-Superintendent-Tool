import 'package:circuit_superintendent_tool/core/app_spacing.dart';
import 'package:circuit_superintendent_tool/core/localizations.dart';
import 'package:circuit_superintendent_tool/gen/assets.gen.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateWrapper extends StatefulWidget {
  const ForceUpdateWrapper({super.key, required this.child, required this.forceUpdate, required this.forceUpdateService});
  final Widget child;
  final bool forceUpdate;
  final ForceUpdateService forceUpdateService;
  @override
  State<ForceUpdateWrapper> createState() => _ForceUpdateWrapperState();
}

class _ForceUpdateWrapperState extends State<ForceUpdateWrapper> {
  Uri get _url => Uri.parse(widget.forceUpdateService.newUpdatedUrl);

  @override
  Widget build(BuildContext context) {
    if (widget.forceUpdate) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.forceUpdateWidgetNewVersionAvailable,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.x12),
                  child: Lottie.asset(Assets.lotties.forceUpdate),
                ),
                ElevatedButton(onPressed: () async => await _launchUrl(), child: Text(AppLocalizations.of(context)!.forceUpdateWidgetUpdate)),
                Text(AppLocalizations.of(context)!.forceUpdateWidgetCurrentVersion(widget.forceUpdateService.currentVersion.toString())),
                Text(AppLocalizations.of(context)!.forceUpdateWidgetNewVersion(widget.forceUpdateService.remoteConfigVersion.toString())),
              ],
            ),
          ));
    } else {
      return widget.child;
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
