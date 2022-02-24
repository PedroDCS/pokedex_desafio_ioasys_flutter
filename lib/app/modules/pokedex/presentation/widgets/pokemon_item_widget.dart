import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pikachu_running_widget.dart';
import 'pokemon_item_name_widget.dart';
import 'pokemon_item_number_widget.dart';

import '../../../../../commons/colors/colors.dart';
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
              PokemonItemNumberWidget(pokeData: pokeData),
              Image.network(
                pokeData.sprite,
                width: 71,
                height: 72,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: PikachuRunningWidget(height: 70, width: 71),
                  );
                },
              ),
              PokemonItemNameWidget(pokeData: pokeData),
            ],
          ),
        ));
  }
}
