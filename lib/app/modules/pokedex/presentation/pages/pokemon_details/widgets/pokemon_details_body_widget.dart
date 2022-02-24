import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/controller/favorites_controller.dart';
import '../../../../domain/models/pokemon_model.dart';
import 'pokemon_base_stats_widget.dart';

import 'pokemon_desc_widget.dart';
import 'pokemon_infos_widget.dart';
import 'pokemon_types_widget.dart';

class PokemonDetailsBodyWidget extends StatefulWidget {
  const PokemonDetailsBodyWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  State<PokemonDetailsBodyWidget> createState() =>
      _PokemonDetailsBodyWidgetState();
}

class _PokemonDetailsBodyWidgetState extends State<PokemonDetailsBodyWidget> {
  @override
  Widget build(BuildContext context) {
    FavoritesController _favController = FavoritesController();
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
                  _favController.addRemovePokemonFavorite(
                    pokemonID: int.parse(widget.pokemon.id),
                  );
                });
              },
              padding: EdgeInsets.all(0),
              icon: const ImageIcon(
                AssetImage('assets/icons/heartIcon.png'),
                size: 30,
              )),
        ),
        PokemonTypesWidget(
          pokeLength: widget.pokemon.types!.length,
          types: widget.pokemon.types!,
        ),
        PokemonInfosWidget(
          pokeWeight: double.parse(widget.pokemon.weight),
          pokeHeight: double.parse(widget.pokemon.height),
          move1: widget.pokemon.moves![0].name,
          move2: widget.pokemon.moves![1].name,
        ),
        PokemonDescWidget(specie: widget.pokemon.specie),
        PokemonBaseStatsWidget(
          type: widget.pokemon.types![0],
          statusList: widget.pokemon.status!,
        ),
      ],
    );
  }
}
