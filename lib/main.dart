import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  Hive.init(".");
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
