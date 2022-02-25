import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import 'pokemon_info_widget.dart';

class PokemonInfosWidget extends StatelessWidget {
  final double pokeWeight;
  final double pokeHeight;
  final String move1;
  final String move2;

  const PokemonInfosWidget({
    Key? key,
    required this.pokeWeight,
    required this.pokeHeight,
    required this.move1,
    required this.move2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PokemonInfoWidget(
            icon: const AssetImage('assets/icons/balance.png'),
            infoType: 'weight'.i18n(),
            info: '${pokeWeight / 10} Kg',
            useIcon: true,
          ),
          PokemonInfoWidget(
            icon: const AssetImage('assets/icons/scale.png'),
            infoType: 'height'.i18n(),
            info: '${pokeHeight / 10} m',
            useIcon: true,
          ),
          PokemonInfoWidget(
            infoType: 'moves'.i18n(),
            info: '$move1 \n $move2',
            useIcon: false,
          ),
        ],
      ),
    );
  }
}
