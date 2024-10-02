import 'package:flutter/material.dart';
import 'package:news/core/theme/colors_palette.dart';

class AppThemeManager {
  // static ThemeData themeData = ThemeData();
  static ThemeData themeData = ThemeData(
    primaryColor: ColorsPalette.primaryColor,
    // primaryColorLight: primaryBlueColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 35, color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          // fontWeight: FontWeight.bold,
          fontFamily: "Exo",
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ))),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "Exo",
          color: Colors.white),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: "Exo",
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: "Exo",
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: "Exo",
        color: Colors.black54,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Exo",
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Exo",
        color: Colors.black,
      ),
    ),
  );
}
