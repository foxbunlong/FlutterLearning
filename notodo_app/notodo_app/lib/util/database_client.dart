import 'dart:async';
import 'dart:io';
import 'package:notodo_app/model/nodo_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

// Singleton class for database access
class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  // Config table
  final String tableNoDoItem = "noDoTbl";
  final String columnId = "id";
  final String columnItemname = "itemName";
  final String columDateCreated = "dateCreated";

  // Private constructor to this class
  DatabaseHelper.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "maindb.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableNoDoItem($columnId INTEGER PRIMARY KEY, $columnItemname TEXT, $columDateCreated TEXT)");
  }

  // CRUD
  // Insert
  Future<int> saveNoDoItem(NoDoItem noDoItem) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableNoDoItem", noDoItem.toMap());
    return res;
  }

  Future<List> getAllNoDoItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableNoDoItem");

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableNoDoItem ORDER BY $columnItemname ASC"));
  }

  Future<NoDoItem> getNoDoItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableNoDoItem WHERE $columnId = $id");
    if (result.length == 0) {
      return null;
    }
    return new NoDoItem.fromMap(result.first);
  }

  Future<int> deleteNoDoItem(int noDoItemId) async {
    var dbClient = await db;
    return await dbClient.delete(tableNoDoItem, where: "$columnId = ?", whereArgs: [noDoItemId]);
  }

  Future<int> updateNoDoItem(NoDoItem noDoItem) async {
    var dbClient = await db;
    return await dbClient.update(tableNoDoItem, noDoItem.toMap(), where: "$columnId = ?", whereArgs: [NoDoItem.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
