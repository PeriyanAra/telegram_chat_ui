import 'package:data/src/client/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';


class DataLayerBootstrapper extends ServiceLocator {
  static final instance = DataLayerBootstrapper._();

  DataLayerBootstrapper._();

  Future<void> initialize({VoidCallback? onUnauthorized}) async {
    final chopperStagingClient = Client.createStagingClient(get(), onUnauthorized);
  }
}
