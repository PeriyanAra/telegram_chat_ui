import 'dart:developer';

import 'package:data/data_layer.dart';
import 'package:domain/domain_layer.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared/shared.dart';

final get = ServiceLocator.getIt;

class AppBootstrapper extends ServiceLocator {
  final _isInitialized = BehaviorSubject.seeded(false);
  static final instance = AppBootstrapper._();

  Stream<bool> get isInitializedStream => _isInitialized.asBroadcastStream();

  AppBootstrapper._();

  Future<void> initialize() async {
    try {
      ServiceLocator.initialize();

      await SharedBootstrapper.instance.initialize();
      await DomainLayerBootstrapper.instance.initialize();
      await DataLayerBootstrapper.instance.initialize();

     
      _isInitialized.value = true;
    } on Object catch (e) {
      log('AppBootstrapper error: ${e.toString()}');
    }
  }
}
