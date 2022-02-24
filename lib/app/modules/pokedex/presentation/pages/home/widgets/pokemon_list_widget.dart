import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pokemon_item_future_widget.dart';

import '../../../../domain/models/pokemon_list_model.dart';
import '../../../../domain/models/pokemon_model.dart';
import '../../../widgets/error_generic_widget.dart';
import '../../../widgets/pikachu_running_widget.dart';
import '../controllers/pokemon_item_controller.dart';
import '../../../widgets/pokemon_item_widget.dart';

class PokemonListWidget extends StatelessWidget {
  final PokemonListModel? listPokemon;

  const PokemonListWidget({Key? key, required this.listPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PokemonItemController();

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
