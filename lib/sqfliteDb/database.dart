import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const dbName = "student_contact.db";
  static const dbVersion = 1;
  static const dbTable = "students";
  static const dbStudentName = "studentName";
  static const dbStudentUsn = "studentUsn";
  static const dbStudentNumber = "studentNumber";
  static const dbFatherName = "fatherName";
  static const dbFatherNumber = "fatherNumber";
  static const dbEmailAddress = "emailAddress";
  static const dbBranch = "branch";
  static const dbSem = "sem";
  static final DatabaseHelper instance = DatabaseHelper();
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    try {
      db.execute('''
      CREATE TABLE  $dbTable (
      $dbStudentName VARCHAR(50),
      $dbStudentUsn VARCHAR(10) PRIMARY KEY,
      $dbStudentNumber TEXT,
      $dbFatherName VARCHAR(50),
      $dbFatherNumber TEXT,
      $dbBranch VARCHAR(10),
      $dbEmailAddress TEXT,
      $dbSem TEXT
      )
      ''');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  insertRecord(Map<String, dynamic> row) async {
    try {
      Database? db = await instance.database;
      return await db!.insert(dbTable, row);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> queryRecord() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  Future<int> deleteRecord(String id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$dbStudentUsn=?', whereArgs: [id]);
  }

  Future<int> updateRecord(String id,Map<String,dynamic> row) async {
    Database? db = await instance.database;
    return await db!.update(dbTable, row,where: '$dbStudentUsn=?',whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryStudentRecord(String id) async {
    Database? db = await instance.database;
    return await db!.query(dbTable,where:'$dbStudentUsn=?',whereArgs: [id]);
  }


}
