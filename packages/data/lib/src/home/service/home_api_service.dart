import 'package:chopper/chopper.dart';
import 'package:data/src/home/dto/home_data_dto.dart';

part 'home_api_service.chopper.dart';

@ChopperApi()
abstract class HomeApiService extends ChopperService {
  static HomeApiService create({ChopperClient? client}) {
    return _$HomeApiService(client);
  }

  @Get(path: 'character')
  Future<Response<HomeDataDto>> getHomeData();
}
