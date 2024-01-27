import 'package:domain/domain_layer.dart';

abstract class HomeDataSource {
  Future<Result<HomeData, Exception>> getHomeData();
}
