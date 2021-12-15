import 'package:findygo/constants/constant_bdd.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
/*
class BddController {
  static final _databaseName = ConstantesBdd.DB;

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  // make this a singleton class
  BddController._privateConstructor();

  static final BddController instance = BddController._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _db;

  Future<Database> get database async {
    return _db ??= await _initDatabase();
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: ConstantesBdd.VERSION, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    // Création de la table 'user'
    await db.execute("CREATE TABLE user ("
        "id INTEGER PRIMARY KEY NOT NULL,"
        "username TEXT,"
        "firstname TEXT,"
        "lastname TEXT,"
        "email TEXT,"
        "password TEXT,"
        "roles TEXT,"
        "phone TEXT,"
        "postal_address TEXT,"
        "additional_address TEXT,"
        "postal_code TEXT,"
        "city TEXT,"
        "department TEXT,"
        "country TEXT,"
        "picture_profil TEXT,"
        "creation_datetime TEXT,"
        "update_datetime TEXT,"
        "is_verified INTEGER"
        ")");
  }

  Future close() async => _db!.close();

  // Helper methods ColumnNameUser

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row, table) async {
    Database db = await instance.database;
    int id = await db.insert(table, row);
    return id;
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>?> queryAllRows(table, _query) async {
    Database db = await instance.database;
    List<Maps> maps = await db.query(table, _query);

    if(maps.length>0){
      return maps;
    }

    return null;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount(table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table.TUSER'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row, table) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id, table) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
*/