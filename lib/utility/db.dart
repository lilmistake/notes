import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

int documentCount = 0;

class DatabaseHelper {
  static Database? db;
  static Future<Database> getDb() async {
    if (db != null) {
      return db!;
    }
    db = await initDb();
    return db!;
  }
}

Future<Database> initDb() async {
  final database =
      openDatabase(join(await getDatabasesPath(), 'notes.db'), onOpen: (db) {
    db.execute('CREATE TABLE IF NOT EXISTS pref(theme INTEGER)');
    return db.execute(
        'CREATE TABLE IF NOT EXISTS notes(title TEXT, description TEXT, ts INTEGER)');
  });
  final db = await database;
  return db;
}

Future addNote({note}) async {
  Database db = await DatabaseHelper.getDb();
  db.insert('notes', note);
}

Future editNote({note, ref}) async {
  Database db = await DatabaseHelper.getDb();
  db.update('notes', note, where: 'ts = ${note['ts'].toString()}');  
}

Future deleteNote({ts}) async {
  Database db = await DatabaseHelper.getDb();
  db.delete('notes', where: 'ts = ${ts.toString()}');
}

Future getAllNotes() async {
  Database db = await DatabaseHelper.getDb();
  var res = await db.query('notes', orderBy: 'ts ASC');
  return res;
}

Future editTheme(newTheme) async {
  Database db = await DatabaseHelper.getDb();
  var res = await db.query('pref');
  if (res.isEmpty) {
    db.insert('pref', {'theme': newTheme});
  } else {
    db.update('pref', {'theme': newTheme});
  }
}

Future getCurrentTheme() async {
  Database db = await DatabaseHelper.getDb();
  var res = await db.query('pref');
  if (res.isEmpty) return 0;
  return res[0]['theme'];
}
