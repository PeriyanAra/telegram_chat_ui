import 'package:data/src/home/dto/origin_dto.dart';
import 'package:domain/domain_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String gender,
    required String image,
    required String type,
    required OriginDto origin,
    required OriginDto location,
    required String url,
    required String created,
    required List<String> episode,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, Object?> json) => _$CharacterDtoFromJson(json);

  const CharacterDto._();

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
    );
  }
}
