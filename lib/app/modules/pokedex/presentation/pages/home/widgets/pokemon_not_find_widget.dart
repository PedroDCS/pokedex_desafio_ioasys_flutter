import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class PokemonNotFindWidget extends StatelessWidget {
  const PokemonNotFindWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Ops",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 138,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'pokemonNotFound'.i18n(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
