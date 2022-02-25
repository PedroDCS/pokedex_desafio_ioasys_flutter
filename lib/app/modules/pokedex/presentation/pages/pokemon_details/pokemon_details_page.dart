import 'package:flutter/material.dart';
import '../../../domain/entities/pokemon_entity.dart';
import 'widgets/pokemon_details_body_widget.dart';

import '../../../domain/usecases/pokemon_colors.dart';
import 'widgets/pokemon_app_bar.dart';
import 'widgets/pokemon_sprite_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonEntity pokemon;
  final String router;

  const PokemonDetailsPage({
    Key? key,
    required this.pokemon,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = CustomColors();
    return Scaffold(
      appBar: PokemonAppBar(
        id: pokemon.id.toString(),
        name: pokemon.name,
        router: router,
      ),
      backgroundColor: _color.pokeColor(pokemon.types[0]),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Stack(
          children: <Widget>[
            PokemonDetailsBodyWidget(pokemon: pokemon),
            PokemonSpriteWidget(sprite: pokemon.sprite),
          ],
        ),
      ),
    );
  }
}
