import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/controller/favorites_controller.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/home/widgets/pokemon_item_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/error_generic_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/head_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pikachu_running_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    FavoritesController _controller = FavoritesController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: [
              const HeadWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 84, bottom: 63),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const ImageIcon(
                        AssetImage('assets/icons/heartIcon.png'),
                        size: 30,
                      ),
                      Text(
                        '  Meus favoritos',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18),
                      ),
                    ]),
              ),
              FutureBuilder(
                  future: _controller.getData(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 112,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 18,
                        ),
                        itemCount: _controller.listPokemonIndex.length,
                        itemBuilder: (_, index) {
                          var pokemon = _controller.listPokemonIndex[index];
                          return FutureBuilder<PokemonModel>(
                              future: _controller.getPokemon(pokemon: pokemon),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return const Center(
                                      child: PikachuRunningWidget(
                                          height: 150, width: 182.5),
                                    );
                                  case ConnectionState.active:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.green),
                                    );
                                  case ConnectionState.none:
                                    return const LinearProgressIndicator(
                                      value: 1,
                                      color: Colors.red,
                                    );
                                  default:
                                    if (snapshot.hasData) {
                                      return PokemonItemWidget(
                                        pokeData: snapshot.data!,
                                      );
                                    } else {
                                      return const ErrorGenericWidget();
                                    }
                                }
                              });
                        });
                  }),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Modular.to.maybePop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Voltar",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
