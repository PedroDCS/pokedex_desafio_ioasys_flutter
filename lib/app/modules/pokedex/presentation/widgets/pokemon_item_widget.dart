import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../commons/colors/colors.dart';
import '../../../../../commons/pokemon_formatter/pokemon_formater.dart';
import '../../domain/models/pokemon_model.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonModel pokeData;
  final String router;

  const PokemonItemWidget({
    Key? key,
    required this.pokeData,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (router == 'favorites') {
            Modular.to.pushReplacementNamed(
              'pokemon',
              arguments: [pokeData, router],
            );
          } else {
            Modular.to.pushNamed(
              'pokemon',
              arguments: [pokeData, router],
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors().pokeColor(
                pokeData.types![0],
              ),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
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
              ),
              Image.network(
                pokeData.sprite,
                width: 71,
                height: 72,
              ),
              Container(
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
              ),
            ],
          ),
        ));
  }
}
