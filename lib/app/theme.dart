import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final primaryColor = Colors.teal;
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: primaryColor,
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor),
    ),
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    accentTextTheme: buildTextTheme(base.accentTextTheme),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline3: base.headline3.copyWith(
      fontWeight: FontWeight.w700,
    ),
    headline4: base.headline4.copyWith(
      fontWeight: FontWeight.w700,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
    ),
  );
}
