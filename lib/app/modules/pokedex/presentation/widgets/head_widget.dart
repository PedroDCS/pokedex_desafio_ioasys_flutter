import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/presentation/widgets/switch_theme_widget.dart';

class HeadWidget extends StatefulWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HeadWidget> createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset(
                'assets/images/logo.png',
                width: 27,
                height: 21,
              ),
            ),
            Text(
              'title'.i18n(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SwitchThemeWidget(),
      ],
    );
  }
}
