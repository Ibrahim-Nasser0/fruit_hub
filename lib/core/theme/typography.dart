import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextStyle _style(
    Locale locale, {
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return locale.languageCode == 'en'
        ? GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            height: height,
          )
        : GoogleFonts.cairo(
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            height: height,
          );
  }

  // Headings
  static TextStyle h1(Locale locale) => _style(
    locale,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle h2(Locale locale) => _style(
    locale,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static TextStyle h3(Locale locale) => _style(
    locale,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    height: 1.4,
  );

  static TextStyle h4(Locale locale) => _style(
    locale,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.4,
  );

  static TextStyle h5(Locale locale) =>
      _style(locale, fontSize: 16, fontWeight: FontWeight.w600, height: 1.5);

  static TextStyle h6(Locale locale) =>
      _style(locale, fontSize: 14, fontWeight: FontWeight.w600, height: 1.5);

  // Body
  static TextStyle bodyLarge(Locale locale) => _style(
    locale,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static TextStyle bodyMedium(Locale locale) => _style(
    locale,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static TextStyle bodySmall(Locale locale) => _style(
    locale,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    height: 1.5,
  );

  // Button
  static TextStyle button(Locale locale) => _style(
    locale,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // Caption
  static TextStyle caption(Locale locale) => _style(
    locale,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    height: 1.3,
  );

  // Overline
  static TextStyle overline(Locale locale) => _style(
    locale,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.6,
  );

  // Labels
  static TextStyle labelLarge(Locale locale) => _style(
    locale,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium(Locale locale) => _style(
    locale,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall(Locale locale) => _style(
    locale,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
