import 'package:flutter/material.dart';
import '../../../../domain/models/pokemon_list_model.dart';
import '../controllers/home_controller.dart';
import 'pokemon_list_widget.dart';
import '../../../widgets/error_generic_widget.dart';

class HomeListPokemonWidget extends StatefulWidget {
  const HomeListPokemonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeListPokemonWidget> createState() => _HomeListPokemonWidgetState();
}

class _HomeListPokemonWidgetState extends State<HomeListPokemonWidget> {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonListModel>(
      future: _controller.getPokemonList(_controller.link),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          case ConnectionState.none:
            return const LinearProgressIndicator(
              value: 1,
              color: Colors.red,
            );
          default:
            if (snapshot.hasData) {
              return PokemonListWidget(
                listPokemon: snapshot.data,
                nextPage: (value) => setState(() {
                  _controller.getPokemonList(value);
                }),
              );
            } else {
              return const ErrorGenericWidget();
            }
        }
      },
    );
  }
}
