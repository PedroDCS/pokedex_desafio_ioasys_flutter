import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesButtonBackWidget extends StatelessWidget {
  const FavoritesButtonBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
