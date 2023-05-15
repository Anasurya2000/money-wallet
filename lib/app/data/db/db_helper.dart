import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() => instance;

  static Database? _db;
  static const String _dbuser = 'moneywallet.db';
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
    String path = join(await getDatabasesPath(), _dbuser);
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
}
