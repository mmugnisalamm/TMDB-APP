import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tmdb_app/data/models/user_model.dart';
import 'package:tmdb_app/data/models/watchlist_model.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE watchlist (
            id INTEGER PRIMARY KEY NOT NULL,
            poster_path TEXT NOT NULL,
            backdrop_path TEXT NOT NULL,
            overview TEXT NOT NULL,
            name TEXT NOT NULL,
            vote_average REAL NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE lastwatch (
            id INTEGER PRIMARY KEY NOT NULL,
            poster_path TEXT NOT NULL,
            backdrop_path TEXT NOT NULL,
            overview TEXT NOT NULL,
            name TEXT NOT NULL,
            vote_average REAL NOT NULL
          )
        ''');
      },
    );
  }

  // ✅ User section
  Future<void> insertDummyUser() async {
    final db = await database;
    final result = await db.query('users');
    if (result.isEmpty) {
      await db.insert('users', {
        'name': 'John Doe',
        'email': 'john@example.com',
        'password': '123456',
      });
    }
  }

  Future<UserModel?> login(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  // ✅ Watchlist section
  Future<int> addWatchlist(WatchlistModel item) async {
    final db = await database;
    return await db.insert('watchlist', item.toMap());
  }

  Future<List<WatchlistModel>> getWatchlist() async {
    final db = await database;
    final result = await db.query('watchlist');
    return result.map((e) => WatchlistModel.fromMap(e)).toList();
  }

  Future<int> deleteWatchlist(int id) async {
    final db = await database;
    return await db.delete('watchlist', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isInWatchlist(String name) async {
    final db = await database;
    final result = await db.query(
      'watchlist',
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }

  Future<void> deleteDB() async {
    await deleteDatabase(join(await getDatabasesPath(), 'app_database.db'));
  }

  Future<int> addLastWatch(WatchlistModel item) async {
    final db = await database;
    return await db.insert('lastwatch', item.toMap());
  }

  Future<List<WatchlistModel>> getLastWatch() async {
    final db = await database;
    final result = await db.query('lastwatch');
    return result.map((e) => WatchlistModel.fromMap(e)).toList();
  }

  Future<bool> isLastWatchExist(String name) async {
    final db = await database;
    final result = await db.query(
      'lastwatch',
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }
}
