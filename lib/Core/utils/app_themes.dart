import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.teal,
      cardColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.light().textTheme),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.teal),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(AppTextStyles.s16b),
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

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.white,
      useMaterial3: true,
      cardColor: Colors.teal,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.teal),
          textStyle: MaterialStatePropertyAll(AppTextStyles.s16b),
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
