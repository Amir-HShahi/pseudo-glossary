import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sudo_random/model/term_model.dart';
import 'package:sudo_random/services/words_info.dart';

class DatabaseHandler {
  static int recordsCount = 0;
  static late Database _db;
  static const String _databaseName = 'glossary_database.db';

  static FutureOr<void> _onCreateHandler(Database db, int version) {
    return db.execute(
      'CREATE TABLE terms(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
    );
  }

  static Future<Database> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: _onCreateHandler, version: 1);
    return _db;
  }

  static Future<void> insertAllTermsToDatabase() async {
    Iterable<String> keys = WordsInfo.terms.keys;
    int id = 0;
    for (String key in keys) {
      await _db.insert(
        'terms',
        {'id': id, 'title': key, 'description': WordsInfo.terms[key]},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      id++;
    }
    recordsCount = id;
  }

  static Future<TermModel> retrieveTermModel(int id) async {
    final List<Map<String, dynamic>> termMap =
        await _db.query('terms', where: 'id = ?', whereArgs: [id]);

    if (termMap.isNotEmpty) {
      Map<String, dynamic> term = termMap.elementAt(0);
      return TermModel(title: term['title'], description: term['description']);
    }
    return TermModel(title: 'title', description: 'gg');
  }
}
