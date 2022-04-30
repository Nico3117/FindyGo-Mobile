import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFb2dfdb),
  primaryColorDark: const Color(0xFF82ada9),
  primaryColorLight: const Color(0xFFe5ffff),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  cardColor: const Color(0xFFFFFFFF),
  backgroundColor: Colors.black26,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF4c5059),
  primaryColorDark: const Color(0xFF242830),
  primaryColorLight: const Color(0xFF787c86),
  scaffoldBackgroundColor: const Color(0xFFA4B5BF),
  cardColor: const Color(0xFFA4B5BF),
  backgroundColor: Colors.black54,
);
