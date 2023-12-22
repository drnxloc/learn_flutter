import 'package:flutter/material.dart';
import 'package:learn_flutter/gen/fonts.gen.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
    useMaterial3: true,
    fontFamily: FontFamily.montserrat,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.brown,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    fontFamily: FontFamily.montserrat,
  );
}
