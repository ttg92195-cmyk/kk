import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1A1A2E);
  static const Color secondaryColor = Color(0xFF16213E);
  static const Color accentColor = Color(0xFFFFD700);
  static const Color backgroundColor = Color(0xFF0F0F1A);
  static const Color cardColor = Color(0xFF1E1E32);
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Colors.grey;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: accentColor,
        secondary: accentColor,
        surface: cardColor,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: primaryColor,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(color: textColor),
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: subtitleColor),
        bodySmall: TextStyle(color: subtitleColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentColor),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
