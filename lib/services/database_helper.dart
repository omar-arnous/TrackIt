import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trackit/utils/constants/db_constants.dart';

class DatabaseHelper {
  // DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, DATABASENAME);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $ACCOUNTSTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        accountType TEXT NOT NULL
      )
      ''');
    await db.execute('''
      CREATE TABLE $TRANSACTIONSTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        NOTE TEXT NOT NULL,
        transactionType TEXT NOT NULL,
        categoryId INTEGER,
        accountId INTEGER,
        amount INTEGER NOT NULL,
        
        FOREIGN KEY (categoryId) REFERENCES $CATEGORIESTABLENAME (id),
        FOREIGN KEY (accountId) REFERENCES $ACCOUNTSTABLENAME (id)
      )
      ''');
    await db.execute('''
      CREATE TABLE $CATEGORIESTABLENAME (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        icon TEXT NOT NULL,
        color TEXT NOT NULL
      )
    ''');
  }
}
