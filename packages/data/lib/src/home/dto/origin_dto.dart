import 'package:freezed_annotation/freezed_annotation.dart';

part 'origin_dto.freezed.dart';
part 'origin_dto.g.dart';

@freezed
class OriginDto with _$OriginDto {
  const factory OriginDto({
    required String name,
    required String url,
  }) = _OriginDto;

  factory OriginDto.fromJson(Map<String, Object?> json) => _$OriginDtoFromJson(json);
}
