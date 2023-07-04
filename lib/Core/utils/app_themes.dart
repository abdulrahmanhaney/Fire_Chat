import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      cardColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.light().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
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
    return ThemeData.dark().copyWith(
      primaryColor: Colors.white,
      useMaterial3: true,
      cardColor: kPrimaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
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
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
