import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'controllers/home_controller.dart';
import '../../widgets/head_widget.dart';
import 'widgets/home_list_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(children: [
            const HeadWidget(),
            Padding(
              padding: const EdgeInsets.only(bottom: 41, top: 51),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                        labelText: 'search'.i18n(),
                        hintText: 'search'.i18n() + " Pokémon",
                        contentPadding:
                            const EdgeInsets.fromLTRB(46, 16, 30, 14),
                        suffix: const Icon(Icons.search),
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
            ),
            const HomeListPokemonWidget(),
          ]),
        ),
      ),
    );
  }
}
