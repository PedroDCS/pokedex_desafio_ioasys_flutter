import 'package:flutter/material.dart';
import '../../domain/models/pokemon_model.dart';
import '../../../../../commons/colors/colors.dart';
import '../../../../../commons/pokemon_formatter/pokemon_formater.dart';

class PokemonItemNameWidget extends StatelessWidget {
  const PokemonItemNameWidget({
    Key? key,
    required this.pokeData,
  }) : super(key: key);

  final PokemonModel pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26,
      decoration: BoxDecoration(
        color: CustomColors().pokeColor(pokeData.types![0]),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        PokemonFormatter().formatName(pokeData.name),
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
