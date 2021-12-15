import 'package:findygo/constants/constant_bdd.dart';
import 'package:flutter/cupertino.dart';
import 'user.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDB {
  static Database? _db;

  SqliteDB();

  SqliteDB._privateConstructor();

  static final SqliteDB instance = SqliteDB._privateConstructor();

  Future<Database> get db async {
    return _db ??= await _initDatabase();
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'findygo');
    return await openDatabase(path, version: 1, onCreate: _open);
  }

  Future<void> _open(Database _SqliteDB, a1) async {
    var dbClient = await db;
    try {
      await dbClient.execute(Column_UserName.queryCreateUserTable);
      print(
          "+++++++++++++++++++++++++++++++++++++++++++++++ Table 'user' créée en base !");
    } catch (err) {
      print(
          "+++++++++++++++++++++++++++++++++++++++++++++++ Erreur création de la table 'user' !");
    }
  }

  Future<int> insert(String _tableName, var jsonObj) async {
    print("////////////////////////////////////// Insert Objet à inserer = ");
    print(jsonObj);
    Database db = await instance.db;
    int id = await db.insert(_tableName, jsonObj);
    print("+++++++++++++++++++++++++++++++++++++++++++++++ Insert id = $id !");
    return id;
  }

  Future<List<Map<String, dynamic>>> getAll(String _tableName) async {
    Database db = await instance.db;
    //List<Map>

    List<Map<String, dynamic>> maMaps =
        await db.rawQuery('SELECT * FROM $_tableName');
/*
    User p1 = User();

    if (maMaps.isNotEmpty) {
      p1 = User.fromMap(maMaps.first);
    }*/
    return maMaps;
  }

  Future<User> getPersonne(String _tableName, int myId) async {
    Database db = await instance.db;
    List<Map> maps = await db.query(_tableName,
        columns: [
          Column_UserName.id,
          Column_UserName.username,
          Column_UserName.firstname,
          Column_UserName.lastname,
          Column_UserName.email,
          Column_UserName.password,
          Column_UserName.roles,
          Column_UserName.phone,
          Column_UserName.postal_address,
          Column_UserName.additional_address,
          Column_UserName.postal_code,
          Column_UserName.city,
          Column_UserName.department,
          Column_UserName.country,
          Column_UserName.picture_profil,
          Column_UserName.creation_datetime,
          Column_UserName.update_datetime,
          Column_UserName.is_verified,
        ],
        where: '$Column_UserName.id = ?',
        whereArgs: [myId]);

    User p1 = User();

    if (maps.isNotEmpty) {
      p1 = User.fromMap(maps.first);
    }
    return p1;
  }

  Future<int> delete(String _tableName, int myId) async {
    Database db = await instance.db;
    return await db.delete(_tableName,
        where: '$Column_UserName.id = ?', whereArgs: [myId]);
  }

  Future<int?> getCount(String _tableName) async {
    Database dbClient = await db;
    var x = await dbClient.rawQuery('SELECT COUNT (*) from $_tableName');
    int? count = Sqflite.firstIntValue(x);
    print(
        '****************************** Nb lignes dans la table $_tableName = ' +
            count.toString() +
            " ligne(s).");
    return count;
  }

  Future close() async => _db!.close();
}
