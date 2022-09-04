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
      orderId TEXT NOT NULL,
      ticketId TEXT NOT NULL,
      eventName TEXT NOT NULL,
      buyerName TEXT NOT NULL,
      chosenDate TEXT NOT NULL,
      chosenTime TEXT NOT NULL,
      link TEXT NOT NULL,
      idImg INTEGER NOT NULL,
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
        'orderId',
        'ticketId',
        'eventName',
        'buyerName',
        'chosenDate',
        'chosenTime',
        'link',
        'idImg',
        'isOnline',
        'time'
      ],
      where: '_id = ?',
      whereArgs: [id],
    );
    if (maps.first.isNotEmpty) {
      return ScheduledEvent(
          id: maps.first['_id'] as int,
          orderId: maps.first['orderId'] as String,
          ticketId: maps.first['ticketId'] as String,
          eventName: maps.first['eventName'] as String,
          buyerName: maps.first['buyerName'] as String,
          chosenDate: maps.first['chosenDate'] as String,
          chosenTime: maps.first['chosenTime'] as String,
          link: maps.first['link'] as String,
          idImg: maps.first['idImg'] as int,
          price: '',
          isOnline: maps.first['isOnline'] == 1,
          time: DateTime.parse(maps.first['time'] as String),
      );
    }else{
      throw Exception("ID: $id not found");
    }
  }


  Future<List<ScheduledEvent>> listAllEvents() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableEvents);

    final result = List.generate(maps.length, (index) {
      return ScheduledEvent(
        id: maps[index]['_id'],
        orderId: maps[index]['orderId'],
        ticketId: maps[index]['ticketId'],
        eventName: maps[index]['eventName'],
        buyerName: maps[index]['buyerName'],
        chosenDate: maps[index]['chosenDate'],
        chosenTime: maps[index]['chosenTime'],
        link: maps[index]['link'],
        idImg: maps[index]['idImg'],
        price: '',
        isOnline: maps[index]['isOnline'] == 1,
        time: DateTime.parse(maps[index]['time'] as String),
      );
    });
    // print(result);
    return result;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

