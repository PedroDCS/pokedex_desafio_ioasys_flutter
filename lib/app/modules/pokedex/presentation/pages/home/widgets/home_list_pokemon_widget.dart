import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/home/widgets/home_navigation_bottom_bar.dart';

import '../../../../domain/models/pokemon_list_model.dart';
import '../../../widgets/error_generic_widget.dart';
import '../controllers/home_controller.dart';
import 'home_search_pokemon_widget.dart';
import 'pokemon_list_widget.dart';

class HomeListPokemonWidget extends StatefulWidget {
  const HomeListPokemonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeListPokemonWidget> createState() => _HomeListPokemonWidgetState();
}

class _HomeListPokemonWidgetState
    extends ModularState<HomeListPokemonWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSearchPokemonWidget(search: (value) {
          setState(() {
            controller.setsearchh(value);
          });
        }),
        FutureBuilder<PokemonListModel>(
          future: controller.getPokemonList(controller.link),
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
                  if (snapshot.data!.results!.isNotEmpty) {
                    return Column(
                      children: [
                        PokemonListWidget(
                          listPokemon: snapshot.data,
                        ),
                        HomeNavigationBottomBar(
                          nextPage: (value) {
                            setState(() {
                              controller.getPokemonList(value);
                            });
                          },
                          listPokemon: snapshot.data,
                        )
                      ],
                    );
                  } else {
                    return Column(
                      children: const [
                        Text(
                          "Ops",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 138,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Este pokemon não está aqui ;(",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                } else {
                  return const ErrorGenericWidget();
                }
            }
          },
        )
      ],
    );
  }
}
