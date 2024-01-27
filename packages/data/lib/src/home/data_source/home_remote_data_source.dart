import 'package:data/src/client/index.dart';
import 'package:data/src/home/data_source/home_data_source.dart';
import 'package:data/src/home/dto/home_data_dto.dart';
import 'package:data/src/home/service/index.dart';
import 'package:domain/domain_layer.dart';

class HomeRemoteDataSource extends HomeDataSource {
  final HomeApiService homeApiService;

  HomeRemoteDataSource({required this.homeApiService});

  @override
  Future<Result<HomeData, FailureResult>> getHomeData() {
    return ApiRequestManager.guardApiCall<HomeData, HomeDataDto>(
      invoker: homeApiService.getHomeData,
      mapper: (dto) => dto.toEntity(),
    );
  }
}
