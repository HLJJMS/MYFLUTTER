import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDatabaseHalper {
  static final SqfliteDatabaseHalper _instance =
      new SqfliteDatabaseHalper.internal();

  factory SqfliteDatabaseHalper() => _instance;

  final String tableNote = 'note11Table';
  final String columnId = 'id';
  final String pointid = 'pointid';
  final String image = 'image';
  final String contractId = 'contractId';
  final String publicationId = 'publicationId';
  final String pointLat = 'pointLat';
  final String pointLng = 'pointLng';

  static Database _db;

  SqfliteDatabaseHalper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');
    print(databasesPath);

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableNote($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $pointid INTEGER, $image TEXT, $contractId INTEGER, $publicationId INTEGER, $pointLng INTEGER, $pointLat INTEGER)');
  }

  Future<int> saveNote(Note note) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableNote, note.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllNotes() async {
    var dbClient = await db;
    var result = await dbClient.query(tableNote, columns: [
      columnId,
      pointid,
      image,
      contractId,
      publicationId,
      pointLng,
      pointLat
    ]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
  }

  Future<Note> getNoteWithImage(String sImage) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          columnId,
          pointid,
          image,
          contractId,
          publicationId,
          pointLng,
          pointLat
        ],
        where: '$image = ?',
        whereArgs: [sImage]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Note.fromMap(result.first);
    }

    return null;
  }

  Future<Note> getNote(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableNote,
        columns: [
          columnId,
          pointid,
          image,
          contractId,
          publicationId,
          pointLng,
          pointLat
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Note.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteNoteWithImage(String newImage) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableNote, where: '$image = ?', whereArgs: ['$newImage']);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateNote(Note note) async {
    var dbClient = await db;
    return await dbClient.update(tableNote, note.toMap(),
        where: "$columnId = ?", whereArgs: [note.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}

class Note {
  int id;
  int pointid;
  String image;
  int contractId;
  int publicationId;
  double pointLng;
  double pointLat;

  Note(this.pointid, this.image, this.contractId, this.publicationId,
      this.pointLng, this.pointLat);

  Note.map(dynamic obj) {
    this.id = obj['id'];
    this.pointid = obj['pointid'];
    this.image = obj['image'];
    this.contractId = obj['contractId'];
    this.publicationId = obj['publicationId'];
    this.pointLng = obj['pointLng'];
    this.pointLat = obj['pointLat'];
  }

  // int get id => _id;
  // int get pointid => _pointid;
  // String get image => _image;
  // int get contractId => _contractId;
  // int get publicationId => _publicationId;
  // double get pointLng => _pointLng;
  // double get pointLat => _pointLat;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['pointid'] = pointid;
    map['image'] = image;
    map['contractId'] = contractId;
    map['publicationId'] = publicationId;
    map['pointLng'] = pointLng;
    map['pointLat'] = pointLat;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.pointid = map['pointid'];
    this.image = map['image'];
    this.contractId = map['contractId'];
    this.pointLng = map['pointLng'];
    this.pointLat = map['pointLat'];
  }
}
