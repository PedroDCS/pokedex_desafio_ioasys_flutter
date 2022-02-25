import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../domain/entities/pokemon_entity.dart';
import '../../favorites/controller/favorites_controller.dart';
import 'pokemon_base_stats_widget.dart';

import 'pokemon_desc_widget.dart';
import 'pokemon_infos_widget.dart';
import 'pokemon_types_widget.dart';

class PokemonDetailsContainerWidget extends StatefulWidget {
  const PokemonDetailsContainerWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonEntity pokemon;

  @override
  State<PokemonDetailsContainerWidget> createState() =>
      _PokemonDetailsContainerWidgetState();
}

class _PokemonDetailsContainerWidgetState
    extends ModularState<PokemonDetailsContainerWidget, FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 34),
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () {
                setState(() {
                  controller.addRemovePokemonFavorite(
                    pokemonID: widget.pokemon.id,
                  );
                });
              },
              padding: const EdgeInsets.all(0),
              icon: const ImageIcon(
                AssetImage('assets/icons/heartIcon.png'),
                size: 30,
              )),
        ),
        PokemonTypesWidget(
          pokeLength: widget.pokemon.types.length,
          types: widget.pokemon.types,
        ),
        PokemonInfosWidget(
          pokeWeight: widget.pokemon.weight,
          pokeHeight: widget.pokemon.height,
          move1: widget.pokemon.moves[0].name,
          move2: widget.pokemon.moves[1].name,
        ),
        PokemonDescWidget(specie: widget.pokemon.specie),
        PokemonBaseStatsWidget(
          type: widget.pokemon.types[0],
          statusList: widget.pokemon.status,
        ),
      ],
    );
  }
}
