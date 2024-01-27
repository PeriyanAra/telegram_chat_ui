import 'package:domain/src/index.dart';

class HomeUseCase {
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  Future<Result<HomeData, FailureResult>> getData() {
    return homeRepository.getHomeData();
  }
}
