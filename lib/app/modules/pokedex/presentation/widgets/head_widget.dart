import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import '../../../../../commons/themes/theme_notification.dart';

class HeadWidget extends StatefulWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HeadWidget> createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  var _theme = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 13, 0),
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
          height: 27,
          width: 49,
          child: Switch.adaptive(
            activeColor: Theme.of(context).colorScheme.primary,
            value: ThemeNotifier.themeNotifier.value
                .toString()
                .contains(ThemeMode.dark.toString()),
            onChanged: (value) {
              setState(() {
                _theme = !_theme;
              });

              ThemeNotifier.themeNotifier.value =
                  ThemeNotifier.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            },
          ),
        ),
      ],
    );
  }
}
