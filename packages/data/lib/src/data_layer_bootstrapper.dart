import 'package:data/data_layer.dart';
import 'package:data/src/chat/data_source/index.dart';
import 'package:data/src/database/database_creator.dart';
import 'package:domain/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:sqflite/sqflite.dart';


class DataLayerBootstrapper extends ServiceLocator {
  static final instance = DataLayerBootstrapper._();

  DataLayerBootstrapper._();

  Future<void> initialize({VoidCallback? onUnauthorized}) async {
    registerSingleton<Database>(
      await DatabaseCreator.initDatabase(),
    );

    // Data sources
    registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSource(
        database: get(),
      ),
    );

    // Repository implementations
    registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        chatLocalDataSource: get(),
      ),
    );
  }
}
