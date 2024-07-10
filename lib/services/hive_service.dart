import 'dart:io';

import 'package:circuit_superintendent_tool/core/inject.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/app_settings.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/congregation.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/group.dart';
import 'package:circuit_superintendent_tool/dto/hive_adapters/visit.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<HiveService> init() async {
    var path = Directory.current.path;
    Hive.init(path);
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CongregationAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(GroupAdapter());
    if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(VisitAdapter());
    if (!Hive.isAdapterRegistered(4)) Hive.registerAdapter(AppSettingsAdapter());

    await Hive.initFlutter();
    return HiveService();
  }

  Future<void> deleteAllData() async {
    Hive.deleteBoxFromDisk(Visit.key);
    Hive.deleteBoxFromDisk(Group.key);
    Hive.deleteBoxFromDisk(Congregation.key);
    await setupInjection();
  }
}
