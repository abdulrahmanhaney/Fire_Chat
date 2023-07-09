import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'TTCommons',
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      appBarTheme: AppBarTheme(
        elevation: 3,
        backgroundColor: kPrimaryColor.withOpacity(0.4),
        titleTextStyle: AppTextStyles.s18b.copyWith(
          fontFamily: 'TTCommons',
          color: Colors.black.withOpacity(0.6),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontFamily: 'TTCommons',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: kPrimaryColor,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      fontFamily: 'TTCommons',
      appBarTheme: AppBarTheme(
        elevation: 3,
        backgroundColor: kPrimaryColor.withOpacity(0.4),
        titleTextStyle: AppTextStyles.s18b.copyWith(
          fontFamily: 'TTCommons',
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(kPrimaryColor),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontFamily: 'TTCommons',
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
