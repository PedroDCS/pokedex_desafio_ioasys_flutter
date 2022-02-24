import 'package:flutter/material.dart';

import '../../../../domain/models/pokemon_model.dart';
import '../controllers/pokemon_item_controller.dart';
import 'pokemon_item_widget.dart';
import '../../../widgets/error_generic_widget.dart';
import '../../../widgets/pikachu_running_widget.dart';

import '../../../../domain/models/pokemon_list_model.dart';

class PokemonListWidget extends StatelessWidget {
  final PokemonListModel? listPokemon;
  final Function nextPage;

  const PokemonListWidget(
      {Key? key, required this.listPokemon, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PokemonItemController();

    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 112,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemCount: listPokemon!.results!.length,
            itemBuilder: (_, index) {
              var pokemon = listPokemon!.results![index];
              return FutureBuilder<PokemonModel>(
                  future: _controller.getPokemon(pokemon: pokemon.name!),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child:
                              PikachuRunningWidget(height: 150, width: 182.5),
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
                            router: '/pokedex/',
                          );
                        } else {
                          return const ErrorGenericWidget();
                        }
                    }
                  });
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 60,
              onPressed: () {
                nextPage(listPokemon!.previous);
              },
              icon: const Icon(
                Icons.navigate_before,
                size: 60,
              ),
            ),
            IconButton(
              iconSize: 60,
              onPressed: () {
                nextPage(listPokemon!.next);
              },
              icon: const Icon(
                Icons.navigate_next,
                size: 60,
              ),
            ),
          ],
        )
      ],
    );
  }
}
