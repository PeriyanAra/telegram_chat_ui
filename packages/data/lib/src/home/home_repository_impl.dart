import 'package:data/src/home/data_source/index.dart';
import 'package:domain/domain_layer.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Result<HomeData, FailureResult>> getHomeData() {
    return homeRemoteDataSource.getHomeData();
  }
}
