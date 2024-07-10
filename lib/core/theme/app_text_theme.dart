import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static Text displayLargeWidget(String text, {Color? color}) => Text(text, style: displayLarge.copyWith(color: color));
  static Text displayMediumWidget(String text, {Color? color}) => Text(text, style: displayMedium.copyWith(color: color));
  static Text displaySmallWidget(String text, {Color? color}) => Text(text, style: displaySmall.copyWith(color: color));
  static Text headlineMediumWidget(String text, {Color? color}) => Text(text, style: headlineMedium.copyWith(color: color));
  static Text headlineSmallWidget(String text, {Color? color}) => Text(text, style: headlineSmall.copyWith(color: color));
  static Text titleLargeWidget(String text, {Color? color}) => Text(text, style: titleLarge.copyWith(color: color));
  static Text titleMediumWidget(String text, {Color? color}) => Text(text, style: titleMedium.copyWith(color: color));
  static Text titleSmallWidget(String text, {Color? color}) => Text(text, style: titleSmall.copyWith(color: color));
  static Text bodyLargeWidget(String text, {Color? color}) => Text(text, style: bodyLarge.copyWith(color: color));
  static Text bodyMediumWidget(String text, {Color? color}) => Text(text, style: bodyMedium.copyWith(color: color));
  static Text labelLargeWidget(String text, {Color? color}) => Text(text, style: labelLarge.copyWith(color: color));
  static Text bodySmallWidget(String text, {Color? color}) => Text(text, style: bodySmall.copyWith(color: color));
  static Text labelSmallWidget(String text, {Color? color}) => Text(text, style: labelSmall.copyWith(color: color));

  static TextStyle get displayLarge => GoogleFonts.inter(fontSize: 94, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  static TextStyle get displayMedium => GoogleFonts.inter(fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  static TextStyle get displaySmall => GoogleFonts.inter(fontSize: 47, fontWeight: FontWeight.w400);
  static TextStyle get headlineMedium => GoogleFonts.inter(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle get headlineSmall => GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle get titleLarge => GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  static TextStyle get bodyLarge => GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);
  static TextStyle get titleMedium => GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);
  static TextStyle get titleSmall => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);
  static TextStyle get bodyMedium => GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  static TextStyle get labelLarge => GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25);
  static TextStyle get bodySmall => GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4);
  static TextStyle get labelSmall => GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
