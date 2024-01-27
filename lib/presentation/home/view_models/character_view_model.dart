import 'package:domain/domain_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_view_model.freezed.dart';

@freezed
class CharacterViewModel with _$CharacterViewModel {
  const factory CharacterViewModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String gender,
    required String image,
  }) = _CharacterViewModel;

  factory CharacterViewModel.fromEntity({
    required Character character,
  }) {
    return CharacterViewModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      gender: character.gender,
      image: character.image,
    );
  }
}
