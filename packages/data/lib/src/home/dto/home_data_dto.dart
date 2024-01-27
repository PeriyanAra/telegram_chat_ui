import 'package:data/src/home/dto/character_dto.dart';
import 'package:data/src/home/dto/info_dto.dart';
import 'package:domain/domain_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data_dto.freezed.dart';
part 'home_data_dto.g.dart';

@freezed
class HomeDataDto with _$HomeDataDto {
  const factory HomeDataDto({
    required InfoDto info,
    required List<CharacterDto> results,
  }) = _HomeDataDto;

  const HomeDataDto._();

  factory HomeDataDto.fromJson(Map<String, Object?> json) => _$HomeDataDtoFromJson(json);

  HomeData toEntity() => HomeData(
        characters: results.map((e) => e.toEntity()).toList(),
      );
}
