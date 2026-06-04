// App theme system inspired by shadcn/ui
// Provides comprehensive theming for light and dark modes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'design_tokens.dart';

/// App theme configuration inspired by shadcn/ui design system
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Color scheme - More muted and professional
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2563EB), // Professional blue
        onPrimary: Color(0xFFFFFFFF), // white
        secondary: Color(0xFF64748B), // Muted slate
        onSecondary: Color(0xFFFFFFFF), // white
        tertiary: Color(0xFF059669), // Muted green
        onTertiary: Color(0xFFFFFFFF), // white
        error: Color(0xFFDC2626), // Professional red
        onError: Color(0xFFFFFFFF), // Dark slate
        surface: Color(0xFFFFFFFF), // Pure white
        onSurface: Color(0xFF1E293B), // Dark slate
        surfaceContainerHighest: Color(0xFFF1F5F9), // Light slate
        onSurfaceVariant: Color(0xFF475569), // Medium slate
        outline: Color(0xFFCBD5E1), // Light border
        outlineVariant: Color(0xFFE2E8F0), // Very light border
        shadow: Color(0xFF1E293B), // Dark slate
      ),

      // Typography
      textTheme: _buildTextTheme(const Color(0xFF1E293B)), // Dark slate
      
      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFAFAFA), // Very light gray
        foregroundColor: Color(0xFF1E293B), // Dark slate
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E293B), // Dark slate
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF1E293B), // Dark slate
          size: 20,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF), // Pure white
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFCBD5E1)), // Light border
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB), // Professional blue
          foregroundColor: const Color(0xFFFFFFFF), // white
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF3B82F6), // Brighter blue for dark mode
          side: const BorderSide(color: Color(0xFFCBD5E1)), // Light border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF3B82F6), // Brighter blue for dark mode
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFAFAFA), // Very light gray
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)), // Light border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)), // Light border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2), // Professional blue
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDC2626)), // Professional red
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 2), // Professional red
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        hintStyle: const TextStyle(
          color: Color(0xFF475569), // Medium slate
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF475569), // Medium slate
          fontSize: 14,
        ),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF059669), // Muted green
        labelStyle: const TextStyle(
          color: Color(0xFFFFFFFF), // white
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFFFFFFFF), // Pure white
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E293B), // Dark slate
        ),
        contentTextStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFF475569), // Medium slate
        ),
      ),

      // Bottom sheet theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: DesignTokens.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(DesignTokens.radiusLg),
          ),
        ),
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: DesignTokens.border,
        thickness: 1,
        space: 1,
      ),

      // List tile theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: DesignTokens.spacing4,
          vertical: DesignTokens.spacing2,
        ),
        titleTextStyle: TextStyle(
          fontSize: DesignTokens.textSm,
          fontWeight: DesignTokens.fontMedium,
          color: DesignTokens.foreground,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: DesignTokens.textXs,
          color: DesignTokens.mutedForeground,
        ),
        iconColor: DesignTokens.mutedForeground,
      ),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primary;
          }
          return DesignTokens.mutedForeground;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primary.withOpacity(0.3);
          }
          return DesignTokens.input;
        }),
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(DesignTokens.primaryForeground),
        side: const BorderSide(color: DesignTokens.input),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm),
        ),
      ),

      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primary;
          }
          return DesignTokens.mutedForeground;
        }),
      ),

      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: DesignTokens.primary,
        inactiveTrackColor: DesignTokens.input,
        thumbColor: DesignTokens.primary,
        overlayColor: DesignTokens.primary.withOpacity(0.1),
        valueIndicatorColor: DesignTokens.primary,
        valueIndicatorTextStyle: const TextStyle(
          color: DesignTokens.primaryForeground,
          fontSize: DesignTokens.textXs,
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DesignTokens.primary,
        linearTrackColor: DesignTokens.input,
        circularTrackColor: DesignTokens.input,
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: DesignTokens.primary,
        foregroundColor: DesignTokens.primaryForeground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg),
        ),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Color scheme - Better contrast and less similar dark colors
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3B82F6), // Brighter blue for dark mode
        onPrimary: Color(0xFFFFFFFF), // white
        secondary: Color(0xFF94A3B8), // Lighter slate for better contrast
        onSecondary: Color(0xFF0F172A), // Dark slate
        tertiary: Color(0xFF10B981), // Brighter green
        onTertiary: Color(0xFFFFFFFF), // white
        error: Color(0xFFEF4444), // Brighter red
        onError: Color(0xFFFFFFFF), // Very light text
        surface: Color(0xFF1E293B), // Medium slate surface
        onSurface: Color(0xFFF8FAFC), // Very light text
        surfaceContainerHighest: Color(0xFF334155), // Lighter than surface for contrast
        onSurfaceVariant: Color(0xFFCBD5E1), // Light text on variant
        outline: Color(0xFF475569), // Medium slate border
        outlineVariant: Color(0xFF334155), // Lighter border variant
        shadow: Color(0xFF000000), // black
      ),

      // Typography
      textTheme: _buildTextTheme(const Color(0xFFF8FAFC)), // Very light text
      
      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F172A), // Dark slate background
        foregroundColor: Color(0xFFF8FAFC), // Very light text
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF8FAFC), // Very light text
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFF8FAFC), // Very light text
          size: 20,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: const Color(0xFF1E293B), // Medium slate surface
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF475569)), // Medium slate border
        ),
        margin: EdgeInsets.zero,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B82F6), // Brighter blue for dark mode
          foregroundColor: const Color(0xFFFFFFFF), // white
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF3B82F6), // Brighter blue for dark mode
          side: const BorderSide(color: Color(0xFF475569)), // Medium slate border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF3B82F6), // Brighter blue for dark mode
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E293B), // Medium slate surface
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF475569)), // Medium slate border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF475569)), // Medium slate border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2), // Brighter blue for dark mode
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEF4444)), // Brighter red
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2), // Brighter red
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        hintStyle: const TextStyle(
          color: Color(0xFF94A3B8), // Lighter slate for better contrast
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: Color(0xFF94A3B8), // Lighter slate for better contrast
          fontSize: 14,
        ),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF10B981), // Brighter green
        labelStyle: const TextStyle(
          color: Color(0xFFFFFFFF), // white
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF1E293B), // Medium slate surface
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF8FAFC), // Very light text
        ),
        contentTextStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFF94A3B8), // Lighter slate for better contrast
        ),
      ),

      // Bottom sheet theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: DesignTokens.cardDark,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(DesignTokens.radiusLg),
          ),
        ),
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: DesignTokens.borderDark,
        thickness: 1,
        space: 1,
      ),

      // List tile theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: DesignTokens.spacing4,
          vertical: DesignTokens.spacing2,
        ),
        titleTextStyle: TextStyle(
          fontSize: DesignTokens.textSm,
          fontWeight: DesignTokens.fontMedium,
          color: DesignTokens.foregroundDark,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: DesignTokens.textXs,
          color: DesignTokens.mutedForegroundDark,
        ),
        iconColor: DesignTokens.mutedForegroundDark,
      ),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primaryDark;
          }
          return DesignTokens.mutedForegroundDark;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primaryDark.withOpacity(0.3);
          }
          return DesignTokens.inputDark;
        }),
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primaryDark;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(DesignTokens.primaryForegroundDark),
        side: const BorderSide(color: DesignTokens.inputDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusSm),
        ),
      ),

      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DesignTokens.primaryDark;
          }
          return DesignTokens.mutedForegroundDark;
        }),
      ),

      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: DesignTokens.primaryDark,
        inactiveTrackColor: DesignTokens.inputDark,
        thumbColor: DesignTokens.primaryDark,
        overlayColor: DesignTokens.primaryDark.withOpacity(0.1),
        valueIndicatorColor: DesignTokens.primaryDark,
        valueIndicatorTextStyle: const TextStyle(
          color: DesignTokens.primaryForegroundDark,
          fontSize: DesignTokens.textXs,
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: DesignTokens.primaryDark,
        linearTrackColor: DesignTokens.inputDark,
        circularTrackColor: DesignTokens.inputDark,
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: DesignTokens.primaryDark,
        foregroundColor: DesignTokens.primaryForegroundDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.radiusLg),
        ),
      ),
    );
  }

  /// Build text theme with consistent styling
  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontSize: DesignTokens.text6xl,
        fontWeight: DesignTokens.fontBold,
        color: baseColor,
        height: DesignTokens.leadingNone,
        letterSpacing: DesignTokens.trackingTighter,
      ),
      displayMedium: TextStyle(
        fontSize: DesignTokens.text5xl,
        fontWeight: DesignTokens.fontBold,
        color: baseColor,
        height: DesignTokens.leadingNone,
        letterSpacing: DesignTokens.trackingTighter,
      ),
      displaySmall: TextStyle(
        fontSize: DesignTokens.text4xl,
        fontWeight: DesignTokens.fontBold,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: DesignTokens.text3xl,
        fontWeight: DesignTokens.fontSemibold,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),
      headlineMedium: TextStyle(
        fontSize: DesignTokens.text2xl,
        fontWeight: DesignTokens.fontSemibold,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),
      headlineSmall: TextStyle(
        fontSize: DesignTokens.textXl,
        fontWeight: DesignTokens.fontSemibold,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: DesignTokens.textLg,
        fontWeight: DesignTokens.fontSemibold,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),
      titleMedium: TextStyle(
        fontSize: DesignTokens.textBase,
        fontWeight: DesignTokens.fontMedium,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),
      titleSmall: TextStyle(
        fontSize: DesignTokens.textSm,
        fontWeight: DesignTokens.fontMedium,
        color: baseColor,
        height: DesignTokens.leadingTight,
        letterSpacing: DesignTokens.trackingTight,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: DesignTokens.textBase,
        fontWeight: DesignTokens.fontNormal,
        color: baseColor,
        height: DesignTokens.leadingRelaxed,
        letterSpacing: DesignTokens.trackingNormal,
      ),
      bodyMedium: TextStyle(
        fontSize: DesignTokens.textSm,
        fontWeight: DesignTokens.fontNormal,
        color: baseColor,
        height: DesignTokens.leadingNormal,
        letterSpacing: DesignTokens.trackingNormal,
      ),
      bodySmall: TextStyle(
        fontSize: DesignTokens.textXs,
        fontWeight: DesignTokens.fontNormal,
        color: baseColor,
        height: DesignTokens.leadingNormal,
        letterSpacing: DesignTokens.trackingNormal,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: DesignTokens.textSm,
        fontWeight: DesignTokens.fontMedium,
        color: baseColor,
        height: DesignTokens.leadingNone,
        letterSpacing: DesignTokens.trackingWide,
      ),
      labelMedium: TextStyle(
        fontSize: DesignTokens.textXs,
        fontWeight: DesignTokens.fontMedium,
        color: baseColor,
        height: DesignTokens.leadingNone,
        letterSpacing: DesignTokens.trackingWide,
      ),
      labelSmall: TextStyle(
        fontSize: DesignTokens.textXs,
        fontWeight: DesignTokens.fontMedium,
        color: baseColor,
        height: DesignTokens.leadingNone,
        letterSpacing: DesignTokens.trackingWider,
      ),
    );
  }
}
