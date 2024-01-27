import 'package:domain/src/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data.freezed.dart';

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required List<Character> characters,
  }) = _HomeData;
}
