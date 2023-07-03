import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.black,
      textTheme: GoogleFonts.exo2TextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData();
  }
}
