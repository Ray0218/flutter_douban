import 'package:flutter/material.dart';

class KLAppTheme {
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static const Color normalTextColor = Colors.purple;
  static const Color darkTextColor = Colors.red;

  static final ThemeData normalTheme = ThemeData(
    primaryColor: Colors.yellow,
    canvasColor: Color.fromRGBO(255, 254, 222, 1), //
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: normalFontSize, color: normalTextColor)),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.greenAccent,
      textTheme: TextTheme(
          bodyText1:
              TextStyle(fontSize: normalFontSize, color: darkTextColor)));
}
