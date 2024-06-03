import 'package:app_version_compare/app_version_compare.dart';
import 'package:circuit_superintendent_tool/core/feature_toggles.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';

class ForceUpdateService {
  final FeatureToggles featureToggles;
  final PackageInfo packageInfo;
  final FirebaseRemoteConfig firebaseRemoteConfig;

  ForceUpdateService({required this.featureToggles, required this.packageInfo, required this.firebaseRemoteConfig});

  String get newUpdatedUrl => firebaseRemoteConfig.getString('new_update_url');
  AppVersion get currentVersion => AppVersion.fromString(packageInfo.version);
  AppVersion get remoteConfigVersion => AppVersion.fromString(firebaseRemoteConfig.getString('app_min_version'));

  Future<bool> forceUpdate() async {
    await firebaseRemoteConfig.fetch();
    await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await firebaseRemoteConfig.fetch();
    final AppVersion currentVersion = AppVersion.fromString(packageInfo.version);
    final AppVersion remoteConfigVersion = AppVersion.fromString(firebaseRemoteConfig.getString('app_min_version'));

    final currentAppIsLowerVersion = remoteConfigVersion > currentVersion;

    return featureToggles.forceUpdate && currentAppIsLowerVersion;
  }
}
