import 'dart:io';

import 'package:data/src/database/initial_scripts.dart';
import 'package:data/src/database/migrations_scripts.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';


abstract class DatabaseCreator {
  static Future<Database> initDatabase() async {
    final whmDbPath = await getDatabasePath(dbName: 'whm_db');

    final database = await openDatabase(
      '$whmDbPath/db.db',
      version: migrationsScripts().length + 1,
      onCreate: (db, version) async {
        await executeInitialization(db, version);
      },
    );

    return database;
  }

  static Future<String> getDatabasePath({required String dbName}) async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$dbName';
    final dbExists = Directory(path).existsSync();

    if (!dbExists) {
      await Directory(path).create(recursive: true);
    }

    return path;
  }

  static Future<void> executeInitialization(Database db, int version) async {
    initialScripts().forEach((script) async {
      await db.execute(script);
    });

    migrationsScripts().forEach(
      (script) async {
        try {
          await db.execute(script);
        } catch (e) {
          debugPrint(e.toString());
        }
      },
    );
  }
}
