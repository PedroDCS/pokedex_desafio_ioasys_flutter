import 'package:flutter/material.dart';
import 'widgets/favorites_button_back_widget.dart';

import '../../widgets/head_widget.dart';
import 'widgets/favorites_list_widget.dart';
import 'widgets/favorites_title_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: const [
              HeadWidget(),
              FavoritesTitleWidget(),
              FavoritesListWidget(),
              FavoritesButtonBackWidget()
            ],
          ),
        ),
      ),
    );
  }
}
