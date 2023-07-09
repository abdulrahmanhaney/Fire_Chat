import 'package:flutter/material.dart';

class AppTextStyles {
  // b => Bold
  // n => Normal
  // m => Medium
  // i => Italic
  // s => Size
  static TextStyle get s30b => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get s18b => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      );
  static TextStyle get s16b => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get s14b => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get s12b => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get s12n => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get s14n => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}
