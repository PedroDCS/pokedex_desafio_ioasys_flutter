import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

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
        Text(
          'goback'.i18n(),
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
