import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      );
}
