import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TStyles {
  static TextStyle h1({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle h2({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle sh1({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle sh2({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle sh3({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle p1({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle p2({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle p3({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}
