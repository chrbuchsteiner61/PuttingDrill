import 'package:sqflite/sqflite.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class PuttingResult {
  final int? id;
  final int drillNo;
  final int selectedDistance;
  final int numberOfEfforts;
  final double successRate;
  final String dateOfPractice;

  PuttingResult({
    this.id,
    required this.drillNo,
    required this.selectedDistance,
    required this.numberOfEfforts,
    required this.successRate,
    required this.dateOfPractice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'drillNo': drillNo,
      'criteria1': selectedDistance,
      'criteria2': numberOfEfforts,
      'successRate': successRate,
      'dateOfPractice': dateOfPractice,
    };
  }
}

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
    String path = join(await getDatabasesPath(), 'putting_diary.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE results(id INTEGER PRIMARY KEY AUTOINCREMENT, drillNo INTEGER, criteria1 INTEGER,criteria2 INTEGER, criteria3 INTEGER, success REAL, successRate REAL, dateOfPractice TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertResult(PuttingResult result) async {
    final db = await database;
    await db.insert('results', result.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PuttingResult>> getResults() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('results');
    return List.generate(maps.length, (i) {
      return PuttingResult(
        id: maps[i]['id'],
        drillNo: maps[i]['drillNo'],
        selectedDistance: maps[i]['criteria1'],
        numberOfEfforts: maps[i]['criteria2'],
        successRate: maps[i]['successRate'],
        dateOfPractice: maps[i]['dateOfPractice'],
      );
    });
  }

  Future<void> deleteDB() async {
    String path = join(await getDatabasesPath(), 'putting_diary.db');
    deleteDatabase(path);
  }
}
