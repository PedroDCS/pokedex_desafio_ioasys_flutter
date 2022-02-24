import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/pokemon_details/widgets/pokemon_details_container_widget.dart';

class PokemonDetailsBodyWidget extends StatelessWidget {
  const PokemonDetailsBodyWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: PokemonDetailsContainerWidget(pokemon: pokemon),
        )
      ],
    );
  }
}
