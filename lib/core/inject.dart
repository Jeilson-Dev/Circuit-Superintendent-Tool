import 'package:circuit_superintendent_tool/core/feature_toggles.dart';
import 'package:circuit_superintendent_tool/core/firebase_options.dart';
import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_cubit.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:circuit_superintendent_tool/services/sqflite_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flagsmith/flagsmith.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';

final inject = GetIt.I;

setupInjection() async {
  await inject.reset();

  const String fileName = '.env';

//android keys
  String apiKeyAndroid = '';
  String appIdAndroid = '';
  String messagingSenderIdAndroid = '';
  String projectIdAndroid = '';
  String storageBucketAndroid = '';

//ios Keys
  String apiKeyIos = '';
  String appIdIos = '';
  String messagingSenderIdIos = '';
  String projectIdIos = '';
  String storageBucketIos = '';
  String iosBundleIdIos = '';
  String flagsmithClientApiKeyDev = '';
  try {
    await dotenv.load(fileName: fileName);

    apiKeyAndroid = dotenv.env['API_KEY_ANDROID']!;
    appIdAndroid = dotenv.env['APP_ID_ANDROID']!;
    messagingSenderIdAndroid = dotenv.env['MESSAGING_SENDER_ID_ANDROID']!;
    projectIdAndroid = dotenv.env['PROJECT_ID_ANDROID']!;
    storageBucketAndroid = dotenv.env['STORAGE_BUCKET_ANDROID']!;

    apiKeyIos = dotenv.env['API_KEY_IOS']!;
    appIdIos = dotenv.env['APP_ID_IOS']!;
    messagingSenderIdIos = dotenv.env['MESSAGING_SENDER_ID_IOS']!;
    projectIdIos = dotenv.env['PROJECT_ID_IOS']!;
    storageBucketIos = dotenv.env['STORAGE_BUCKET_IOS']!;
    iosBundleIdIos = dotenv.env['IOS_BUNDLE_ID_IOS']!;

    flagsmithClientApiKeyDev = dotenv.env['FLAGSMITH_CLIENT_API_KEY_DEV']!;
  } catch (exception) {
    Logger.e(message: 'Fail to load environment keys, from file: "$fileName"', exception: exception);
  }

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(
          android: FirebaseOptions(
            apiKey: apiKeyAndroid,
            appId: appIdAndroid,
            messagingSenderId: messagingSenderIdAndroid,
            projectId: projectIdAndroid,
            storageBucket: storageBucketAndroid,
          ),
          ios: FirebaseOptions(
            apiKey: apiKeyIos,
            appId: appIdIos,
            messagingSenderId: messagingSenderIdIos,
            projectId: projectIdIos,
            storageBucket: storageBucketIos,
            iosBundleId: iosBundleIdIos,
          )));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  GetIt.I.registerLazySingleton<FlagsmithClient>(() => FlagsmithClient(apiKey: flagsmithClientApiKeyDev));

  final featureToggles = await inject<FlagsmithClient>().getFeatureFlags();

  final FeatureToggles toggles = FeatureToggles.fromFlagSmith(featureToggles);

  final packageInfo = await PackageInfo.fromPlatform();

  GetIt.I.registerLazySingleton<FeatureToggles>(() => toggles);

  GetIt.I.registerLazySingleton<PackageInfo>(() => packageInfo);

  GetIt.I.registerLazySingleton<SQFliteService>(() => SQFliteService());

  GetIt.I.registerLazySingleton<FirebaseRemoteConfig>(() => FirebaseRemoteConfig.instance);

  GetIt.I.registerLazySingleton<CongregationsCubit>(() => CongregationsCubit(inject<SQFliteService>()));

  GetIt.I.registerLazySingleton<ListCongregationsCubit>(() => ListCongregationsCubit(inject<SQFliteService>()));

  GetIt.I.registerLazySingleton<VisitsCubit>(() => VisitsCubit(inject<SQFliteService>()));

  GetIt.I.registerLazySingleton<ForceUpdateService>(() => ForceUpdateService(
        featureToggles: inject<FeatureToggles>(),
        firebaseRemoteConfig: inject<FirebaseRemoteConfig>(),
        packageInfo: inject<PackageInfo>(),
      ));
}
