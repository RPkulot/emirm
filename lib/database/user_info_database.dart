import 'dart:typed_data';
import 'dart:io';
import 'package:eirmuplb/model/insecticidehistory.dart';
import 'package:eirmuplb/model/pesticide.dart';
import 'package:eirmuplb/model/userphonenumber.dart';
import 'package:eirmuplb/model/fpalist.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EIRMUserInfoDatabase {

  static final EIRMUserInfoDatabase instance = EIRMUserInfoDatabase._init();

  static Database? _database;

  EIRMUserInfoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('demo_asset_example.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    var databasesPath = await getDatabasesPath();

    var path = join(databasesPath!, filePath);

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
    // Should happen only the first time you launch your application
      print("Creating new copy from asset");

    // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

    // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "userdata.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // open the database
    return await openDatabase(path, readOnly: false);
  }

  Future<void> adduserphonenumber(UserPhoneNumberModel userphonenumber) async {
    final db = await database;

    await db.insert(
        'user',
        userphonenumber.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future regenerateDB() async{
    final db = await database;
  }

  Future<int?> tableIsEmpty() async {
    final db = await database;

    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM user'));
  }

  Future<int?> tableinsecticidehistoryIsEmpty() async {
    final db = await database;

    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM insecticidehistory'));
  }

  // Future<int?> tableusablepesticideIsEmpty() async {
  //   final db = await database;
  //
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT * FROM usablepesticide'));
  // }

  Future<void> deleteDatabase() async {
    var databasesPath = await getDatabasesPath();
    databaseFactory.deleteDatabase(
        join(databasesPath!, 'demo_asset_example.db'));
  }

  Future<List<InsecticideHistoryModel>> insecticideHistory() async {
    // Get a reference to the database.
    final db = await database;

    final result = await db.query('insecticidehistory');

    return result.map((json) => InsecticideHistoryModel.fromMap(json)).toList();
  }

  Future<void> insertInsecticideHistory(InsecticideHistoryModel insecticidehistory) async {
    final db = await database;

    await db.insert(
        'insecticidehistory',
        insecticidehistory.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> deselectInsecticideHistory() async {
    final db = await database;

    await db.rawQuery('UPDATE insecticidehistory SET is_current = 0 WHERE is_current = 1');

  }

  Future<void> selectCurrentInsecticideHistory(String enddate) async {
    final db = await database;
    print('kek');
    print(enddate);
    print('kek');
    await db.rawUpdate('UPDATE insecticidehistory SET is_current = ? WHERE enddate = ?', [1, enddate]);

  }

  Future<InsecticideHistoryModel> currentInsecticideHistory() async{
    final db = await database;

    final currentInsecticide = await db.query('insecticidehistory', where: 'is_current = ?', whereArgs: [1]);
    if (currentInsecticide.isNotEmpty) {
      return InsecticideHistoryModel.fromMap(currentInsecticide.first);
    } else {
      throw Exception('current insecticide not found');
    }
  }

  Future<bool?> checkFreshInsecticideHistory() async{
    final db = await database;

    final tablehasactive = await db.query('insecticidehistory', where: 'is_current = ?', whereArgs: [1]);

    if (tablehasactive.isEmpty) {
      return true;
    } else if (tablehasactive.isNotEmpty){
      return false;
    }
  }

  // Future<int?> checkFreshInsecticideHistory() async{
  //   final db = await database;
  //
  //   final currentInsecticide = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM insecticidehistory'));
  //
  //   if (currentInsecticide) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  Future <void> deleteinsecticidehistory() async{
    final db = await database;
    await db.rawQuery('DELETE FROM insecticidehistory');
  }

  Future rawQuery() async{
    final db = await database;
    List<Map> insecticidehistorylist = await db.rawQuery('SELECT * FROM insecticidehistory');
    print(insecticidehistorylist);
    print(insecticidehistorylist.length);
    print('lul');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}