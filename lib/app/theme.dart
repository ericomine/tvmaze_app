import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final primaryColor = Colors.amber;

  return ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primaryColor,
      primaryColorDark: Colors.black,
      backgroundColor: Colors.white,
      accentColor: Colors.black,
    ),
    textTheme: buildTextTheme(ThemeData.light().textTheme),
  ).copyWith(
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline3: base.headline3.copyWith(
          fontWeight: FontWeight.w700,
        ),
        headline4: base.headline4.copyWith(
          fontWeight: FontWeight.w700,
        ),
        bodyText2: base.bodyText2.copyWith(
          fontWeight: FontWeight.w400,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
        ),
      )
      .apply(displayColor: Colors.black);
}
