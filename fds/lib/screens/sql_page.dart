import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDB('not.db');
      return _db;
    } else {
      return _db;
    }
  }

  _initDB(String db_name) async {
    String databasepath = await getDatabasesPath();
    String _path = join(databasepath, db_name);
    Database? _mydb =
        await openDatabase(_path, onCreate: _oncreate, version: 1);
    return _mydb;
  }

  _oncreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE notes (id INTEGER PRIMARY KEY ,title TEXT , desc TEXT , date TEXT )');
    print('on create  >>>..........');
  }

  insertdata(String sql) async {
    Database? mydb = await db;
    int responce = await mydb!.rawInsert(sql);
    return responce;
  }

  readtdata(String sql) async {
    Database? mydb = await db;
    List<Map> responce = await mydb!.rawQuery(sql);
    return responce;
  }

  updatetdata(String sql) async {
    Database? mydb = await db;
    int responce = await mydb!.rawUpdate(sql);
    return responce;
  }

  deletedata(String sql) async {
    Database? mydb = await db;
    int responce = await mydb!.rawDelete(sql);
    return responce;
  }
}
