import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          SvgPicture.network(
            sprite,
            width: 200,
            height: 200,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(0.0),
                child: const PikachuRunningWidget(height: 150, width: 186.5)),
          ),
        ],
      ),
    );
  }
}
