import 'package:domain/src/index.dart';
import 'package:shared/shared.dart';

class DomainLayerBootstrapper extends ServiceLocator {
  static final instance = DomainLayerBootstrapper._();

  DomainLayerBootstrapper._();

  Future<void> initialize() async {
    registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(homeRepository: get()),
    );
  }
}
