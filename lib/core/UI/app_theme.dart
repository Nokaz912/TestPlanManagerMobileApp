import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';


class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,

    scaffoldBackgroundColor: Colors.transparent,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.warmBeige,
      background: Colors.transparent,
      primary: AppColors.warmBeige,
      secondary: AppColors.softViolet,
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: Colors.white70),
      titleLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.softViolet.withOpacity(0.65),
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.warmBeige,
        foregroundColor: AppColors.darkNavy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
  );
}
