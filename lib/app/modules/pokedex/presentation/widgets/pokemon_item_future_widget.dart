import 'package:flutter/material.dart';

import '../../domain/models/pokemon_model.dart';
import '../controllers/pokemon_item_controller.dart';
import 'error_generic_widget.dart';
import '../../../../../commons/pikachu_running_widget.dart';
import 'pokemon_item_widget.dart';

class PokemonItemFutureWidget extends StatelessWidget {
  const PokemonItemFutureWidget({
    Key? key,
    required this.pokemon,
    required this.router,
  }) : super(key: key);

  final String pokemon;
  final String router;

  @override
  Widget build(BuildContext context) {
    final _controller = PokemonItemController();

    return FutureBuilder<PokemonModel>(
        future: _controller.getPokemon(pokemon: pokemon),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: PikachuRunningWidget(height: 150, width: 182.5),
              );
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            case ConnectionState.none:
              return const LinearProgressIndicator(
                value: 1,
                color: Colors.red,
              );
            default:
              if (snapshot.hasData) {
                return PokemonItemWidget(
                  pokeData: snapshot.data!,
                  router: router,
                );
              } else {
                return const ErrorGenericWidget();
              }
          }
        });
  }
}
