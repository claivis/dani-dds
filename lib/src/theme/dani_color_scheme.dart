import 'package:flutter/material.dart';

/// Complete color scheme for a Dani theme
/// All themes must define these colors for consistency
class DaniColorScheme {
  // ==================== CORE COLORS ====================
  
  /// Main brand/accent color (buttons, links, highlights)
  final Color primary;
  
  /// Text/icons on primary color
  final Color onPrimary;
  
  /// Secondary accent color
  final Color secondary;
  
  /// Text/icons on secondary color
  final Color onSecondary;
  
  // ==================== BACKGROUNDS ====================
  
  /// Main app background
  final Color background;
  
  /// Text on background
  final Color onBackground;
  
  /// Cards, panels, elevated surfaces
  final Color surface;
  
  /// Text on surface
  final Color onSurface;
  
  /// Variant surface (for nested cards, secondary panels)
  final Color surfaceVariant;
  
  /// Text on surface variant
  final Color onSurfaceVariant;
  
  // ==================== BORDERS & DIVIDERS ====================
  
  /// Primary border color (thin lines, dividers)
  final Color outline;
  
  /// Secondary border color (lighter borders for nested elements)
  final Color outlineVariant;
  
  /// Tertiary border color (very light borders for panels within panels)
  final Color outlineTertiary;
  
  // ==================== TEXT COLORS ====================
  
  /// Primary text color (headings, important text)
  final Color textPrimary;
  
  /// Secondary text color (body text, descriptions)
  final Color textSecondary;
  
  /// Tertiary text color (captions, hints, less important)
  final Color textTertiary;
  
  /// Disabled text color
  final Color textDisabled;
  
  // ==================== STATUS COLORS ====================
  
  /// Success color (green, positive actions)
  final Color success;
  
  /// Text on success color
  final Color onSuccess;
  
  /// Error color (red, destructive actions)
  final Color error;
  
  /// Text on error color
  final Color onError;
  
  /// Warning color (yellow/amber, caution)
  final Color warning;
  
  /// Text on warning color
  final Color onWarning;
  
  /// Info color (blue, informational)
  final Color info;
  
  /// Text on info color
  final Color onInfo;
  
  // ==================== UI COMPONENT COLORS ====================
  
  /// Input field background
  final Color inputBackground;
  
  /// Input field border
  final Color inputBorder;
  
  /// Focused input field border
  final Color inputBorderFocused;
  
  /// Button primary background
  final Color buttonPrimary;
  
  /// Button primary text
  final Color buttonPrimaryText;
  
  /// Button secondary background
  final Color buttonSecondary;
  
  /// Button secondary text
  final Color buttonSecondaryText;
  
  // ==================== SPECIAL COLORS ====================
  
  /// Shadow color
  final Color shadow;
  
  /// Overlay/scrim color (for modals, dialogs)
  final Color scrim;
  
  /// Selection/highlight color
  final Color selection;
  
  /// Hover state color
  final Color hover;
  
  // Additional shadow variants for different opacity levels
  /// Light shadow (for subtle elevation)
  final Color shadowLight;
  
  /// Medium shadow (for standard elevation)
  final Color shadowMedium;
  
  /// Heavy shadow (for high elevation)
  final Color shadowHeavy;
  
  const DaniColorScheme({
    // Core
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    // Backgrounds
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    // Borders
    required this.outline,
    required this.outlineVariant,
    required this.outlineTertiary,
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    // Status
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    // Components
    required this.inputBackground,
    required this.inputBorder,
    required this.inputBorderFocused,
    required this.buttonPrimary,
    required this.buttonPrimaryText,
    required this.buttonSecondary,
    required this.buttonSecondaryText,
    // Special
    required this.shadow,
    required this.scrim,
    required this.selection,
    required this.hover,
    required this.shadowLight,
    required this.shadowMedium,
    required this.shadowHeavy,
  });

  /// Convert to Flutter's ColorScheme
  ColorScheme toFlutterColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
    );
  }
}

