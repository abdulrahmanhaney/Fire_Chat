import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      cardColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'IBMPLEX',
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPLEX',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontFamily: 'IBMPLEX',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(double.infinity, 45),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      useMaterial3: true,
      cardColor: kPrimaryColor,
      brightness: Brightness.dark,
      fontFamily: 'IBMPLEX',
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'IBMPLEX',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: kPrimaryColor,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontFamily: 'IBMPLEX',
              fontWeight: FontWeight.bold,
            ),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(double.infinity, 45),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
