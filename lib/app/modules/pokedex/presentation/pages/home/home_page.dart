import 'package:flutter/material.dart';
import '../../widgets/head_widget.dart';
import 'widgets/home_list_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(children: const [
            HeadWidget(),
            HomeListPokemonWidget(),
          ]),
        ),
      ),
    );
  }
}
