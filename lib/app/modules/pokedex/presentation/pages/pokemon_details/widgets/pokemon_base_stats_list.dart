import 'package:flutter/material.dart';
import '../../../../domain/usecases/pokemon_colors.dart';
import '../../../../domain/usecases/pokemon_formater.dart';

class PokemonBaseStatsList extends StatelessWidget {
  const PokemonBaseStatsList({
    Key? key,
    required this.statusList,
    required this.type,
  }) : super(key: key);

  final List statusList;
  final String type;

  @override
  Widget build(BuildContext context) {
    final _formatter = PokemonFormatter();
    final _color = CustomColors();

    return Column(
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
                  _formatter.formatNumber(status.value.toString()),
                ),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: LinearProgressIndicator(
                    color: _color.pokeColor(type),
                    value: double.parse(status.value.toString()) / 100,
                    semanticsLabel: status.name,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
