import 'package:shared/src/index.dart';

class SharedBootstrapper extends ServiceLocator {
  static final instance = SharedBootstrapper._();

  SharedBootstrapper._();

  Future<void> initialize() async {
    await allReady();
  }
}
