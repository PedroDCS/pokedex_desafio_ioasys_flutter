import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class HomeSearchPokemonWidget extends StatelessWidget {
  const HomeSearchPokemonWidget({
    Key? key,
    required this.search,
  }) : super(key: key);
  final Function search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 41, top: 51),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                search(value);
              },
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: 'search'.i18n(),
                hintText: 'search'.i18n() + " Pokémon",
                contentPadding: const EdgeInsets.fromLTRB(46, 16, 30, 14),
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22.55),
            child: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Modular.to.pushNamed(
                    'favorites',
                  );
                },
                icon: const ImageIcon(
                  AssetImage('assets/icons/heartIcon.png'),
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
