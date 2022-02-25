import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController {
  load() async {
    await Future.delayed(const Duration(seconds: 1));
    await Hive.initFlutter();

    Modular.to.navigate('/pokedex');
  }
}
