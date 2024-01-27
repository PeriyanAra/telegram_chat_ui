import 'package:domain/src/index.dart';

abstract class HomeRepository {
  Future<Result<HomeData, FailureResult>> getHomeData();
}
