import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Themes {
  static ThemeData get init {
    return ThemeData(
      primaryColor: MyColor.primary,
      appBarTheme: const AppBarTheme(
        color: MyColor.primary,
      ),
      scaffoldBackgroundColor: MyColor.background,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: MyColor.text,
        bodyColor: MyColor.text,
      ),
      shadowColor: MyColor.shadow,
      brightness: Brightness.dark,
    );
  }
}
