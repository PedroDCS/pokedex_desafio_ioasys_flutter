import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'home_favorites_buttom_widget.dart';

class HomeSearchPokemonWidget extends StatelessWidget {
  const HomeSearchPokemonWidget({
    Key? key,
    required this.search,
  }) : super(key: key);
  final Function search;
  @override
  Widget build(BuildContext context) {
    return Row(
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
        const HomeGoToFavoritesWidget()
      ],
    );
  }
}
