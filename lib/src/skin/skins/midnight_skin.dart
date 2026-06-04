import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Dark luxury skin — serif headings, gold accent, editorial feel.
class MidnightSkin extends DaniSkin {
  const MidnightSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'midnight',
        name: 'Midnight',
        description: 'Upscale, editorial, luxury travel',
        previewColor: Color(0xFFD4A506),
        isPremium: false,
        category: SkinCategory.classic,
        tags: ['luxury', 'serif', 'gold', 'editorial', 'dark'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — warm gold accent
        primary: Color(0xFFD4A506),
        primaryLight: Color(0xFFEABF2E),
        primaryDark: Color(0xFFB08C05),
        primaryForeground: Color(0xFF0A0A0F),
        secondary: Color(0xFFC4956A),
        secondaryForeground: Color(0xFF0A0A0F),
        // Backgrounds (light) — warm gray
        background: Color(0xFFF5F3EF),
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF0ECE5),
        // Backgrounds (dark) — near-black with blue undertone
        backgroundDark: Color(0xFF0A0A0F),
        surfaceDark: Color(0xFF141418),
        surfaceDarkElevated: Color(0xFF1C1C22),
        surfaceDarkVariant: Color(0xFF1C1C22),
        // Text (light)
        text: Color(0xFF1A1A2E),
        textMuted: Color(0xFF4A4A5E),
        textSubtle: Color(0xFF6E6E82),
        textDisabled: Color(0xFF9E9EB0),
        // Text (dark)
        textDark: Color(0xFFF0ECE5),
        textDarkMuted: Color(0xFFB0A898),
        textDarkSubtle: Color(0xFF7A7268),
        textDarkDisabled: Color(0xFF4A4A5E),
        // Borders (light)
        border: Color(0xFFE0D8CC),
        borderSubtle: Color(0xFFF0ECE5),
        borderStrong: Color(0xFFCBC1B2),
        // Borders (dark)
        borderDark: Color(0xFF2A2A32),
        borderDarkSubtle: Color(0xFF1C1C22),
        borderDarkStrong: Color(0xFF3A3A42),
        // Status
        success: Color(0xFF4ADE80),
        successLight: Color(0xFF86EFAC),
        successDark: Color(0xFF22C55E),
        warning: Color(0xFFFBBF24),
        warningLight: Color(0xFFFDE68A),
        warningDark: Color(0xFFF59E0B),
        error: Color(0xFFF87171),
        errorLight: Color(0xFFFCA5A5),
        errorDark: Color(0xFFEF4444),
        info: Color(0xFFD4A506),
        infoLight: Color(0xFFEABF2E),
        infoDark: Color(0xFFB08C05),
        // Components (light)
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFFCBC1B2),
        inputBorderFocused: Color(0xFFD4A506),
        buttonPrimary: Color(0xFFD4A506),
        buttonPrimaryText: Color(0xFF0A0A0F),
        buttonSecondary: Color(0xFFE0D8CC),
        buttonSecondaryText: Color(0xFF6E5A2E),
        // Components (dark)
        inputBackgroundDark: Color(0xFF1C1C22),
        inputBorderDark: Color(0xFF2A2A32),
        inputBorderFocusedDark: Color(0xFFEABF2E),
        buttonPrimaryDark: Color(0xFFD4A506),
        buttonPrimaryTextDark: Color(0xFF0A0A0F),
        buttonSecondaryDark: Color(0xFF2A2A32),
        buttonSecondaryTextDark: Color(0xFFEABF2E),
        // Special
        shadow: Color(0x1A1A1A2E),
        shadowDark: Color(0x80000000),
        scrim: Color(0x661A1A2E),
        scrimDark: Color(0xCC000000),
        selection: Color(0x33D4A506),
        selectionDark: Color(0x33EABF2E),
        // Timeline
        timelineConnector: Color(0xFFE0D8CC),
        timelineConnectorDark: Color(0xFF2A2A32),
        timelineDot: Color(0xFFD4A506),
        timelineDotDark: Color(0xFFEABF2E),
        timelineDateHeader: Color(0xFF6E6E82),
        timelineDateHeaderDark: Color(0xFFB0A898),
        // Tab bar
        tabBarIndicator: Color(0xFFD4A506),
        tabBarIndicatorDark: Color(0xFFEABF2E),
        tabBarSelectedLabel: Color(0xFFD4A506),
        tabBarSelectedLabelDark: Color(0xFFEABF2E),
        tabBarUnselectedLabel: Color(0xFF6E6E82),
        tabBarUnselectedLabelDark: Color(0xFF7A7268),
        // Chat
        chatBubbleUser: Color(0xFFD4A506),
        chatBubbleUserDark: Color(0xFF6E5A2E),
        chatBubbleUserText: Color(0xFF0A0A0F),
        chatBubbleUserTextDark: Color(0xFFF0ECE5),
        chatBubbleAssistant: Color(0xFFF0ECE5),
        chatBubbleAssistantDark: Color(0xFF1C1C22),
        chatBubbleAssistantText: Color(0xFF1A1A2E),
        chatBubbleAssistantTextDark: Color(0xFFF0ECE5),
        // Shimmer
        shimmerBase: Color(0xFFF0ECE5),
        shimmerBaseDark: Color(0xFF1C1C22),
        shimmerHighlight: Color(0xFFF5F3EF),
        shimmerHighlightDark: Color(0xFF2A2A32),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Playfair Display',
        bodyFamily: 'Inter',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 1.02,
        headingScaleFactor: 1.15,
        bodyScaleFactor: 0.98,
        headingWeight: FontWeight.w700,
        headingLetterSpacing: -0.3,
        headingLineHeight: 1.15,
        bodyLineHeight: 1.6,
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 16,
        buttonRadius: 10,
        inputRadius: 10,
        dialogRadius: 20,
        glassRadius: 24,
        glassPillRadius: 14,
        badgeRadius: 9999,
        photoRadius: 12,
      );

  @override
  SkinEffects get effects => SkinEffects(
        glassFillOpacityDark: 0.10,
        glassFillOpacityLight: 0.40,
        glassBorderOpacityDark: 0.12,
        glassBorderOpacityLight: 0.50,
        glassBorderWidth: 1.0,
        glassBlurSigma: 35,
        glassDialogFillOpacityDark: 0.12,
        glassDialogFillOpacityLight: 0.60,
        glassDialogBorderOpacityDark: 0.15,
        glassDialogBorderOpacityLight: 0.60,
        shadowSm: const [
          BoxShadow(color: Color(0x0D000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 24, offset: Offset(0, 8)),
        ],
        shadowSmDark: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 6, offset: const Offset(0, 2)),
        ],
        shadowMdDark: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 12, offset: const Offset(0, 4)),
        ],
        shadowLgDark: [
          BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 24, offset: const Offset(0, 8)),
        ],
        glowPrimary: [
          BoxShadow(color: const Color(0xFFD4A506).withOpacity(0.3), blurRadius: 24, spreadRadius: -4),
        ],
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF7C9CBF),
        train: Color(0xFF8B7BA8),
        hotel: Color(0xFFC4956A),
        restaurant: Color(0xFFB88B6E),
        activity: Color(0xFF6A9E8E),
        attraction: Color(0xFF9E8E6A),
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 14,
        cardGap: 10,
        sectionSpacing: 28,
        buttonPaddingHorizontal: 36,
        buttonPaddingVertical: 18,
        dialogContentPadding: 28,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        buttonHeight: 52,
        appBarCenterTitle: true,
        cardElevation: 2,
        cardBorderWidth: 0.5,
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        cardStyle: CardVariant.elevated,
        buttonVariant: ButtonVariant.filled,
        chipVariant: ChipVariant.outlined,
        iconVariant: IconVariant.outlined,
        dialogVariant: DialogVariant.standard,
        tabIndicatorVariant: TabIndicatorVariant.underline,
        showCardBorder: false,
        showCardShadow: true,
        showButtonShadow: true,
        tripCardOverlayOpacity: 0.5,
      );
}
