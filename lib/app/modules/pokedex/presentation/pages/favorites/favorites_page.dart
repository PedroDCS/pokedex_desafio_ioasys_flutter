import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/controller/favorites_controller.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/widgets/favorites_list_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/pages/favorites/widgets/favorites_title_widget.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/pokemon_item_widget.dart';
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
              const FavoritesTitleWidget(),
              FavoritesListWidget(controller: _controller),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Modular.to.maybePop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
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
