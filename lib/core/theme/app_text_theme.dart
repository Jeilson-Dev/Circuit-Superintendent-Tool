import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle get displayLarge => GoogleFonts.inter(fontSize: 94, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  static TextStyle get displayMedium => GoogleFonts.inter(fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  static TextStyle get displaySmall => GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400);
  static TextStyle get headlineMedium => GoogleFonts.inter(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle get headlineSmall => GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle get titleLarge => GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  static TextStyle get titleMedium => GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);
  static TextStyle get titleSmall => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);
  static TextStyle get bodyLarge => GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);
  static TextStyle get bodyMedium => GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle get labelLarge => GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25);
  static TextStyle get bodySmall => GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4);
  static TextStyle get labelSmall => GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
