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

  // _deleteTable(String table) {
  //   if (_db != null) _db!.delete(table);
  // }

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

  Future<void> deleteCongregation({required int id}) async {
    await _db!.delete('congregations', where: 'id == $id');
  }

  Future<List<CongregationDTO>> getCongregations() async {
    final result = await _db!.query('congregations');
    return result.map((congregation) => CongregationDTO.fromJson(congregation)).toList();
  }

  // Future<ObjectDeliveryDto> save(ObjectDeliveryDto object) async {
  //   var dbClient = await db;
  //   if (dbClient != null) object.id = await dbClient.insert(table, object.toJson());
  //   return object;
  // }

  // Future<List<ObjectDeliveryDto>> getObjects() async {
  //   List<ObjectDeliveryDto> objectsDelivery = [];
  //   var dbClient = await db;
  //   if (dbClient != null) {
  //     List<Map> result = await dbClient.query(table, columns: [id, code, address, number]);

  //     if (result.isNotEmpty) {
  //       objectsDelivery = result.map((object) => ObjectDeliveryDto.fromJson(object as Map<String, dynamic>)).toList();
  //     }
  //   }
  //   return objectsDelivery;
  // }

  Future<int> delete(int id) async {
    var dbClient = await db;
    // if (dbClient != null) return await dbClient.delete(table, where: '$id = ?', whereArgs: [id]);
    return -1;
  }

  // Future<int> update(ObjectDeliveryDto employee) async {
  //   var dbClient = await db;
  //   if (dbClient != null) return await dbClient.update(table, employee.toJson(), where: '$id = ?', whereArgs: [employee.id]);
  //   return -1;
  // }

  Future close() async {
    var dbClient = await db;
    if (dbClient != null) dbClient.close();
  }
}
