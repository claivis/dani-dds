import 'package:flutter/material.dart';
/// dani.go Theme - Vibrant Dark Mode with Neon Accents
/// 
/// Palette:
/// - Background: Deep Midnight Blue (#050511)
/// - Surface: Translucent Glass (Dark Blue tint)
/// - Primary: Neon Cyan (#00F0FF)
/// - Secondary: Neon Purple (#BD00FF)
/// - Text: White / Light Grey
class DaniTheme {
  DaniTheme._();

  // ==================== COLORS ====================
  
  static const Color background = Color(0xFF050511); // Deepest Midnight Blue
  static const Color surface = Color(0xFF0A0A1F);    // Slightly lighter blue for cards (fallback)
  
  // Neon Accents
  static const Color cyan = Color(0xFF00F0FF);
  static const Color purple = Color(0xFFBD00FF);
  static const Color pink = Color(0xFFFF0055);
  
  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color textTertiary = Color(0xFF64748B);  // Slate 500
  
  // Functional
  static const Color error = Color(0xFFFF3366);
  static const Color success = Color(0xFF00FF9D);
  static const Color warning = Color(0xFFFFCC00);

  // ==================== NEON GRADIENTS ====================
  
  // Transportation (Blue/Purple)
  static const LinearGradient gradientTransport = LinearGradient(
    colors: [Color(0xFF00F0FF), Color(0xFF5D00FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Accommodation (Orange/Pink)
  static const LinearGradient gradientAccommodation = LinearGradient(
    colors: [Color(0xFFFF8000), Color(0xFFFF0055)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Activity/Attraction (Green/Cyan)
  static const LinearGradient gradientActivity = LinearGradient(
    colors: [Color(0xFF00FF9D), Color(0xFF00F0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dining (Pink/Purple)
  static const LinearGradient gradientDining = LinearGradient(
    colors: [Color(0xFFFF00CC), Color(0xFFBD00FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Default/Generic (Cyan/Blue)
  static const LinearGradient gradientDefault = LinearGradient(
    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ==================== THEME DATA ====================

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      
      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: cyan,
        onPrimary: background,
        secondary: purple,
        onSecondary: Colors.white,
        tertiary: pink,
        onTertiary: Colors.white,
        error: error,
        onError: Colors.white,
        surface: surface,
        onSurface: textPrimary,
      ),
      
      // Typography (Inter) — bundled locally in assets/fonts/
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w800, letterSpacing: -1.0),
        displayMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w800, letterSpacing: -0.5),
        headlineLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w700),
        titleLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(color: textSecondary, fontWeight: FontWeight.w400),
        labelLarge: TextStyle(color: cyan, fontWeight: FontWeight.w600), // Neon labels
      ),
      
      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),

      // Buttons (fontFamily inherited from theme-level fontFamily)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: cyan,
          foregroundColor: background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: cyan,
          side: const BorderSide(color: cyan, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      
      // Cards (Default fallback, but we'll use GlassContainer mostly)
      cardTheme: CardThemeData(
        color: surface.withOpacity(0.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      
      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: cyan),
        ),
        hintStyle: TextStyle(color: textSecondary.withOpacity(0.5)),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      // Icons
      iconTheme: const IconThemeData(color: textPrimary),
    );
  }
}
