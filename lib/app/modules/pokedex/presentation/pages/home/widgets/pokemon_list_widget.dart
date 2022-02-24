import 'package:flutter/material.dart';

import '../../../../domain/models/pokemon_list_model.dart';
import '../../../widgets/pokemon_item_future_widget.dart';

class PokemonListWidget extends StatelessWidget {
  final PokemonListModel? listPokemon;

  const PokemonListWidget({Key? key, required this.listPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          var pokemon = listPokemon?.results![index];
          return PokemonItemFutureWidget(
            pokemon: pokemon!.name!,
            router: '/pokedex/',
          );
        });
  }
}
