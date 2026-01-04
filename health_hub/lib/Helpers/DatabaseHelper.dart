import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'expression_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE records (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            faceImagePath TEXT,
            content TEXT,
            loginTime TEXT,
            logoutTime TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertRecord({
    required String faceImagePath,
    required String content,
    required String loginTime,
    required String logoutTime,
    required String emotion,
  }) async {
    final db = await database;
    await db.insert('records', {
      'faceImagePath': faceImagePath,
      'content': content,
      'loginTime': loginTime,
      'logoutTime': logoutTime,
    });
  }

  Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await database;
    return await db.query('records');
  }
}
