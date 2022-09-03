import 'dart:async';

import 'package:hybrd_app/models/schedule_event.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EventDatabase {
  static final EventDatabase instance = EventDatabase._init();

  static Database? _database;

  EventDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await openDB("eventsdb.db");
      return _database!;
    }
  }

  Future<Database> openDB(String fileName) async {
    return await openDatabase(join(await getDatabasesPath(), fileName),
        version: 1, onCreate: createDB);
  }

  FutureOr<void> createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableEvents(
      _id INTEGER PRIMARY KEY AUTOINCREMENT,
      ticketId TEXT NOT NULL,
      eventName TEXT NOT NULL,
      buyerName TEXT NOT NULL,
      chosenDate TEXT NOT NULL,
      chosenTime TEXT NOT NULL,
      link TEXT NOT NULL,
      isOnline BOOLEAN NOT NULL,
      time TEXT NOT NULL
    ) 
    ''');
  }

  Future<void> insertEvent(ScheduledEvent event) async {
    final db = await instance.database;
    await db.insert(
        tableEvents,
        event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<ScheduledEvent> readEvent(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableEvents,
      columns: [
        '_id',
        'ticketId',
        'eventName',
        'buyerName',
        'chosenDate',
        'chosenTime',
        'link',
        'isOnline',
        'time'
      ],
      where: '_id = ?',
      whereArgs: [id],
    );
    if (maps.first.isNotEmpty) {
      return ScheduledEvent(
          id: ['_id'] as int,
          ticketId: ['ticketId'] as String,
          eventName: ['eventName'] as String,
          buyerName: ['buyerName'] as String,
          chosenDate: ['chosenDate'] as String,
          chosenTime: ['chosenTime'] as String,
          link: ['link'] as String,
          isOnline: ['isOnline'] as bool,
          time: ['time'] as DateTime);
    }else{
      throw Exception("ID: $id not found");
    }
  }


  Future<List<ScheduledEvent>> listAllEvents() async {
    final db = await instance.database;

    final List<Map<String, Object?>> maps = await db.query(tableEvents);

    return List.generate(maps.length, (index) {
      return ScheduledEvent(
        id: maps[index]['_id'] as int,
        ticketId: maps[index]['ticketId'] as String,
        eventName: maps[index]['eventName'] as String,
        buyerName: maps[index]['buyerName'] as String,
        chosenDate: maps[index]['chosenDate'] as String,
        chosenTime: maps[index]['chosenTime'] as String,
        link: maps[index]['link'] as String,
        isOnline: maps[index]['isOnline'] as bool,
        time: maps[index]['time'] as DateTime,
      );
    });
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

