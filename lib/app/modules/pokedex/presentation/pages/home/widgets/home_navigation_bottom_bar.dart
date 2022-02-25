import 'package:flutter/material.dart';
import '../../../../domain/entities/pokemon_list_entity.dart';

class HomeNavigationBottomBar extends StatelessWidget {
  const HomeNavigationBottomBar({
    Key? key,
    required this.nextPage,
    required this.listPokemon,
  }) : super(key: key);

  final Function nextPage;
  final PokemonListEntity? listPokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
