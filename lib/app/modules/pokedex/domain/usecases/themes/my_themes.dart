import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: const Color(0xFF212121),
    iconTheme: const IconThemeData(color: Color(0xFFEC0344)),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFEC0344),
      secondary: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: const Color(0xFFF7F7F7),
    iconTheme: const IconThemeData(color: Color(0xFFEC0344)),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFEC0344),
      secondary: Colors.black,
    ),
  );
}
