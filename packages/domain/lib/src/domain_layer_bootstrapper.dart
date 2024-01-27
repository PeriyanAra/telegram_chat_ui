import 'package:domain/domain_layer.dart';
import 'package:shared/shared.dart';

class DomainLayerBootstrapper extends ServiceLocator {
  static final instance = DomainLayerBootstrapper._();

  DomainLayerBootstrapper._();

  Future<void> initialize() async {
    registerLazySingleton<ChatUseCase>(
      () => ChatUseCase(chatRepository: get()),
    );
  }
}
