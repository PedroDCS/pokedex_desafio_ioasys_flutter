import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../../../../commons/pikachu_running_widget.dart';

import 'home_controller.dart';

class HomePageSplash extends StatefulWidget {
  const HomePageSplash({Key? key}) : super(key: key);

  @override
  State<HomePageSplash> createState() => _HomePageSplashState();
}

class _HomePageSplashState
    extends ModularState<HomePageSplash, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PikachuRunningWidget(height: 150, width: 186.59),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'title'.i18n(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
