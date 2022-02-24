import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokedex_desafio_ioasys_flutter/commons/pokemon_formatter/pokemon_formater.dart';

class PokemonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String id;
  final String router;
  const PokemonAppBar({
    Key? key,
    required this.name,
    required this.id,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatter = PokemonFormatter();
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Modular.to.pushReplacementNamed(router);
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _formatter.formatName(name),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '#${_formatter.formatNumber(id)}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
