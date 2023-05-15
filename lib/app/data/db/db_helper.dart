import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() => instance;

  static Database? _db;
  static const String _dbName = 'money-wallet.db';
  static const int _dbVersion = 1;
  static const String _transactionTable = 'transaction';
  static const String _userTable = 'user';
  static const String _categoryTable = 'category';

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute(''' 
      CREATE TABLE $_transactionTable(
      id TEXT PRIMARY KEY,
      amount INTEGER,
      isIncome TEXT,
      categoryId INT,
      created_at TEXT,
      update_at TEXT
    )
''');
    db.execute(''' 
      CREATE TABLE $_userTable(
      id TEXT PRIMARY KEY,
      name TEXT,
      created_at TEXT,
      update_at TEXT
    )
''');
    db.execute(''' 
      CREATE TABLE $_categoryTable(
      id TEXT PRIMARY KEY,
      name TEXT,
      created_at TEXT,
      update_at TEXT
    )
''');
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert(_userTable, user.toMap());
  }

  Future<int> updateUser(User user) async {
    Database db = await instance.database;
    return await db.update(_userTable, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<User?> getUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_userTable);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
