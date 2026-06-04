// Dani Design System Tokens - New Design (2025)
// Now delegates to the active DaniSkin for all visual properties.
// Static fallbacks match the Gemini skin for backward compatibility.

import 'package:flutter/material.dart';
import '../skin/dani_skin.dart';

/// Design tokens for Dani app.
///
/// All color, radius, shadow, and glass methods now read from the active
/// [DaniSkin] via a static reference. This means every existing call site
/// (e.g. `DaniDesignTokens.primary`) automatically gets the skin's value.
///
/// The skin system calls [updateFromSkin] whenever the active skin changes.
class DaniDesignTokens {
  DaniDesignTokens._();

  /// The active skin. Set by the skin provider on startup and every switch.
  static DaniSkin? _activeSkin;

  /// Called by the skin system when the active skin changes.
  static void updateFromSkin(DaniSkin skin) {
    _activeSkin = skin;
  }

  // === PRIMARY COLORS ===

  static Color get primary => _activeSkin?.colors.primary ?? const Color(0xFF07B6D5);
  static Color get primaryLight => _activeSkin?.colors.primaryLight ?? const Color(0xFF22D3EE);
  static Color get primaryDark => _activeSkin?.colors.primaryDark ?? const Color(0xFF0891B2);
  static Color get primaryForeground => _activeSkin?.colors.primaryForeground ?? const Color(0xFFFFFFFF);

  // === DARK THEME COLORS ===

  static Color get backgroundDark => _activeSkin?.colors.backgroundDark ?? const Color(0xFF0D1B2A);
  static Color get surfaceDark => _activeSkin?.colors.surfaceDark ?? const Color(0xFF152326);
  static Color get surfaceDarkElevated => _activeSkin?.colors.surfaceDarkElevated ?? const Color(0xFF1B2627);
  static Color get surfaceDarkHighest => _activeSkin?.colors.surfaceDarkVariant ?? const Color(0xFF1E2D30);

  static Color get borderDark => _activeSkin?.colors.borderDark ?? const Color(0xFF27373A);
  static Color get borderDarkSubtle => _activeSkin?.colors.borderDarkSubtle ?? const Color(0xFF1E2D30);
  static Color get borderDarkStrong => _activeSkin?.colors.borderDarkStrong ?? const Color(0xFF3A5155);

  static Color get textDark => _activeSkin?.colors.textDark ?? const Color(0xFFFFFFFF);
  static Color get textDarkMuted => _activeSkin?.colors.textDarkMuted ?? const Color(0xFF9BB6BB);
  static Color get textDarkSubtle => _activeSkin?.colors.textDarkSubtle ?? const Color(0xFF6B8A90);

  // === LIGHT THEME COLORS ===

  static Color get backgroundLight => _activeSkin?.colors.background ?? const Color(0xFFDDE5F0);
  static Color get surfaceLight => _activeSkin?.colors.surface ?? const Color(0xFFF8FAFA);
  static Color get surfaceLightElevated => _activeSkin?.colors.surfaceElevated ?? const Color(0xFFFFFFFF);

  static Color get borderLight => _activeSkin?.colors.border ?? const Color(0xFFE2E8F0);
  static Color get borderLightSubtle => _activeSkin?.colors.borderSubtle ?? const Color(0xFFF1F5F9);
  static Color get borderLightStrong => _activeSkin?.colors.borderStrong ?? const Color(0xFFCBD5E1);

  static Color get textLight => _activeSkin?.colors.text ?? const Color(0xFF0F172A);
  static Color get textLightMuted => _activeSkin?.colors.textMuted ?? const Color(0xFF64748B);
  static Color get textLightSubtle => _activeSkin?.colors.textSubtle ?? const Color(0xFF94A3B8);

  // === STATUS COLORS ===

  static Color get success => _activeSkin?.colors.success ?? const Color(0xFF10B981);
  static Color get successLight => _activeSkin?.colors.successLight ?? const Color(0xFF34D399);
  static Color get successDark => _activeSkin?.colors.successDark ?? const Color(0xFF059669);

  static Color get warning => _activeSkin?.colors.warning ?? const Color(0xFFF59E0B);
  static Color get warningLight => _activeSkin?.colors.warningLight ?? const Color(0xFFFBBF24);
  static Color get warningDark => _activeSkin?.colors.warningDark ?? const Color(0xFFD97706);

  static Color get error => _activeSkin?.colors.error ?? const Color(0xFFEF4444);
  static Color get errorLight => _activeSkin?.colors.errorLight ?? const Color(0xFFF87171);
  static Color get errorDark => _activeSkin?.colors.errorDark ?? const Color(0xFFDC2626);

  static Color get info => _activeSkin?.colors.info ?? const Color(0xFF3B82F6);
  static Color get infoLight => _activeSkin?.colors.infoLight ?? const Color(0xFF60A5FA);
  static Color get infoDark => _activeSkin?.colors.infoDark ?? const Color(0xFF2563EB);

  // === SPACING (unchanged — layout, not visual identity) ===

  static const double space0 = 0.0;
  static const double space1 = 4.0;
  static const double space2 = 8.0;
  static const double space3 = 12.0;
  static const double space4 = 16.0;
  static const double space5 = 20.0;
  static const double space6 = 24.0;
  static const double space8 = 32.0;
  static const double space10 = 40.0;
  static const double space12 = 48.0;
  static const double space16 = 64.0;
  static const double space20 = 80.0;
  static const double space24 = 96.0;

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

  /// Glass panel radius — reads from active skin.
  static double get radiusGlass => _activeSkin?.shape.glassRadius ?? 20.0;

  /// Compact glass pill radius — reads from active skin.
  static double get radiusGlassPill => _activeSkin?.shape.glassPillRadius ?? 12.0;

  // === SHADOWS ===

  static List<BoxShadow> get shadowSmDark =>
      _activeSkin?.effects.shadowSmDark ?? [
        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2)),
      ];

  static List<BoxShadow> get shadowMdDark =>
      _activeSkin?.effects.shadowMdDark ?? [
        BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
      ];

  static List<BoxShadow> get shadowLgDark =>
      _activeSkin?.effects.shadowLgDark ?? [
        BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 16, offset: const Offset(0, 8)),
      ];

  static List<BoxShadow> get glowPrimary =>
      _activeSkin?.effects.glowPrimary ?? [
        BoxShadow(color: primary.withOpacity(0.4), blurRadius: 20, spreadRadius: -4),
      ];

  static List<BoxShadow> get shadowSmLight =>
      _activeSkin?.effects.shadowSm ?? const [
        BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 2)),
      ];

  static List<BoxShadow> get shadowMdLight =>
      _activeSkin?.effects.shadowMd ?? const [
        BoxShadow(color: Color(0x10000000), blurRadius: 8, offset: Offset(0, 4)),
      ];

  static List<BoxShadow> get shadowLgLight =>
      _activeSkin?.effects.shadowLg ?? const [
        BoxShadow(color: Color(0x15000000), blurRadius: 16, offset: Offset(0, 8)),
      ];

  // === LIQUID GLASS ===

  static Color glassFill(bool isDark) =>
      _activeSkin?.effects.glassFill(isDark) ??
      (isDark ? Colors.white.withOpacity(0.06) : Colors.white.withOpacity(0.35));

  static Color glassBorder(bool isDark) =>
      _activeSkin?.effects.glassBorder(isDark) ??
      (isDark ? Colors.white.withOpacity(0.15) : Colors.white.withOpacity(0.6));

  static double get glassBorderWidth => _activeSkin?.effects.glassBorderWidth ?? 1.5;

  static Color glassDialogFill(bool isDark) =>
      _activeSkin?.effects.glassDialogFill(isDark) ??
      (isDark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.55));

  static Color glassDialogBorder(bool isDark) =>
      _activeSkin?.effects.glassDialogBorder(isDark) ??
      (isDark ? Colors.white.withOpacity(0.18) : Colors.white.withOpacity(0.7));

  // Legacy glassmorphism aliases
  static Color get glassDark => surfaceDark.withOpacity(0.8);
  static Color get glassLight => surfaceLight.withOpacity(0.8);
  static Color get glassBorderDarkLegacy => borderDark.withOpacity(0.5);
  static Color get glassBorderLightLegacy => borderLight.withOpacity(0.5);

  // === TYPOGRAPHY SIZES (unchanged — DaniType handles scaling) ===

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

  // === BREAKPOINTS (unchanged — layout) ===

  static const double breakpointSm = 640.0;
  static const double breakpointMd = 768.0;
  static const double breakpointLg = 1024.0;
  static const double breakpointXl = 1280.0;
  static const double breakpoint2xl = 1536.0;

  // === ANIMATION ===

  static Duration get durationFast => _activeSkin?.effects.durationFast ?? const Duration(milliseconds: 150);
  static Duration get durationNormal => _activeSkin?.effects.durationNormal ?? const Duration(milliseconds: 300);
  static Duration get durationSlow => _activeSkin?.effects.durationSlow ?? const Duration(milliseconds: 500);

  static Curve get curveDefault => _activeSkin?.effects.curveDefault ?? Curves.easeInOut;
  static Curve get curveSpring => _activeSkin?.effects.curveSpring ?? Curves.elasticOut;
  static Curve get curveSmooth => _activeSkin?.effects.curveSmooth ?? Curves.fastOutSlowIn;

  // === SHAPE (from active skin) ===

  static double get cardRadius => _activeSkin?.shape.cardRadius ?? 12.0;
  static double get buttonRadius => _activeSkin?.shape.buttonRadius ?? 8.0;
  static double get inputRadius => _activeSkin?.shape.inputRadius ?? 8.0;
  static double get dialogRadius => _activeSkin?.shape.dialogRadius ?? 16.0;
  static double get badgeRadius => _activeSkin?.shape.badgeRadius ?? 9999.0;
  static double get photoRadius => _activeSkin?.shape.photoRadius ?? 10.0;
  static double get chipRadius => _activeSkin?.shape.chipRadius ?? 9999.0;
  static double get menuRadius => _activeSkin?.shape.menuRadius ?? 12.0;
  static double get bannerRadius => _activeSkin?.shape.bannerRadius ?? 12.0;
  static double get snackbarRadius => _activeSkin?.shape.snackbarRadius ?? 8.0;
  static double get fabRadius => _activeSkin?.shape.fabRadius ?? 16.0;
  static double get tabIndicatorRadius => _activeSkin?.shape.tabIndicatorRadius ?? 2.0;
  static double get searchBarRadius => _activeSkin?.shape.searchBarRadius ?? 9999.0;
  static double get bottomSheetRadius => _activeSkin?.shape.bottomSheetRadius ?? 20.0;
  static double? get cardInnerRadius => _activeSkin?.shape.cardInnerRadius;

  // === SPACING (from active skin) ===

  static double get skinCardPadding => _activeSkin?.spacing.cardContentPadding ?? 12.0;
  static double get skinCardGap => _activeSkin?.spacing.cardGap ?? 8.0;
  static double get skinSectionSpacing => _activeSkin?.spacing.sectionSpacing ?? 24.0;
  static double get skinSectionHeaderBottom => _activeSkin?.spacing.sectionHeaderBottomSpacing ?? 8.0;
  static double get skinScreenPaddingH => _activeSkin?.spacing.screenPaddingHorizontal ?? 16.0;
  static double get skinTimelineConnectorWidth => _activeSkin?.spacing.timelineConnectorWidth ?? 2.0;
  static double get skinTimelineDotDiameter => _activeSkin?.spacing.timelineDotDiameter ?? 12.0;
  static double get skinTimelineLeftMargin => _activeSkin?.spacing.timelineLeftMargin ?? 40.0;
  static double get skinTimelineDateHeaderSpacing => _activeSkin?.spacing.timelineDateHeaderSpacing ?? 12.0;
  static double get skinTabLabelPadding => _activeSkin?.spacing.tabBarLabelPadding ?? 16.0;
  static double get skinDialogPadding => _activeSkin?.spacing.dialogContentPadding ?? 24.0;

  // === SIZING (from active skin) ===

  static double get skinAppBarHeight => _activeSkin?.sizing.appBarHeight ?? 56.0;
  static double get skinButtonHeight => _activeSkin?.sizing.buttonHeight ?? 48.0;
  static double get skinButtonHeightSm => _activeSkin?.sizing.buttonHeightSm ?? 36.0;
  static double get skinIconSize => _activeSkin?.sizing.iconSize ?? 24.0;
  static double get skinIconSizeSm => _activeSkin?.sizing.iconSizeSm ?? 18.0;
  static double get skinAvatarSize => _activeSkin?.sizing.avatarSize ?? 40.0;
  static double get skinCardBorderWidth => _activeSkin?.sizing.cardBorderWidth ?? 1.0;
  static double get skinDividerThickness => _activeSkin?.sizing.dividerThickness ?? 1.0;

  // === TYPOGRAPHY (from active skin) ===

  static String get headingFamily => _activeSkin?.typography.headingFamily ?? 'Inter';
  static String get bodyFamily => _activeSkin?.typography.bodyFamily ?? 'Inter';
  static String get monoFamily => _activeSkin?.typography.monoFamily ?? 'JetBrains Mono';
  static double get typographyScale => _activeSkin?.typography.scaleFactor ?? 1.0;
  static double get headingScale => _activeSkin?.typography.headingScaleFactor ?? _activeSkin?.typography.scaleFactor ?? 1.0;
  static double get bodyScale => _activeSkin?.typography.bodyScaleFactor ?? _activeSkin?.typography.scaleFactor ?? 1.0;
  static FontWeight get headingWeight => _activeSkin?.typography.headingWeight ?? FontWeight.w700;
  static FontWeight get titleWeight => _activeSkin?.typography.titleWeight ?? FontWeight.w600;
  static FontWeight get bodyWeight => _activeSkin?.typography.bodyWeight ?? FontWeight.w400;
  static FontWeight get labelWeight => _activeSkin?.typography.labelWeight ?? FontWeight.w500;

  // === COMPONENT STYLES (from active skin) ===

  static bool get showCardBorder => _activeSkin?.componentStyles.showCardBorder ?? true;
  static bool get showCardShadow => _activeSkin?.componentStyles.showCardShadow ?? true;
  static bool get showButtonShadow => _activeSkin?.componentStyles.showButtonShadow ?? false;

  // === HELPER METHODS ===

  static Color background(bool isDark) => _activeSkin?.colors.bg(isDark) ?? (isDark ? backgroundDark : backgroundLight);
  static Color surface(bool isDark) => _activeSkin?.colors.surf(isDark) ?? (isDark ? surfaceDark : surfaceLight);
  static Color surfaceElevated(bool isDark) => _activeSkin?.colors.surfElevated(isDark) ?? (isDark ? surfaceDarkElevated : surfaceLightElevated);
  static Color border(bool isDark) => _activeSkin?.colors.brd(isDark) ?? (isDark ? borderDark : borderLight);
  static Color text(bool isDark) => _activeSkin?.colors.txt(isDark) ?? (isDark ? textDark : textLight);
  static Color textMuted(bool isDark) => _activeSkin?.colors.txtMuted(isDark) ?? (isDark ? textDarkMuted : textLightMuted);
  static Color textSubtle(bool isDark) => _activeSkin?.colors.txtSubtle(isDark) ?? (isDark ? textDarkSubtle : textLightSubtle);
}
