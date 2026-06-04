import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Vibrant, festival-inspired skin — hot pink + cyan neon, geometric feel.
class NeonSkin extends DaniSkin {
  const NeonSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'neon',
        name: 'Neon',
        description: 'Vibrant, festival, nightlife energy',
        previewColor: Color(0xFFFF3B7A),
        isPremium: false,
        previewColorSecondary: Color(0xFF00D4AA),
        category: SkinCategory.bold,
        tags: ['vibrant', 'neon', 'pink', 'cyan', 'festival', 'glow'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — hot pink
        primary: Color(0xFFFF3B7A),
        primaryLight: Color(0xFFFF6B9D),
        primaryDark: Color(0xFFE0205A),
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFF00D4AA),
        secondaryForeground: Color(0xFF111117),
        // Backgrounds (light) — light lavender
        background: Color(0xFFF0ECFF),
        surface: Color(0xFFFAF8FF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFE8E2FF),
        // Backgrounds (dark) — deep purple-black
        backgroundDark: Color(0xFF111117),
        surfaceDark: Color(0xFF1A1A24),
        surfaceDarkElevated: Color(0xFF222230),
        surfaceDarkVariant: Color(0xFF222230),
        // Text (light)
        text: Color(0xFF1A1A2E),
        textMuted: Color(0xFF4E4E6A),
        textSubtle: Color(0xFF6E6E8A),
        textDisabled: Color(0xFF9E9EB0),
        // Text (dark)
        textDark: Color(0xFFF0ECFF),
        textDarkMuted: Color(0xFFB0A8D0),
        textDarkSubtle: Color(0xFF7A72A0),
        textDarkDisabled: Color(0xFF4E4E6A),
        // Borders (light)
        border: Color(0xFFD8D0F0),
        borderSubtle: Color(0xFFE8E2FF),
        borderStrong: Color(0xFFC0B8E0),
        // Borders (dark)
        borderDark: Color(0xFF2E2E40),
        borderDarkSubtle: Color(0xFF222230),
        borderDarkStrong: Color(0xFF3E3E52),
        // Status
        success: Color(0xFF00D4AA),
        successLight: Color(0xFF33EACC),
        successDark: Color(0xFF00B894),
        warning: Color(0xFFFFBB33),
        warningLight: Color(0xFFFFD166),
        warningDark: Color(0xFFE6A020),
        error: Color(0xFFFF3B7A),
        errorLight: Color(0xFFFF6B9D),
        errorDark: Color(0xFFE0205A),
        info: Color(0xFF5B7FFF),
        infoLight: Color(0xFF8BA3FF),
        infoDark: Color(0xFF3B5FDF),
        // Components (light)
        inputBackground: Color(0xFFFAF8FF),
        inputBorder: Color(0xFFC0B8E0),
        inputBorderFocused: Color(0xFFFF3B7A),
        buttonPrimary: Color(0xFFFF3B7A),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFE8E2FF),
        buttonSecondaryText: Color(0xFFFF3B7A),
        // Components (dark)
        inputBackgroundDark: Color(0xFF1A1A24),
        inputBorderDark: Color(0xFF2E2E40),
        inputBorderFocusedDark: Color(0xFFFF6B9D),
        buttonPrimaryDark: Color(0xFFFF3B7A),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF2E2E40),
        buttonSecondaryTextDark: Color(0xFFFF6B9D),
        // Special
        shadow: Color(0x1A1A1A2E),
        shadowDark: Color(0x80000000),
        scrim: Color(0x661A1A2E),
        scrimDark: Color(0xCC000000),
        selection: Color(0x33FF3B7A),
        selectionDark: Color(0x33FF6B9D),
        // Timeline
        timelineConnector: Color(0xFF3A3A50),
        timelineConnectorDark: Color(0xFF3A3A50),
        timelineDot: Color(0xFFFF3B7A),
        timelineDotDark: Color(0xFFFF6B9D),
        timelineDateHeader: Color(0xFF6E6E82),
        timelineDateHeaderDark: Color(0xFF9E9EB0),
        // Tab bar
        tabBarIndicator: Color(0xFFFF3B7A),
        tabBarIndicatorDark: Color(0xFFFF6B9D),
        tabBarSelectedLabel: Color(0xFFFF3B7A),
        tabBarSelectedLabelDark: Color(0xFFFF6B9D),
        tabBarUnselectedLabel: Color(0xFF6E6E82),
        tabBarUnselectedLabelDark: Color(0xFF9E9EB0),
        // Chat
        chatBubbleUser: Color(0xFFFF3B7A),
        chatBubbleUserDark: Color(0xFF8B1A48),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFF0ECE5),
        chatBubbleAssistant: Color(0xFF1E1E2E),
        chatBubbleAssistantDark: Color(0xFF2E2E40),
        chatBubbleAssistantText: Color(0xFFF0ECE5),
        chatBubbleAssistantTextDark: Color(0xFFF0ECE5),
        // Shimmer
        shimmerBase: Color(0xFF1E1E2E),
        shimmerBaseDark: Color(0xFF1E1E2E),
        shimmerHighlight: Color(0xFF2E2E40),
        shimmerHighlightDark: Color(0xFF2E2E40),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Space Grotesk',
        bodyFamily: 'Inter',
        monoFamily: 'JetBrains Mono',
        headingWeight: FontWeight.w700,
        headingLetterSpacing: -0.5,
        headingLineHeight: 1.15,
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 8,
        buttonRadius: 8,
        inputRadius: 8,
        dialogRadius: 12,
        glassRadius: 16,
        glassPillRadius: 8,
        badgeRadius: 9999,
        photoRadius: 8,
      );

  @override
  SkinEffects get effects => SkinEffects(
        glassFillOpacityDark: 0.08,
        glassFillOpacityLight: 0.30,
        glassBorderOpacityDark: 0.20,
        glassBorderOpacityLight: 0.50,
        glassBorderWidth: 1.5,
        glassBlurSigma: 40,
        glassDialogFillOpacityDark: 0.10,
        glassDialogFillOpacityLight: 0.50,
        glassDialogBorderOpacityDark: 0.22,
        glassDialogBorderOpacityLight: 0.65,
        shadowSm: const [
          BoxShadow(color: Color(0x0D000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 10, offset: Offset(0, 4)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 20, offset: Offset(0, 8)),
        ],
        shadowSmDark: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 4, offset: const Offset(0, 2)),
        ],
        shadowMdDark: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 4)),
        ],
        shadowLgDark: [
          BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 20, offset: const Offset(0, 8)),
        ],
        // Multi-color neon glow
        glowPrimary: [
          BoxShadow(color: const Color(0xFFFF3B7A).withOpacity(0.35), blurRadius: 24, spreadRadius: -4),
          BoxShadow(color: const Color(0xFF00D4AA).withOpacity(0.15), blurRadius: 40, spreadRadius: -8),
        ],
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF5B7FFF),
        train: Color(0xFFBB6BD9),
        hotel: Color(0xFF00D4AA),
        restaurant: Color(0xFFFF6B9D),
        activity: Color(0xFFFFBB33),
        attraction: Color(0xFFBB6BD9),
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 14,
        cardGap: 10,
        buttonPaddingHorizontal: 28,
        buttonPaddingVertical: 14,
        sectionSpacing: 20,
        chipPaddingHorizontal: 14,
        chipPaddingVertical: 6,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        buttonHeight: 48,
        cardBorderWidth: 1.5,
        borderWidth: 1.5,
        fabSize: 60,
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        cardStyle: CardVariant.glass,
        buttonVariant: ButtonVariant.filled,
        chipVariant: ChipVariant.filled,
        iconVariant: IconVariant.rounded,
        dialogVariant: DialogVariant.glass,
        tabIndicatorVariant: TabIndicatorVariant.pill,
        showCardBorder: true,
        showCardShadow: true,
        showButtonShadow: true,
        tripCardOverlayOpacity: 0.3,
      );
}
