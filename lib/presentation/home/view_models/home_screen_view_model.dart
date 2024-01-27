import 'package:domain/domain_layer.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/view_models/character_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_view_model.freezed.dart';

@freezed
class HomeScreenViewModel with _$HomeScreenViewModel {
  const factory HomeScreenViewModel({
    required List<CharacterViewModel> characters,
  }) = _HomeScreenViewModel;

  factory HomeScreenViewModel.fromEntity({
    required HomeData homeData,
  }) {
    return HomeScreenViewModel(
      characters:
          homeData.characters.map((e) => CharacterViewModel.fromEntity(character: e)).toList(),
    );
  }
}
