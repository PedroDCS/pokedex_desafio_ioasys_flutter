import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeGoToFavoritesWidget extends StatelessWidget {
  const HomeGoToFavoritesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.55),
      child: IconButton(
          padding: const EdgeInsets.all(0),
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
    );
  }
}
