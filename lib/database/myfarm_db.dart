import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/myfarm.dart';


class MyFarmDatabase {
 static final MyFarmDatabase instance = MyFarmDatabase._init();

 static Database? _database;

 MyFarmDatabase._init();

 Future<Database> get database async {
  if (_database != null) return _database!;

  _database = await _initDB('myFarm.db');
  return _database!;
 }

 Future<Database> _initDB(String filePath) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);

  return await openDatabase(path, version: 1, onCreate: _createDB);
 }

 Future _createDB(Database db, int version) async {
  const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  const textType = 'TEXT NOT NULL';
  const boolType = 'BOOLEAN NOT NULL';
  const integerType = 'INTEGER NOT NULL';

  await db.execute('''
  
CREATE TABLE $tableFarms ( 
  ${MyFarmFields.id} $idType, 
  ${MyFarmFields.isImportant} $boolType,
  ${MyFarmFields.number} $integerType,
  ${MyFarmFields.title} $textType,
  ${MyFarmFields.description} $textType,
  ${MyFarmFields.time} $textType,
  )
  
''');
 }

 Future<Farm> create(Farm farm) async {
  final db = await instance.database;

  final id = await db.insert(tableFarms, farm.toJson());
  return farm.copy(id: id);
 }

 Future<Farm> viewFarm(int id) async {
  final db = await instance.database;

  final maps = await db.query(
   tableFarms,
   columns: MyFarmFields.values,
   where: '${MyFarmFields.id} = ?',
   whereArgs: [id],
  );

  if (maps.isNotEmpty) {
   return Farm.fromJson(maps.first);
  } else {
   throw Exception('ID $id not found');
  }
 }

 Future<List<Farm>> allFarm() async {
  final db = await instance.database;

  final orderBy = '${MyFarmFields.time} ASC';


  final result = await db.query(tableFarms, orderBy: orderBy);

  return result.map((json) => Farm.fromJson(json)).toList();
 }

 Future<int> update(Farm farm) async {
  final db = await instance.database;

  return db.update(
   tableFarms,
   farm.toJson(),
   where: '${MyFarmFields.id} = ?',
   whereArgs: [farm.id],
  );
 }

 Future<int> delete(int id) async {
  final db = await instance.database;

  return await db.delete(
   tableFarms,
   where: '${MyFarmFields.id} = ?',
   whereArgs: [id],
  );
 }

 Future close() async {
  final db = await instance.database;

  db.close();
 }
}