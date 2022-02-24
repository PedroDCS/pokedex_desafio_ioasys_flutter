import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/controller/favorites_controller.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pokemon_item_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/error_generic_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pikachu_running_widget.dart';

class FavoritesListWidget extends StatelessWidget {
  const FavoritesListWidget({
    Key? key,
    required FavoritesController controller,
  })  : _controller = controller,
        super(key: key);

  final FavoritesController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.getData(),
        builder: (context, snapshot) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 112,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemCount: _controller.listPokemonIndex.length,
              itemBuilder: (_, index) {
                var pokemon = _controller.listPokemonIndex[index];
                return FutureBuilder<PokemonModel>(
                    future: _controller.getPokemon(pokemon: pokemon),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child:
                                PikachuRunningWidget(height: 150, width: 182.5),
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
                              router: 'favorites',
                            );
                          } else {
                            return const ErrorGenericWidget();
                          }
                      }
                    });
              });
        });
  }
}
