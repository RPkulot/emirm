import 'dart:typed_data';
import 'dart:io';
import 'package:eirmuplb/model/insecticidehistory.dart';
import 'package:eirmuplb/model/pesticide.dart';
import 'package:eirmuplb/model/userphonenumber.dart';
import 'package:eirmuplb/model/fpalist.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/mapdata.dart';

class EIRMAssetDatabase {

  static final EIRMAssetDatabase instance = EIRMAssetDatabase._init();

  static Database? _database;

  EIRMAssetDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('asset_database.db');
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
      ByteData data = await rootBundle.load(join("assets", "iracmoagroup.db"));
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

  Future regenerateDB() async{
    final db = await database;
  }

  // Future<int?> tableusablepesticideIsEmpty() async {
  //   final db = await database;
  //
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT * FROM usablepesticide'));
  // }

  Future<List<FPAListModel>> fpaList() async {
    // Get a reference to the database.
    final db = await database;

    final orderBy = '${'moagroup'} ASC';

    final result = await db.query('fpalist', orderBy: orderBy);

    List<FPAListModel> fpalist =  result.map((json) => FPAListModel.fromMap(json)).toList();

    return fpalist;
  }

  Future<List<FPAListModel>> searchFPAList(String keyword, String moagroup) async {
    final db = await database;
    List<Map<String, dynamic>> allRows = await db.query('fpalist', where: 'activeingredient LIKE ? and moagroup = ?', whereArgs: ['%$keyword%', '$moagroup']);
    List<FPAListModel> fpaList = allRows.map((pesticide) => FPAListModel.fromMap(pesticide)).toList();
    return fpaList;
  }

  Future<List<PesticideModel>> moaGroups() async {
    final db = await database;
    final allRows = await db.rawQuery('SELECT DISTINCT moagroup FROM iracmoa');
    var moaGroupsList = allRows.map((pesticide) => PesticideModel.fromMap(pesticide)).toList();
    return moaGroupsList;
  }

  Future<List<PesticideModel>> searchPesticides(String keyword, String moagroup) async {
    final db = await database;
    List<Map<String, dynamic>> allRows = await db.query('iracmoa', where: 'activeingredient LIKE ? and moagroup = ?', whereArgs: ['%$keyword%', '$moagroup']);
    List<PesticideModel> pesticidesList = allRows.map((pesticide) => PesticideModel.fromMap(pesticide)).toList();
    return pesticidesList;
    // List<Map<String, dynamic>> allRows = await db
    //     .query('contact', where: 'contactName LIKE ?', whereArgs: ['%$keyword%']);
    // List<Contact> contacts =
    // allRows.map((contact) => Contact.fromMap(contact)).toList();
    // return contacts;
  }

  Future<List<MapDataModel>> mapdata() async {
    // Get a reference to the database.
    final db = await database;

    // final orderBy = '${'region'} ASC';

    final result = await db.query('mapdata');

    List<MapDataModel> mapdata =  result.map((json) => MapDataModel.fromMap(json)).toList();

    return mapdata;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}