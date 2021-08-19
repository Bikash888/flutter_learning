import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GranthaTheme {
  static ThemeData get themeData => ThemeData(
      primarySwatch: Colors.blueGrey,
      fontFamily: GoogleFonts.arapey().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.blueGrey,
        elevation: 0.0,
      ));
}
