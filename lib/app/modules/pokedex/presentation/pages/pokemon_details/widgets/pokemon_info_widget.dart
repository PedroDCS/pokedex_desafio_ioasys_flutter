import 'package:flutter/material.dart';

class PokemonInfoWidget extends StatelessWidget {
  final AssetImage? icon;
  final bool useIcon;
  final String info;
  final String infoType;
  const PokemonInfoWidget({
    Key? key,
    this.icon,
    required this.useIcon,
    required this.info,
    required this.infoType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: useIcon
                  ? ImageIcon(
                      icon,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : const Text(""),
            ),
            Text(
              info,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            infoType,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
