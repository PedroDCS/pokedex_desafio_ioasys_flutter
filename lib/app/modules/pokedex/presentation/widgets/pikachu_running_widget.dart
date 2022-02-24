import 'package:flutter/material.dart';

class PikachuRunningWidget extends StatelessWidget {
  const PikachuRunningWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/pikachu_running.gif',
        height: height, width: width);
  }
}
