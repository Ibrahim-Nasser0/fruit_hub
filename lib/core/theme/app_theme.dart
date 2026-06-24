import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'typography.dart';

/// Application Theme Configuration
/// Provides Light and Dark theme configurations
class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(Locale locale) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTypography.h2(
          locale,
        ).copyWith(color: AppColors.textPrimary),
      ),

      textTheme: TextTheme(
        displayLarge: AppTypography.h1(
          locale,
        ).copyWith(color: AppColors.textPrimary),
        displayMedium: AppTypography.h2(
          locale,
        ).copyWith(color: AppColors.textPrimary),
        displaySmall: AppTypography.h3(
          locale,
        ).copyWith(color: AppColors.textPrimary),
        headlineMedium: AppTypography.h4(
          locale,
        ).copyWith(color: AppColors.textPrimary),
        bodyLarge: AppTypography.bodyLarge(
          locale,
        ).copyWith(color: AppColors.textPrimary),
        bodyMedium: AppTypography.bodyMedium(
          locale,
        ).copyWith(color: AppColors.textSecondary),
        bodySmall: AppTypography.bodySmall(
          locale,
        ).copyWith(color: AppColors.textSecondary),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTypography.button(locale),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: AppTypography.button(locale)),
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData darkTheme(Locale locale) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onSurface: AppColors.textLight,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTypography.h2(
          locale,
        ).copyWith(color: AppColors.textLight),
      ),

      textTheme: TextTheme(
        displayLarge: AppTypography.h1(
          locale,
        ).copyWith(color: AppColors.textLight),
        displayMedium: AppTypography.h2(
          locale,
        ).copyWith(color: AppColors.textLight),
        displaySmall: AppTypography.h3(
          locale,
        ).copyWith(color: AppColors.textLight),
        headlineMedium: AppTypography.h4(
          locale,
        ).copyWith(color: AppColors.textLight),
        bodyLarge: AppTypography.bodyLarge(
          locale,
        ).copyWith(color: AppColors.textLight),
        bodyMedium: AppTypography.bodyMedium(
          locale,
        ).copyWith(color: AppColors.textSecondary),
        bodySmall: AppTypography.bodySmall(
          locale,
        ).copyWith(color: AppColors.textSecondary),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTypography.button(locale),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: AppTypography.button(locale)),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
