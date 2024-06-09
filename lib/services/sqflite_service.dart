import 'dart:async';

import 'package:circuit_superintendent_tool/dto/congregation_dto.dart';
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
    await db.execute('''CREATE TABLE congregations (
      id INTEGER PRIMARY KEY,
      name TEXT,
      city TEXT)''');

    await db.execute('''CREATE TABLE visits (
      id INTEGER PRIMARY KEY,
      congregation_id,
      foreign key (congregation_id) references congregations (id))''');

    await db.execute('''CREATE TABLE groups (
      id INTEGER PRIMARY KEY,
      group_number INTEGER,
      members_amount INTEGER,
      responsible TEXT,
      publishers_actives INTEGER,
      publishers_baptized INTEGER,
      publishers_not_baptized INTEGER,
      assistant_pioneer INTEGER,
      studies INTEGER,
      irregular_publishers INTEGER,
      irregular_publishers_observation TEXT,
      inactive_publishers INTEGER,
      publishers_without_studies_or_revisit INTEGER,
      group_id, 
      foreign key (group_id) references congregations (id))''');
  }

  Future<void> createCongregation({required String name, required String city}) async {
    if (name.isEmpty || city.isEmpty) throw 'You must provide completed fields';
    await _db!.insert('congregations', {'id': null, 'name': name, 'city': city});
  }

  Future<void> updateCongregation({required int id, required String name, required String city}) async {
    if (name.isEmpty || city.isEmpty) throw 'You must provide completed fields';
    await _db!.update('congregations', {'name': name, 'city': city}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteCongregation({required int id}) async {
    await _db!.delete('congregations', where: 'id == $id');
  }

  Future<List<CongregationDTO>> getCongregations() async {
    final database = await db;
    final result = await database.query('congregations');
    return result.map((congregation) => CongregationDTO.fromJson(congregation)).toList();
  }

  Future close() async {
    await db.then((db) => db.close());
  }
}
