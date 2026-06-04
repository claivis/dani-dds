import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'dani_color_scheme.dart';

/// Gemini Theme - Tailwind slate/cyan palette
/// Design system with slate/cyan/teal colors
///
/// Font: Inter (bundled locally in assets/fonts/)
/// Primary accent: Cyan (#06B6D4 light, #22D3EE dark)
/// Secondary: Teal (#14B8A6 / #0D9488)
class GeminiTheme {
  GeminiTheme._();

  /// CJK + multilingual font fallbacks.
  /// On native platforms the OS handles fallback automatically.
  /// On Flutter web (CanvasKit), we must provide explicit fallbacks
  /// for scripts not covered by Inter (Latin/Cyrillic only).
  /// Uses string literals instead of GoogleFonts.notoSansXxx() to avoid
  /// blocking the event loop on startup (root cause of slow page load).
  static List<String> get _fontFallbacks {
    if (!kIsWeb) return const [];
    return const [
      'Noto Sans',
      'Noto Sans JP',
      'Noto Sans KR',
      'Noto Sans SC',
      'Noto Sans TC',
      'Noto Sans Arabic',
      'Noto Sans Thai',
      'Noto Sans Devanagari',
    ];
  }

  // ==================== LIGHT MODE ====================
  // Matches: bg-slate-100 dark:bg-slate-900, text-slate-800 dark:text-slate-100
  
  static const DaniColorScheme light = DaniColorScheme(
    // Core - Cyan/Teal accents (buttons and highlights)
    primary: Color(0xFF06B6D4),      // cyan-500 (main CTA buttons)
    onPrimary: Color(0xFF0F172A),    // slate-900 text on cyan (matches "bg-cyan-500 text-slate-900")
    secondary: Color(0xFF14B8A6),    // teal-500
    onSecondary: Color(0xFF0F172A),  // slate-900
    
    // Backgrounds - slate-100 app background, white cards
    background: Color(0xFFF1F5F9),   // slate-100 body (from "bg-slate-100 dark:bg-slate-900")
    onBackground: Color(0xFF1E293B), // slate-800 primary text
    surface: Color(0xFFFFFFFF),      // white cards (from "bg-white dark:bg-slate-800")
    onSurface: Color(0xFF1E293B),    // slate-800 card text
    surfaceVariant: Color(0xFFF8FAFC), // slate-50 for panels
    onSurfaceVariant: Color(0xFF475569), // slate-600 secondary text
    
    // Borders & dividers - slate shades
    outline: Color(0xFFCBD5E1),      // slate-300 borders (from "border-slate-300 dark:border-slate-700")
    outlineVariant: Color(0xFFE2E8F0), // slate-200 subtle borders
    outlineTertiary: Color(0xFFF1F5F9), // slate-100
    
    // Text colors - slate scale
    textPrimary: Color(0xFF0F172A),  // slate-900 (from "text-slate-900 dark:text-slate-100")
    textSecondary: Color(0xFF475569), // slate-600 (from "text-slate-600 dark:text-slate-300")
    textTertiary: Color(0xFF64748B),  // slate-500 (from "text-slate-500 dark:text-slate-400")
    textDisabled: Color(0xFF94A3B8),  // slate-400
    
    // Status colors - Tailwind defaults
    success: Color(0xFF10B981),      // emerald-500
    onSuccess: Color(0xFFFFFFFF),
    error: Color(0xFFDC2626),        // red-600 (from "text-red-600 dark:text-red-400")
    onError: Color(0xFFFFFFFF),
    warning: Color(0xFFF59E0B),      // amber-500
    onWarning: Color(0xFF0F172A),
    info: Color(0xFF06B6D4),         // cyan-500
    onInfo: Color(0xFF0F172A),
    
    // Component colors - inputs and buttons
    inputBackground: Color(0xFFFFFFFF), // white input fields
    inputBorder: Color(0xFFCBD5E1),    // slate-300 (from "border-2 border-slate-300")
    inputBorderFocused: Color(0xFF06B6D4), // cyan-500 focus ring
    buttonPrimary: Color(0xFF06B6D4),  // cyan-500 (from "bg-cyan-500")
    buttonPrimaryText: Color(0xFF0F172A), // slate-900 (from "text-slate-900")
    buttonSecondary: Color(0xFFE2E8F0), // slate-200 (from "bg-slate-200")
    buttonSecondaryText: Color(0xFF0D9488), // teal-600 (from "text-cyan-700")
    
    // Special effects - shadows and overlays
    shadow: Color(0x1A1E293B),       // 10% slate-800
    scrim: Color(0x661E293B),        // 40% slate-800
    selection: Color(0x3306B6D4),    // 20% cyan-500
    hover: Color(0x1406B6D4),        // 8% cyan-500 (from hover effects)
    shadowLight: Color(0x0D1E293B),  // subtle shadow for cards
    shadowMedium: Color(0x331E293B), // medium shadow (from "shadow-lg")
    shadowHeavy: Color(0x991E293B),  // heavy shadow
  );

  // ==================== DARK MODE ====================
  // Matches: dark:bg-slate-900, dark:text-slate-100
  
  static const DaniColorScheme dark = DaniColorScheme(
    // Core - Brighter cyan/teal for dark mode
    primary: Color(0xFF22D3EE),      // cyan-400 (from "dark:border-cyan-400")
    onPrimary: Color(0xFF0F172A),    // slate-900 text (maintains contrast)
    secondary: Color(0xFF14B8A6),    // teal-500 (from "dark:to-teal-500")
    onSecondary: Color(0xFF0F172A),
    
    // Backgrounds - dark slate
    background: Color(0xFF0F172A),   // slate-900 body (from "dark:bg-slate-900")
    onBackground: Color(0xFFF1F5F9), // slate-100 text (from "dark:text-slate-100")
    surface: Color(0xFF1E293B),      // slate-800 cards (from "dark:bg-slate-800")
    onSurface: Color(0xFFF1F5F9),    // slate-100 card text
    surfaceVariant: Color(0xFF334155), // slate-700 panels
    onSurfaceVariant: Color(0xFF94A3B8), // slate-400 secondary text
    
    // Borders - darker slate shades
    outline: Color(0xFF334155),      // slate-700 (from "dark:border-slate-700")
    outlineVariant: Color(0xFF475569), // slate-600
    outlineTertiary: Color(0xFF1E293B), // slate-800
    
    // Text colors - light slate for dark background
    textPrimary: Color(0xFFF1F5F9),  // slate-100 (from "dark:text-slate-100")
    textSecondary: Color(0xFF94A3B8), // slate-400 (from "dark:text-slate-400")
    textTertiary: Color(0xFF64748B),  // slate-500 (from "dark:text-slate-500")
    textDisabled: Color(0xFF475569),  // slate-600
    
    // Status colors - adjusted for dark mode
    success: Color(0xFF10B981),      // emerald-500
    onSuccess: Color(0xFF0F172A),
    error: Color(0xFFF87171),        // red-400 (from "dark:text-red-400")
    onError: Color(0xFF0F172A),
    warning: Color(0xFFFBBF24),      // amber-400
    onWarning: Color(0xFF0F172A),
    info: Color(0xFF22D3EE),         // cyan-400
    onInfo: Color(0xFF0F172A),
    
    // Component colors - dark variants
    inputBackground: Color(0xFF1E293B), // slate-800 (from "dark:bg-slate-800")
    inputBorder: Color(0xFF334155),     // slate-700 (from "dark:border-slate-700")
    inputBorderFocused: Color(0xFF22D3EE), // cyan-400
    buttonPrimary: Color(0xFF06B6D4),   // cyan-500 (keeps vibrant in dark)
    buttonPrimaryText: Color(0xFF0F172A), // slate-900
    buttonSecondary: Color(0xFF334155), // slate-700 (from "dark:bg-slate-700")
    buttonSecondaryText: Color(0xFF22D3EE), // cyan-400 (from "dark:text-cyan-200")
    
    // Special effects
    shadow: Color(0x66000000),       // 40% black shadow
    scrim: Color(0xB3000000),        // 70% black scrim
    selection: Color(0x3322D3EE),    // 20% cyan-400
    hover: Color(0x1422D3EE),        // 8% cyan-400
    shadowLight: Color(0x33000000),
    shadowMedium: Color(0x66000000),
    shadowHeavy: Color(0x99000000),
  );

  // ==================== THEME DATA GENERATORS ====================
  
  /// Generate complete ThemeData for light mode
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      visualDensity: VisualDensity.compact,
      
      // Core color scheme
      colorScheme: ColorScheme.light(
        primary: light.primary,
        onPrimary: light.onPrimary,
        secondary: light.secondary,
        onSecondary: light.onSecondary,
        tertiary: light.secondary,
        onTertiary: light.onSecondary,
        error: light.error,
        onError: light.onError,
        surface: light.surface,
        onSurface: light.onSurface,
        surfaceContainerHighest: light.surfaceVariant,
        onSurfaceVariant: light.onSurfaceVariant,
        outline: light.outline,
        outlineVariant: light.outlineVariant,
        shadow: light.shadow,
        scrim: light.scrim,
      ),
      
      // Typography - Inter font family
      // Inter font bundled locally in assets/fonts/
      fontFamily: 'Inter',
      fontFamilyFallback: _fontFallbacks,

      // Text theme - matching Inter weights used in React app
      textTheme: const TextTheme(
        // Display - large titles (text-4xl md:text-5xl font-extrabold)
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800, // extrabold
          height: 1.1,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        
        // Headings
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700, // bold
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700, // bold (from "text-2xl font-bold")
          height: 1.3,
        ),
        
        // Titles
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700, // bold (from "font-bold text-lg")
          height: 1.4,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600, // semibold
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600, // semibold (from "text-sm font-semibold")
          height: 1.4,
        ),
        
        // Body text
        bodyLarge: TextStyle(
          fontSize: 18, // text-lg (from "text-lg")
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 14, // text-sm (from "text-sm")
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        
        // Labels
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700, // font-bold for buttons
          height: 1.3,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500, // medium
          height: 1.3,
        ),
        labelSmall: TextStyle(
          fontSize: 12, // text-xs (from "text-xs")
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),
      
      // Card theme - white cards with border and shadow
      cardTheme: CardThemeData(
        color: light.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // rounded-lg
          side: BorderSide(color: light.outline, width: 1),
        ),
        margin: const EdgeInsets.all(0),
      ),
      
      // Input decoration - Gemini input styling
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: light.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // rounded-lg
          borderSide: BorderSide(color: light.inputBorder, width: 2), // border-2
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: light.inputBorder, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: light.inputBorderFocused, width: 2), // focus:ring-2 focus:ring-cyan-500
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: light.error, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16), // p-4
      ),
      
      // Elevated button theme - matching cyan primary buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: light.buttonPrimary,
          foregroundColor: light.buttonPrimaryText,
          elevation: 0,
          shadowColor: light.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // rounded-lg
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // px-8 py-4
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700, // font-bold
          ),
        ),
      ),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: light.background,
        foregroundColor: light.onBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700, // font-bold
          color: light.onBackground,
        ),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: light.outline,
        thickness: 1,
        space: 1,
      ),
      
      // Icon theme
      iconTheme: IconThemeData(
        color: light.primary,
        size: 24,
      ),
    );
  }
  
  /// Generate complete ThemeData for dark mode
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.compact,
      
      // Core color scheme
      colorScheme: ColorScheme.dark(
        primary: dark.primary,
        onPrimary: dark.onPrimary,
        secondary: dark.secondary,
        onSecondary: dark.onSecondary,
        tertiary: dark.secondary,
        onTertiary: dark.onSecondary,
        error: dark.error,
        onError: dark.onError,
        surface: dark.surface,
        onSurface: dark.onSurface,
        surfaceContainerHighest: dark.surfaceVariant,
        onSurfaceVariant: dark.onSurfaceVariant,
        outline: dark.outline,
        outlineVariant: dark.outlineVariant,
        shadow: dark.shadow,
        scrim: dark.scrim,
      ),
      
      // Typography - Inter font family
      fontFamily: 'Inter',
      fontFamilyFallback: _fontFallbacks,

      // Text theme - same as light mode (colors auto-adjusted by color scheme)
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          height: 1.1,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          height: 1.1,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.4,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 1.3,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),
      
      // Card theme - dark slate cards
      cardTheme: CardThemeData(
        color: dark.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: dark.outline, width: 1),
        ),
        margin: const EdgeInsets.all(0),
      ),
      
      // Input decoration - dark mode
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: dark.inputBorder, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: dark.inputBorder, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: dark.inputBorderFocused, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: dark.error, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: dark.buttonPrimary,
          foregroundColor: dark.buttonPrimaryText,
          elevation: 0,
          shadowColor: dark.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: dark.background,
        foregroundColor: dark.onBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: dark.onBackground,
        ),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: dark.outline,
        thickness: 1,
        space: 1,
      ),
      
      // Icon theme
      iconTheme: IconThemeData(
        color: dark.primary,
        size: 24,
      ),
    );
  }
}

