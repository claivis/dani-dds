import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Bookish, journal-like skin — serif fonts, cream backgrounds, sharp corners.
/// Feels like a Moleskine notebook or vintage travel journal.
class PaperSkin extends DaniSkin {
  const PaperSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'paper',
        name: 'Paper',
        description: 'Vintage journal, bookish warmth',
        previewColor: Color(0xFF1E40AF),
        category: SkinCategory.classic,
        tags: ['vintage', 'serif', 'journal', 'warm', 'cream'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — deep blue accent
        primary: Color(0xFF1E40AF),
        primaryLight: Color(0xFF3B82F6),
        primaryDark: Color(0xFF1E3A8A),
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFF7C3AED),
        secondaryForeground: Color(0xFFFFFFFF),
        // Backgrounds (light) — warm cream
        background: Color(0xFFFEFBF3),
        surface: Color(0xFFFFFDF7),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF5F0E5),
        // Backgrounds (dark) — warm charcoal
        backgroundDark: Color(0xFF1C1917),
        surfaceDark: Color(0xFF292524),
        surfaceDarkElevated: Color(0xFF312E2B),
        surfaceDarkVariant: Color(0xFF312E2B),
        // Text (light) — warm black
        text: Color(0xFF1C1917),
        textMuted: Color(0xFF57534E),
        textSubtle: Color(0xFF78716C),
        textDisabled: Color(0xFFA8A29E),
        // Text (dark)
        textDark: Color(0xFFF5F0E5),
        textDarkMuted: Color(0xFFD6D0C4),
        textDarkSubtle: Color(0xFFA8A29E),
        textDarkDisabled: Color(0xFF57534E),
        // Borders (light) — warm stone
        border: Color(0xFFE7E0D3),
        borderSubtle: Color(0xFFF5F0E5),
        borderStrong: Color(0xFFD6CFC2),
        // Borders (dark)
        borderDark: Color(0xFF44403C),
        borderDarkSubtle: Color(0xFF312E2B),
        borderDarkStrong: Color(0xFF57534E),
        // Status
        success: Color(0xFF16A34A),
        successLight: Color(0xFF4ADE80),
        successDark: Color(0xFF15803D),
        warning: Color(0xFFEAB308),
        warningLight: Color(0xFFFDE047),
        warningDark: Color(0xFFCA8A04),
        error: Color(0xFFDC2626),
        errorLight: Color(0xFFF87171),
        errorDark: Color(0xFFB91C1C),
        info: Color(0xFF1E40AF),
        infoLight: Color(0xFF3B82F6),
        infoDark: Color(0xFF1E3A8A),
        // Components (light)
        inputBackground: Color(0xFFFFFDF7),
        inputBorder: Color(0xFFD6CFC2),
        inputBorderFocused: Color(0xFF1E40AF),
        buttonPrimary: Color(0xFF1E40AF),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFE7E0D3),
        buttonSecondaryText: Color(0xFF1E40AF),
        // Components (dark)
        inputBackgroundDark: Color(0xFF292524),
        inputBorderDark: Color(0xFF44403C),
        inputBorderFocusedDark: Color(0xFF3B82F6),
        buttonPrimaryDark: Color(0xFF3B82F6),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF44403C),
        buttonSecondaryTextDark: Color(0xFF3B82F6),
        // Special
        shadow: Color(0x141C1917),
        shadowDark: Color(0x66000000),
        scrim: Color(0x661C1917),
        scrimDark: Color(0xB3000000),
        selection: Color(0x331E40AF),
        selectionDark: Color(0x333B82F6),
        // Timeline
        timelineConnector: Color(0xFFD6D0C4),
        timelineConnectorDark: Color(0xFF333330),
        timelineDot: Color(0xFF1E40AF),
        timelineDotDark: Color(0xFF3B82F6),
        timelineDateHeader: Color(0xFF6B6560),
        timelineDateHeaderDark: Color(0xFF9E9890),
        // Tab bar
        tabBarIndicator: Color(0xFF1E40AF),
        tabBarIndicatorDark: Color(0xFF3B82F6),
        tabBarSelectedLabel: Color(0xFF1E40AF),
        tabBarSelectedLabelDark: Color(0xFF3B82F6),
        tabBarUnselectedLabel: Color(0xFF6B6560),
        tabBarUnselectedLabelDark: Color(0xFF9E9890),
        // Chat
        chatBubbleUser: Color(0xFF1E40AF),
        chatBubbleUserDark: Color(0xFF1E3A8A),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFF5F0E8),
        chatBubbleAssistant: Color(0xFFF5F0E8),
        chatBubbleAssistantDark: Color(0xFF2A2A28),
        chatBubbleAssistantText: Color(0xFF1C1917),
        chatBubbleAssistantTextDark: Color(0xFFF5F0E8),
        // Shimmer
        shimmerBase: Color(0xFFE8E2D8),
        shimmerBaseDark: Color(0xFF2A2A28),
        shimmerHighlight: Color(0xFFF5F0E8),
        shimmerHighlightDark: Color(0xFF333330),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Merriweather',
        bodyFamily: 'Source Serif 4',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 1.02,
        headingWeight: FontWeight.w700,
        bodyWeight: FontWeight.w400,
        headingLetterSpacing: -0.2,
        bodyLetterSpacing: 0.01,
        headingLineHeight: 1.25,
        bodyLineHeight: 1.6,
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 4, // Sharp, editorial
        buttonRadius: 4,
        inputRadius: 4,
        dialogRadius: 8,
        glassRadius: 8,
        glassPillRadius: 4,
        badgeRadius: 4,
        photoRadius: 4,
        chipRadius: 4,
      );

  @override
  SkinEffects get effects => const SkinEffects(
        // Glass DISABLED — Paper uses opaque backgrounds
        glassFillOpacityDark: 0.0,
        glassFillOpacityLight: 0.0,
        glassBorderOpacityDark: 0.0,
        glassBorderOpacityLight: 0.0,
        glassBorderWidth: 1.0,
        glassBlurSigma: 0,
        glassDialogFillOpacityDark: 0.0,
        glassDialogFillOpacityLight: 0.0,
        glassDialogBorderOpacityDark: 0.0,
        glassDialogBorderOpacityLight: 0.0,
        enableGlass: false,
        enableGlow: false,
        // Shadows — subtle, warm
        shadowSm: [
          BoxShadow(color: Color(0x0A1C1917), blurRadius: 2, offset: Offset(0, 1)),
        ],
        shadowMd: [
          BoxShadow(color: Color(0x101C1917), blurRadius: 6, offset: Offset(0, 3)),
        ],
        shadowLg: [
          BoxShadow(color: Color(0x141C1917), blurRadius: 12, offset: Offset(0, 6)),
        ],
        shadowSmDark: [
          BoxShadow(color: Color(0x40000000), blurRadius: 2, offset: Offset(0, 1)),
        ],
        shadowMdDark: [
          BoxShadow(color: Color(0x50000000), blurRadius: 6, offset: Offset(0, 3)),
        ],
        shadowLgDark: [
          BoxShadow(color: Color(0x60000000), blurRadius: 12, offset: Offset(0, 6)),
        ],
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF2563EB),
        train: Color(0xFF7C3AED),
        hotel: Color(0xFF059669),
        restaurant: Color(0xFFDC2626),
        activity: Color(0xFFD97706),
        attraction: Color(0xFF7C3AED),
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 14,
        cardGap: 10,
        sectionSpacing: 28,
        sectionHeaderBottomSpacing: 10,
        buttonPaddingHorizontal: 28,
        buttonPaddingVertical: 14,
        inputContentPadding: 14,
        dialogContentPadding: 24,
        timelineConnectorWidth: 1,
        timelineDotDiameter: 10,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        buttonHeight: 44,
        cardBorderWidth: 0.5,
        borderWidth: 0.5,
        dividerThickness: 0.5,
        photoAspectRatio: 1.5,
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        cardStyle: CardVariant.flat,
        buttonVariant: ButtonVariant.outlined,
        chipVariant: ChipVariant.outlined,
        inputVariant: InputVariant.underline,
        iconVariant: IconVariant.outlined,
        dividerVariant: DividerVariant.solid,
        photoShape: PhotoShape.rounded,
        loadingVariant: LoadingVariant.circular,
        listSeparator: ListSeparatorVariant.divider,
        showCardBorder: true,
        showCardShadow: false,
        showButtonShadow: false,
        showPhotoOverlayGradient: false,
        animateCardHover: false,
        tripCardOverlayOpacity: 0.3,
      );
}
