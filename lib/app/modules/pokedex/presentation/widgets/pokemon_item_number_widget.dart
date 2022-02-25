import 'package:flutter/material.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/usecases/pokemon_colors.dart';
import '../../domain/usecases/pokemon_formater.dart';

class PokemonItemNumberWidget extends StatelessWidget {
  const PokemonItemNumberWidget({
    Key? key,
    required this.pokeData,
  }) : super(key: key);

  final PokemonEntity pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: double.maxFinite,
      child: Text(
        '#${PokemonFormatter().formatNumber(pokeData.id.toString())}',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 8,
          color: CustomColors().pokeColor(pokeData.types[0]),
        ),
      ),
    );
  }
}
