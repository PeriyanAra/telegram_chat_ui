import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/view_models/home_screen_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/widgets/character_card.dart';

class HomeLoadedContent extends StatelessWidget {
  final HomeScreenViewModel homeScreenViewModel;

  const HomeLoadedContent({
    Key? key,
    required this.homeScreenViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: homeScreenViewModel.characters.length,
      itemBuilder: (BuildContext context, int index) {
        return CharacterCard(
          character: homeScreenViewModel.characters[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
