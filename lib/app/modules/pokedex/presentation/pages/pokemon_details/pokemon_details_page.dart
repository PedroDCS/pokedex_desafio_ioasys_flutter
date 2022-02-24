import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/pokemon_details/widgets/pokemon_details_body_widget.dart';

import '../../../../../../commons/colors/colors.dart';
import '../../../domain/models/pokemon_model.dart';
import 'widgets/pokemon_app_bar.dart';
import 'widgets/pokemon_details_container_widget.dart';
import 'widgets/pokemon_sprite_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;
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
        id: pokemon.id,
        name: pokemon.name,
        router: router,
      ),
      backgroundColor: _color.pokeColor(pokemon.types![0]),
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
