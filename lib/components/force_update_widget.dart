import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';

class ForceUpdateWidget extends StatefulWidget {
  const ForceUpdateWidget({super.key, required this.forceUpdateService});

  final ForceUpdateService forceUpdateService;
  @override
  State<ForceUpdateWidget> createState() => _ForceUpdateWidgetState();
}

class _ForceUpdateWidgetState extends State<ForceUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Text(AppLocalizations.of(context)!.forceUpdateWidgetCurrentVersion(widget.forceUpdateService.currentVersion.toString())),
        Text(AppLocalizations.of(context)!.forceUpdateWidgetNewVersion(widget.forceUpdateService.remoteConfigVersion.toString())),
      ],
    ));
  }
}
