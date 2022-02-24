import 'package:flutter/material.dart';

import '../../../widgets/pokemon_item_future_widget.dart';
import '../controller/favorites_controller.dart';

class FavoritesListWidget extends StatelessWidget {
  const FavoritesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritesController _controller = FavoritesController();
    return FutureBuilder(
        future: _controller.getFavoritesPokemonList(),
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
              itemCount: _controller.listPokemonID.length,
              itemBuilder: (_, index) {
                var pokemon = _controller.listPokemonID[index];
                return PokemonItemFutureWidget(
                  pokemon: pokemon.toString(),
                  router: 'favorites',
                );
              });
        });
  }
}
