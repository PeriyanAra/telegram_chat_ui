import 'package:data/data_layer.dart';
import 'package:data/src/client/index.dart';
import 'package:domain/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'home/data_source/index.dart';
import 'home/service/index.dart';

class DataLayerBootstrapper extends ServiceLocator {
  static final instance = DataLayerBootstrapper._();

  DataLayerBootstrapper._();

  Future<void> initialize({VoidCallback? onUnauthorized}) async {
    final chopperStagingClient = Client.createStagingClient(get(), onUnauthorized);

    // Services
    registerLazySingleton<HomeApiService>(
      () => HomeApiService.create(client: chopperStagingClient),
    );

    // Data sources
    registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSource(
        homeApiService: get(),
      ),
    );

    // Repository implementations
    registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        homeRemoteDataSource: get(),
      ),
    );
  }
}
