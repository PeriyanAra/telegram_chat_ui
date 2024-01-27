import 'package:chopper/chopper.dart';
import 'package:data/src/client/custom_serialize.dart';
import 'package:data/src/client/interceptors/chopper_logging_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class Client {
  static ChopperClient createStagingClient(
    Logger logger,
    VoidCallback? onUnauthorized,
  ) {
    final interceptors = [
      ChopperLoggingInterceptor(logger),
    ];

    return ChopperClient(
      baseUrl: 'https://rickandmortyapi.com/api',
      converter: JsonSerializableConverter.instance,
      interceptors: interceptors,
    );
  }
}
