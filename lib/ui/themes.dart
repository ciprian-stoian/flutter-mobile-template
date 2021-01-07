import 'package:flutter/material.dart';

class Themes {
  static const PRIMARY_COLOR = Color(0xFF00BFA5);

  static ThemeData getDarkTheme() {
    ThemeData themeData = ThemeData.dark();

    return themeData.copyWith(
        primaryColor: PRIMARY_COLOR,
        accentColor: PRIMARY_COLOR,
        appBarTheme: AppBarTheme(
          color: themeData.scaffoldBackgroundColor,
          elevation: 0,
        ),
        dialogTheme: DialogTheme());
  }

  static ThemeData getLightTheme() {
    ThemeData themeData = ThemeData.light();

    return themeData.copyWith(
        primaryColor: PRIMARY_COLOR,
        accentColor: PRIMARY_COLOR,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        dialogTheme: DialogTheme());
  }
}
