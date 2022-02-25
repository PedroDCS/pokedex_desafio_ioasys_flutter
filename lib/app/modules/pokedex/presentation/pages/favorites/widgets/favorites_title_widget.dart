import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class FavoritesTitleWidget extends StatelessWidget {
  const FavoritesTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 84, bottom: 63),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const ImageIcon(
          AssetImage('assets/icons/heartIcon.png'),
          size: 30,
        ),
        Text(
          'favoriteTitle'.i18n(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 18),
        ),
      ]),
    );
  }
}
