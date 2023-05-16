import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/category.dart';
import '../model/transaction.dart';
import '../model/user.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() => instance;

  static Database? _db;
  static const String _dbName = 'money-wallet.db';
  static const int _dbVersion = 1;
  static const String _transactionTable = 'transactions';
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
      amount REAL,
      isIncome INT,
      categoryId INT,
      created_at TEXT,
      update_at TEXT
    )
''');
    db.execute(''' 
      CREATE TABLE $_userTable(
      id TEXT PRIMARY KEY,
      name TEXT
    )
''');
    db.execute(''' 
      CREATE TABLE $_categoryTable(
      id TEXT PRIMARY KEY,
      name TEXT,
      type TEXT,
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

  Future<User> getUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_userTable);
    return User.fromMap(maps.first);
  }

  Future<int> insertTransactions(Transactions transactions) async {
    Database db = await instance.database;
    return await db.insert(_transactionTable, transactions.toMap());
  }

  Future<int> updateTransactions(Transactions transactions) async {
    Database db = await instance.database;
    return await db.update(_transactionTable, transactions.toMap(), where: 'id = ?', whereArgs: [transactions.id]);
  }

  Future<List<Transactions>> getTransactions() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_transactionTable);
    return List.generate(maps.length, (index) => Transactions.fromMap(maps[index]));
  }

  Future<int> deleteTransactions(Transactions transactions) async {
    Database db = await instance.database;
    return await db.delete(_transactionTable, where: 'id = ?', whereArgs: [transactions.id]);
  }

  Future<int> insertCategory(Category category) async {
    Database db = await instance.database;
    return await db.insert(_categoryTable, category.toMap());
  }

  Future<int> updateCategory(Category category) async {
    Database db = await instance.database;
    return await db.update(_categoryTable, category.toMap(), where: 'id = ?', whereArgs: [category.id]);
  }

  Future<List<Category>> getCategory() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_categoryTable);
    return List.generate(maps.length, (index) => Category.fromMap(maps[index]));
  }

  Future<int> deleteCategory(Category category) async {
    Database db = await instance.database;
    return await db.delete(_categoryTable, where: 'id = ?', whereArgs: [category.id]);
  }
}
