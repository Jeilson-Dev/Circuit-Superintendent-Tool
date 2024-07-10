import 'package:circuit_superintendent_tool/core/core.dart';
import 'package:circuit_superintendent_tool/core/feature_toggles.dart';
import 'package:circuit_superintendent_tool/core/firebase_options.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/app_settings.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/congregation.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/group.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/visit.dart';
import 'package:circuit_superintendent_tool/features/create_visit/create_visit_cubit.dart';
import 'package:circuit_superintendent_tool/features/list_congregations/list_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/settings/manage_congregations/manage_congregations_cubit.dart';
import 'package:circuit_superintendent_tool/features/visits/visits_cubit.dart';
import 'package:circuit_superintendent_tool/repository/repository.dart';
import 'package:circuit_superintendent_tool/services/force_update_service.dart';
import 'package:circuit_superintendent_tool/services/hive_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flagsmith/flagsmith.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:package_info/package_info.dart';

final inject = GetIt.I;

String sentryDNS = '';

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

    sentryDNS = dotenv.env['SENTRY_DSN']!;
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

  final hiveService = await HiveService.init();

  GetIt.I.registerLazySingleton<HiveService>(() => hiveService);

  final congregationBox = await Hive.openBox<Congregation>(Congregation.key);

  final visitBox = await Hive.openBox<Visit>(Visit.key);

  final groupBox = await Hive.openBox<Group>(Group.key);

  final appSettings = await Hive.openBox<AppSettings>(AppSettings.key);

  GetIt.I.registerLazySingleton<Box<AppSettings>>(() => appSettings);

  GetIt.I.registerLazySingleton<Repository>(() => Repository(visitBox: visitBox, groupBox: groupBox, congregationBox: congregationBox));

  GetIt.I.registerLazySingleton<FlagsmithClient>(() => FlagsmithClient(apiKey: flagsmithClientApiKeyDev));

  final featureToggles = await inject<FlagsmithClient>().getFeatureFlags();

  final FeatureToggles toggles = FeatureToggles.fromFlagSmith(featureToggles);

  final packageInfo = await PackageInfo.fromPlatform();

  GetIt.I.registerLazySingleton<FeatureToggles>(() => toggles);

  GetIt.I.registerLazySingleton<PackageInfo>(() => packageInfo);

  GetIt.I.registerLazySingleton<FirebaseRemoteConfig>(() => FirebaseRemoteConfig.instance);

  GetIt.I.registerLazySingleton<CongregationsCubit>(() => CongregationsCubit(inject<Repository>()));

  GetIt.I.registerLazySingleton<ListCongregationsCubit>(() => ListCongregationsCubit());

  GetIt.I.registerLazySingleton<VisitsCubit>(() => VisitsCubit(inject<Repository>()));

  GetIt.I.registerLazySingleton<CreateVisitCubit>(() => CreateVisitCubit(inject<Repository>()));

  GetIt.I.registerLazySingleton<ForceUpdateService>(() => ForceUpdateService(
        featureToggles: inject<FeatureToggles>(),
        firebaseRemoteConfig: inject<FirebaseRemoteConfig>(),
        packageInfo: inject<PackageInfo>(),
      ));
}
