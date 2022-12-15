import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class SqliteDB {
  static final SqliteDB _instance = SqliteDB.internal();
  bool previousConnection = false;
  factory SqliteDB() => _instance;
  static Database? _db;
  Future<Database?> get db async {
    _db = await initDb();
    return _db;
  }

  SqliteDB.internal();
  initDb() async {
    String path = join(await getDatabasesPath(), "Bookmarks.db");
    if (kDebugMode) {
      print("Database===========================$path");
    }
    var taskDb = await openDatabase(path, version: 1, onConfigure: (db) {
      db.execute(
          '''CREATE TABLE IF NOT EXISTS USERIDS (ID INTEGER PRIMARY KEY AUTOINCREMENT, DRIVERID TEXT)''');
      print("Table Created");
    });
    return taskDb;
  }

  Future countTable() async {
    var dbClient = await db;
    var res = await dbClient!
        .rawQuery("""SELECT * FROM 'ELD_Data' ORDER BY ID DESC LIMIT 10""");
    print(res);
    return res;
  }
}
