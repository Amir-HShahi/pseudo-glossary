import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static late Database _db;
  static const String _databaseName = 'glossary_database.db';

  static FutureOr<void> _onCreateHandler(Database db, int version) {
    return db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
    );
  }

  static Future<Database> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: _onCreateHandler, version: 1);
    return _db;
  }
}
