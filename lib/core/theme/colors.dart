import 'package:flutter/material.dart';

/// Application Color Constants
class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF1B5E37);
  static const Color primaryDark = Color(0xFF14532D);
  static const Color primaryLight = Color(0xFF4CAF50);

  // Secondary
  static const Color secondary = Color(0xFFF4A91F);
  static const Color secondaryDark = Color(0xFFD48806);
  static const Color secondaryLight = Color(0xFFFFC857);

  // Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF121212);

  // Surface
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text
  static const Color textPrimary = Color(0xFF1F2937); // Gray-800
  static const Color textSecondary = Color(0xFF6B7280); // Gray-500
  static const Color textLight = Color(
    0xFFF9FAFB,
  ); // للنصوص على الخلفيات الداكنة
  static const Color textHint = Color(0xFF9CA3AF);

  // On Primary
  static const Color textOnPrimary = Colors.white;

  // Borders
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Primary Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B5E37), // أخضر الأوراق
      Color(0xFF4CAF50), // أخضر فاتح
      Color(0xFFF4A91F), // لون المانجو
    ],
  );

  // Accent Gradient
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFB74D), // Orange Light
      Color(0xFFFF7043), // Deep Orange
    ],
  );

  // Dark Gradient
  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF121212), // Background Dark
      Color(0xFF1E1E1E), // Surface Dark
    ],
  );

  // Success Gradient
  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
  );
}
