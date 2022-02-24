import 'package:flutter/material.dart';

import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_list_item_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/controllers/pokemon_item_controller.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/error_generic_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pikachu_running_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pokemon_item_widget.dart';

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
