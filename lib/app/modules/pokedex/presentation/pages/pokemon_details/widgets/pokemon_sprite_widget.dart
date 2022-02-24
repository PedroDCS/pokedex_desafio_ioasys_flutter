import 'package:flutter/material.dart';
import '../../../widgets/pikachu_running_widget.dart';

class PokemonSpriteWidget extends StatelessWidget {
  const PokemonSpriteWidget({
    Key? key,
    required this.sprite,
  }) : super(key: key);

  final String sprite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 74),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            sprite,
            width: 200,
            height: 200,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: PikachuRunningWidget(height: 150, width: 186.5),
              );
            },
          ),
        ],
      ),
    );
  }
}
