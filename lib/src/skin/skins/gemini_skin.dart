import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// The default skin — current Gemini/Tailwind slate+cyan look.
///
/// All values are taken directly from the existing [DaniDesignTokens],
/// [GeminiTheme], and [AppColors] so this produces a pixel-identical result.
class GeminiSkin extends DaniSkin {
  const GeminiSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'gemini',
        name: 'Gemini',
        description: 'Modern, clean, tech-forward',
        previewColor: Color(0xFF06B6D4),
        category: SkinCategory.tech,
        tags: ['modern', 'clean', 'sans-serif', 'glass', 'cyan'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core
        primary: Color(0xFF06B6D4), // cyan-500
        primaryLight: Color(0xFF22D3EE), // cyan-400
        primaryDark: Color(0xFF0891B2), // cyan-600
        primaryForeground: Color(0xFF0F172A), // slate-900
        secondary: Color(0xFF14B8A6), // teal-500
        secondaryForeground: Color(0xFF0F172A),
        // Backgrounds (light)
        background: Color(0xFFF1F5F9), // slate-100
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF8FAFC), // slate-50
        // Backgrounds (dark)
        backgroundDark: Color(0xFF0D1B2A), // deep navy
        surfaceDark: Color(0xFF152326),
        surfaceDarkElevated: Color(0xFF1B2627),
        surfaceDarkVariant: Color(0xFF1E2D30),
        // Text (light)
        text: Color(0xFF0F172A), // slate-900
        textMuted: Color(0xFF475569), // slate-600
        textSubtle: Color(0xFF64748B), // slate-500
        textDisabled: Color(0xFF94A3B8), // slate-400
        // Text (dark)
        textDark: Color(0xFFFFFFFF),
        textDarkMuted: Color(0xFF9BB6BB),
        textDarkSubtle: Color(0xFF6B8A90),
        textDarkDisabled: Color(0xFF475569),
        // Borders (light)
        border: Color(0xFFE2E8F0), // slate-200
        borderSubtle: Color(0xFFF1F5F9), // slate-100
        borderStrong: Color(0xFFCBD5E1), // slate-300
        // Borders (dark)
        borderDark: Color(0xFF27373A),
        borderDarkSubtle: Color(0xFF1E2D30),
        borderDarkStrong: Color(0xFF3A5155),
        // Status
        success: Color(0xFF10B981),
        successLight: Color(0xFF34D399),
        successDark: Color(0xFF059669),
        warning: Color(0xFFF59E0B),
        warningLight: Color(0xFFFBBF24),
        warningDark: Color(0xFFD97706),
        error: Color(0xFFEF4444),
        errorLight: Color(0xFFF87171),
        errorDark: Color(0xFFDC2626),
        info: Color(0xFF3B82F6),
        infoLight: Color(0xFF60A5FA),
        infoDark: Color(0xFF2563EB),
        // Components (light)
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFFCBD5E1),
        inputBorderFocused: Color(0xFF06B6D4),
        buttonPrimary: Color(0xFF06B6D4),
        buttonPrimaryText: Color(0xFF0F172A),
        buttonSecondary: Color(0xFFE2E8F0),
        buttonSecondaryText: Color(0xFF0D9488),
        // Components (dark)
        inputBackgroundDark: Color(0xFF1E293B),
        inputBorderDark: Color(0xFF334155),
        inputBorderFocusedDark: Color(0xFF22D3EE),
        buttonPrimaryDark: Color(0xFF06B6D4),
        buttonPrimaryTextDark: Color(0xFF0F172A),
        buttonSecondaryDark: Color(0xFF334155),
        buttonSecondaryTextDark: Color(0xFF22D3EE),
        // Special
        shadow: Color(0x1A1E293B),
        shadowDark: Color(0x66000000),
        scrim: Color(0x661E293B),
        scrimDark: Color(0xB3000000),
        selection: Color(0x3306B6D4),
        selectionDark: Color(0x3322D3EE),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Inter',
        bodyFamily: 'Inter',
        monoFamily: 'JetBrains Mono',
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 12,
        buttonRadius: 8,
        inputRadius: 8,
        dialogRadius: 16,
        glassRadius: 20,
        glassPillRadius: 12,
        badgeRadius: 9999,
        photoRadius: 10,
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 12,
        cardGap: 8,
        sectionSpacing: 24,
        sectionHeaderBottomSpacing: 8,
        screenPaddingHorizontal: 16,
        buttonPaddingHorizontal: 32,
        buttonPaddingVertical: 16,
        dialogContentPadding: 24,
        timelineConnectorWidth: 2,
        timelineDotDiameter: 12,
        timelineLeftMargin: 40,
        tabBarLabelPadding: 16,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        appBarHeight: 56,
        buttonHeight: 48,
        buttonHeightSm: 36,
        iconSize: 24,
        iconSizeSm: 18,
        cardElevation: 0,
        cardBorderWidth: 1,
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        appBarStyle: AppBarVariant.solid,
        cardStyle: CardVariant.bordered,
        buttonVariant: ButtonVariant.filled,
        inputVariant: InputVariant.outlined,
        chipVariant: ChipVariant.filled,
        iconVariant: IconVariant.outlined,
        tabIndicatorVariant: TabIndicatorVariant.pill,
        showCardBorder: true,
        showCardShadow: true,
        showButtonShadow: false,
        tripCardOverlayOpacity: 0.4,
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF0EA5E9),
        train: Color(0xFF8B5CF6),
        car: Color(0xFFF59E0B),
        bus: Color(0xFFD97706),  // amber-600
        ferry: Color(0xFF0284C7),
        cruise: Color(0xFF0369A1),
        subway: Color(0xFF06B6D4),
        hotel: Color(0xFF14B8A6),
        restaurant: Color(0xFFF59E0B),
        activity: Color(0xFF10B981),
        attraction: Color(0xFF10B981),
        rental: Color(0xFFF59E0B),
      );

  @override
  SkinEffects get effects => SkinEffects(
        // Glass
        glassFillOpacityDark: 0.06,
        glassFillOpacityLight: 0.35,
        glassBorderOpacityDark: 0.15,
        glassBorderOpacityLight: 0.60,
        glassBorderWidth: 1.5,
        glassBlurSigma: 30,
        glassDialogFillOpacityDark: 0.08,
        glassDialogFillOpacityLight: 0.55,
        glassDialogBorderOpacityDark: 0.18,
        glassDialogBorderOpacityLight: 0.70,
        // Shadows (light)
        shadowSm: const [
          BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x10000000), blurRadius: 8, offset: Offset(0, 4)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x15000000), blurRadius: 16, offset: Offset(0, 8)),
        ],
        // Shadows (dark)
        shadowSmDark: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2)),
        ],
        shadowMdDark: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4)),
        ],
        shadowLgDark: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 16, offset: const Offset(0, 8)),
        ],
        // Glow
        glowPrimary: [
          BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.4), blurRadius: 20, spreadRadius: -4),
        ],
      );
}
