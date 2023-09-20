import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class ThemeConfig {
  static final themeData = ThemeData(
    fontFamily: GoogleFonts.openSans(fontWeight: FontWeight.w400).fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 28,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    ),
  );
}
