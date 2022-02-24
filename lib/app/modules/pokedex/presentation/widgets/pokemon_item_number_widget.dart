import 'package:flutter/material.dart';
import '../../domain/models/pokemon_model.dart';
import '../../../../../commons/colors/colors.dart';
import '../../../../../commons/pokemon_formatter/pokemon_formater.dart';

class PokemonItemNumberWidget extends StatelessWidget {
  const PokemonItemNumberWidget({
    Key? key,
    required this.pokeData,
  }) : super(key: key);

  final PokemonModel pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: double.maxFinite,
      child: Text(
        '#${PokemonFormatter().formatNumber(pokeData.id)}',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 8,
          color: CustomColors().pokeColor(pokeData.types![0]),
        ),
      ),
    );
  }
}
