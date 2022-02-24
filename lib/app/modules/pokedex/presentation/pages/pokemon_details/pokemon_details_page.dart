import 'package:flutter/material.dart';

import '../../../../../../commons/colors/colors.dart';
import '../../../domain/models/pokemon_model.dart';
import 'widgets/pokemon_app_bar.dart';
import 'widgets/pokemon_details_body_widget.dart';
import 'widgets/pokemon_sprite_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = CustomColors();
    return Scaffold(
      appBar: PokemonAppBar(id: pokemon.id, name: pokemon.name),
      backgroundColor: _color.pokeColor(pokemon.types![0]),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/Pokeball.png",
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 7),
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: PokemonDetailsBodyWidget(pokemon: pokemon),
                )
              ],
            ),
            PokemonSpriteWidget(sprite: pokemon.sprite),
          ],
        ),
      ),
    );
  }
}
