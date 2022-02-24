import 'package:flutter/material.dart';

import '../../../../../../../commons/colors/colors.dart';
import '../../../../../../../commons/pokemon_formatter/pokemon_formater.dart';

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
    final _formatter = PokemonFormatter();
    final _color = CustomColors();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Base Stats",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: _color.pokeColor(type),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final status = statusList[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Text(
                      _formatter.formatStsName(status.name),
                      style: TextStyle(
                        fontSize: 14,
                        color: _color.pokeColor(type),
                      ),
                    ),
                    title: Text(
                      _formatter.formatNumber(status.value),
                    ),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: LinearProgressIndicator(
                        color: _color.pokeColor(type),
                        value: double.parse(status.value) / 100,
                        semanticsLabel: status.name,
                      ),
                    ),
                  );
                }),
          ],
        ),
      ],
    );
  }
}
