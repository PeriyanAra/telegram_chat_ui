import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/home/view_models/character_view_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterViewModel character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(character.image),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NAME: ${character.name}',
              ),
              Text(
                'STATUS: ${character.status}',
              ),
              Text(
                'SPECIES: ${character.species}',
              ),
              Text(
                'GENDER: ${character.gender}',
              ),
            ],
          )
        ],
      ),
    );
  }
}
