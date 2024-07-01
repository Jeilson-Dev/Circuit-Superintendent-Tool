import 'dart:async';
import 'dart:io';

import 'package:circuit_superintendent_tool/core/logger.dart';
import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
import 'package:circuit_superintendent_tool/dto/visit_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFliteService {
  static Database? _db;

  static const String dbName = 'cst.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    var documentsDirectory = await getDatabasesPath();

    String dbPath = join(documentsDirectory, dbName);
    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    congregation_id INTEGER NOT NULL,
    visit_id INTEGER NOT NULL,
    responsible TEXT NOT NULL,
    group_number INTEGER NOT NULL,
    studies INTEGER NOT NULL,
    publisher_without_studies INTEGER NOT NULL,
    active_publishers INTEGER NOT NULL,
    baptized_publishers INTEGER NOT NULL,
    not_baptized_publishers INTEGER NOT NULL,
    regular_pioneers INTEGER NOT NULL,
    auxiliary_pioneers INTEGER NOT NULL,
    FOREIGN KEY (congregation_id) REFERENCES congregations(id),
    FOREIGN KEY (visit_id) REFERENCES visits(id)
    )''');

    await db.execute('''CREATE TABLE irregular_publishers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    details TEXT,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(id)
    )''');

    await db.execute('''CREATE TABLE potential_pioneers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    details TEXT,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(id)
    )''');

    await db.execute('''CREATE TABLE potential_elders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    details TEXT,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(id)
    )''');

    await db.execute('''CREATE TABLE potential_ministerial_servants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    details TEXT,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(id)
    )''');

    await db.execute('''CREATE TABLE visits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    previous_visit_id INTEGER,
    congregation_id INTEGER NOT NULL,
    visit_date TEXT NOT NULL,
    mid_week_assistance INTEGER NOT NULL,
    weekend_assistance INTEGER NOT NULL,
    inactive_publishers INTEGER NOT NULL,
    disassociated_publishers INTEGER NOT NULL,
    FOREIGN KEY (previous_visit_id) REFERENCES visits(id),
    FOREIGN KEY (congregation_id) REFERENCES congregations(id)
    )''');

    await db.execute('''CREATE TABLE congregations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    last_visit INTEGER,
    FOREIGN KEY (last_visit) REFERENCES visits(id)
    )''');
  }

  Future<void> createCongregation({required String name, required String city}) async {
    if (name.isEmpty || city.isEmpty) throw 'You must provide completed fields';
    await _db!.insert('congregations', {'id': null, 'name': name, 'city': city});
  }

  Future<void> updateCongregation({required int id, required String name, required String city, int? lastVisit}) async {
    if (name.isEmpty || city.isEmpty) throw 'You must provide completed fields';
    await _db!.update('congregations', {'name': name, 'city': city, 'last_visit': lastVisit}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteCongregation({required int id}) async {
    await _db!.delete('congregations', where: 'id == $id');
  }

  Future<List<CongregationDTO>> getCongregations({int? congregationId}) async {
    final database = await db;
    final result = await database.query('congregations', where: congregationId != null ? 'id == $congregationId' : null);
    final congregations = result.map((congregationData) async {
      CongregationDTO congregation = CongregationDTO.fromJson(congregationData);
      final lastVisitId = congregationData['last_visit'];
      if (lastVisitId != null) {
        final lastVisit = (await getVisits(visitId: congregation.lastVisit?.id)).firstOrNull;
        congregation = congregation.copyWith(lastVisit: lastVisit);
      }
      return congregation;
    }).toList();

    return congregations.wait;
  }

  Future<void> createVisit({required int congregationId}) async {
    CongregationDTO? congregation = (await getCongregations(congregationId: congregationId)).firstOrNull;

    if (congregation == null) throw 'Fail to load congregation';
    VisitDTO? lastVisit = (await getVisits(visitId: congregation.lastVisit?.id)).firstOrNull;

    final newVisitId = await _db!.insert('visits', {
      'id': null,
      'previous_visit_id': lastVisit?.id,
      'congregation_id': congregation.id,
      'visit_date': '',
      'mid_week_assistance': 0,
      'weekend_assistance': 0,
      'inactive_publishers': 0,
      'disassociated_publishers': 0
    });

    await updateCongregation(id: congregation.id, name: congregation.name, city: congregation.city, lastVisit: newVisitId);
  }

  Future<void> updateVisit({required int id, required String name, required String city}) async {
    if (name.isEmpty || city.isEmpty) throw 'You must provide completed fields';
    await _db!.update('visits', {'name': name, 'city': city}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteVisit({required int id}) async {
    await _db!.delete('visits', where: 'id == $id');
  }

  Future<List<VisitDTO>> getVisits({int? visitId}) async {
    final database = await db;
    final result = await database.query('visits', where: visitId != null ? 'id == $visitId' : null);
    return result.map((congregation) => VisitDTO.fromJson(congregation)).toList();
  }

  Future close() async {
    await db.then((db) => db.close());
  }

  Future clearDatabase() async {
    try {
      var documentsDirectory = await getDatabasesPath();
      String dbPath = join(documentsDirectory, dbName);
      await File(dbPath).delete();
      _db = await _initDb();
    } catch (exception) {
      Logger.e(message: 'Fail to clear database', exception: exception);
    }
  }
}
