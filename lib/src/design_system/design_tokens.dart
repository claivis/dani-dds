// Design tokens inspired by shadcn/ui principles
// This file contains all design tokens for consistent theming

import 'package:flutter/material.dart';

/// Design tokens for consistent theming across the app
/// Inspired by shadcn/ui design system
class DesignTokens {
  // Private constructor to prevent instantiation
  DesignTokens._();

  // === COLORS ===
  
  // Primary colors
  static const Color primary = Color(0xFF0F172A); // slate-900
  static const Color primaryForeground = Color(0xFFF8FAFC); // slate-50
  
  // Secondary colors
  static const Color secondary = Color(0xFFF1F5F9); // slate-100
  static const Color secondaryForeground = Color(0xFF0F172A); // slate-900
  
  // Muted colors
  static const Color muted = Color(0xFFF8FAFC); // slate-50
  static const Color mutedForeground = Color(0xFF64748B); // slate-500
  
  // Accent colors
  static const Color accent = Color(0xFFF1F5F9); // slate-100
  static const Color accentForeground = Color(0xFF0F172A); // slate-900
  
  // Destructive colors
  static const Color destructive = Color(0xFFEF4444); // red-500
  static const Color destructiveForeground = Color(0xFFF8FAFC); // slate-50
  
  // Border colors
  static const Color border = Color(0xFFE2E8F0); // slate-200
  static const Color input = Color(0xFFE2E8F0); // slate-200
  
  // Background colors
  static const Color background = Color(0xFFFFFFFF); // white
  static const Color foreground = Color(0xFF0F172A); // slate-900
  
  // Card colors
  static const Color card = Color(0xFFFFFFFF); // white
  static const Color cardForeground = Color(0xFF0F172A); // slate-900
  
  // Popover colors
  static const Color popover = Color(0xFFFFFFFF); // white
  static const Color popoverForeground = Color(0xFF0F172A); // slate-900
  
  // Ring color
  static const Color ring = Color(0xFF0F172A); // slate-900
  
  // Chart colors
  static const Color chart1 = Color(0xFF3B82F6); // blue-500
  static const Color chart2 = Color(0xFF10B981); // emerald-500
  static const Color chart3 = Color(0xFFF59E0B); // amber-500
  static const Color chart4 = Color(0xFFEF4444); // red-500
  static const Color chart5 = Color(0xFF8B5CF6); // violet-500

  // === DARK MODE COLORS ===
  
  // Primary colors (dark)
  static const Color primaryDark = Color(0xFFF8FAFC); // slate-50
  static const Color primaryForegroundDark = Color(0xFF0F172A); // slate-900
  
  // Secondary colors (dark)
  static const Color secondaryDark = Color(0xFF1E293B); // slate-800
  static const Color secondaryForegroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Muted colors (dark)
  static const Color mutedDark = Color(0xFF1E293B); // slate-800
  static const Color mutedForegroundDark = Color(0xFF94A3B8); // slate-400
  
  // Accent colors (dark)
  static const Color accentDark = Color(0xFF1E293B); // slate-800
  static const Color accentForegroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Destructive colors (dark)
  static const Color destructiveDark = Color(0xFF7F1D1D); // red-900
  static const Color destructiveForegroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Border colors (dark)
  static const Color borderDark = Color(0xFF1E293B); // slate-800
  static const Color inputDark = Color(0xFF1E293B); // slate-800
  
  // Background colors (dark)
  static const Color backgroundDark = Color(0xFF0F172A); // slate-900
  static const Color foregroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Card colors (dark)
  static const Color cardDark = Color(0xFF0F172A); // slate-900
  static const Color cardForegroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Popover colors (dark)
  static const Color popoverDark = Color(0xFF0F172A); // slate-900
  static const Color popoverForegroundDark = Color(0xFFF8FAFC); // slate-50
  
  // Ring color (dark)
  static const Color ringDark = Color(0xFF1E293B); // slate-800

  // === SPACING ===
  
  static const double spacing0 = 0.0;
  static const double spacing1 = 4.0;
  static const double spacing2 = 8.0;
  static const double spacing3 = 12.0;
  static const double spacing4 = 16.0;
  static const double spacing5 = 20.0;
  static const double spacing6 = 24.0;
  static const double spacing8 = 32.0;
  static const double spacing10 = 40.0;
  static const double spacing12 = 48.0;
  static const double spacing16 = 64.0;
  static const double spacing20 = 80.0;
  static const double spacing24 = 96.0;
  static const double spacing32 = 128.0;

  // === BORDER RADIUS ===
  
  static const double radiusNone = 0.0;
  static const double radiusSm = 4.0;
  static const double radius = 8.0;
  static const double radiusMd = 10.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radius2xl = 20.0;
  static const double radius3xl = 24.0;
  static const double radiusFull = 9999.0;

  // === SHADOWS ===
  
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];
  
  static const List<BoxShadow> shadow = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  
  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x12000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];
  
  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x15000000),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];
  
  static const List<BoxShadow> shadowXl = [
    BoxShadow(
      color: Color(0x18000000),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  // === TYPOGRAPHY ===
  
  // Font sizes
  static const double textXs = 12.0;
  static const double textSm = 14.0;
  static const double textBase = 16.0;
  static const double textLg = 18.0;
  static const double textXl = 20.0;
  static const double text2xl = 24.0;
  static const double text3xl = 30.0;
  static const double text4xl = 36.0;
  static const double text5xl = 48.0;
  static const double text6xl = 60.0;
  static const double text7xl = 72.0;
  static const double text8xl = 96.0;
  static const double text9xl = 128.0;

  // Font weights
  static const FontWeight fontThin = FontWeight.w100;
  static const FontWeight fontExtralight = FontWeight.w200;
  static const FontWeight fontLight = FontWeight.w300;
  static const FontWeight fontNormal = FontWeight.w400;
  static const FontWeight fontMedium = FontWeight.w500;
  static const FontWeight fontSemibold = FontWeight.w600;
  static const FontWeight fontBold = FontWeight.w700;
  static const FontWeight fontExtrabold = FontWeight.w800;
  static const FontWeight fontBlack = FontWeight.w900;

  // Line heights
  static const double leadingNone = 1.0;
  static const double leadingTight = 1.25;
  static const double leadingSnug = 1.375;
  static const double leadingNormal = 1.5;
  static const double leadingRelaxed = 1.625;
  static const double leadingLoose = 2.0;

  // Letter spacing
  static const double trackingTighter = -0.05;
  static const double trackingTight = -0.025;
  static const double trackingNormal = 0.0;
  static const double trackingWide = 0.025;
  static const double trackingWider = 0.05;
  static const double trackingWidest = 0.1;

  // === ANIMATION ===
  
  // Durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  // Curves
  static const Curve curveEaseIn = Curves.easeIn;
  static const Curve curveEaseOut = Curves.easeOut;
  static const Curve curveEaseInOut = Curves.easeInOut;
  static const Curve curveLinear = Curves.linear;
  static const Curve curveFastOutSlowIn = Curves.fastOutSlowIn;
  static const Curve curveBounceIn = Curves.bounceIn;
  static const Curve curveBounceOut = Curves.bounceOut;
  static const Curve curveElasticIn = Curves.elasticIn;
  static const Curve curveElasticOut = Curves.elasticOut;
}
