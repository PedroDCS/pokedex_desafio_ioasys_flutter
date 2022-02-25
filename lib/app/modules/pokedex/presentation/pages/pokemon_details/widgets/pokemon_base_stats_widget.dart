import 'package:flutter/material.dart';
import 'pokemon_base_stats_list.dart';
import 'package:localization/localization.dart';

import '../../../../../../../commons/colors/colors.dart';

class PokemonBaseStatsWidget extends StatelessWidget {
  const PokemonBaseStatsWidget({
    Key? key,
    required this.type,
    required this.statusList,
  }) : super(key: key);

  final String type;
  final List statusList;
  @override
  Widget build(BuildContext context) {
    final _color = CustomColors();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'baseStats'.i18n(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: _color.pokeColor(type),
            ),
          ),
        ),
        PokemonBaseStatsList(statusList: statusList, type: type),
      ],
    );
  }
}
