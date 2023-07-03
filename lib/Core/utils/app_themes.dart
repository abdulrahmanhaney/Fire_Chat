import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      cardColor: Colors.white,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.light().textTheme),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
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
      cardColor: kPrimaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
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
