import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Curator skin — editorial luxury, inspired by The Digital Curator.
///
/// Deep navy/indigo primary, clean white surfaces, Playfair Display headings +
/// DM Sans body, generous spacing, unified muted icon colors, minimalist cards.
class CuratorSkin extends DaniSkin {
  const CuratorSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'curator',
        name: 'Curator',
        description: 'Editorial luxury — refined, navy, minimalist',
        previewColor: Color(0xFF2D2B55),
        previewColorSecondary: Color(0xFF6B6B8D),
        category: SkinCategory.classic,
        tags: [
          'editorial',
          'luxury',
          'navy',
          'minimalist',
          'serif',
          'refined'
        ],
      );

  // ── Colors ──

  @override
  SkinColors get colors => const SkinColors(
        // Core palette — deep indigo/navy
        primary: Color(0xFF2D2B55),
        primaryLight: Color(0xFF4A47A0),
        primaryDark: Color(0xFF1E1B4B),
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFF6B6B8D),
        secondaryForeground: Color(0xFFFFFFFF),
        // Tertiary / Accent
        tertiary: Color(0xFF8B8EA4),
        tertiaryForeground: Color(0xFFFFFFFF),
        accent: Color(0xFF4A47A0),
        accentForeground: Color(0xFFFFFFFF),
        // Backgrounds (light)
        background: Color(0xFFFAFAFC),
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF4F4F8),
        // Backgrounds (dark)
        backgroundDark: Color(0xFF0E0D1A),
        surfaceDark: Color(0xFF18172B),
        surfaceDarkElevated: Color(0xFF201F36),
        surfaceDarkVariant: Color(0xFF28274A),
        // Text (light) — navy tones
        text: Color(0xFF1E1B4B),
        textMuted: Color(0xFF6B6B8D),
        textSubtle: Color(0xFF8B8EA4),
        textDisabled: Color(0xFFB5B7C9),
        // Text (dark)
        textDark: Color(0xFFF0F0F6),
        textDarkMuted: Color(0xFFA5A7BC),
        textDarkSubtle: Color(0xFF7B7D96),
        textDarkDisabled: Color(0xFF4E4F6B),
        // Borders (light)
        border: Color(0xFFE2E2EC),
        borderSubtle: Color(0xFFF0F0F6),
        borderStrong: Color(0xFFCBCBDC),
        // Borders (dark)
        borderDark: Color(0xFF33325A),
        borderDarkSubtle: Color(0xFF252442),
        borderDarkStrong: Color(0xFF4A488A),
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
        info: Color(0xFF4A47A0),
        infoLight: Color(0xFF6B6B8D),
        infoDark: Color(0xFF2D2B55),
        // Components (light)
        inputBackground: Color(0xFFF4F4F8),
        inputBorder: Color(0xFFE2E2EC),
        inputBorderFocused: Color(0xFF2D2B55),
        buttonPrimary: Color(0xFF2D2B55),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFF4F4F8),
        buttonSecondaryText: Color(0xFF2D2B55),
        // Components (dark)
        inputBackgroundDark: Color(0xFF201F36),
        inputBorderDark: Color(0xFF33325A),
        inputBorderFocusedDark: Color(0xFF6B6B8D),
        buttonPrimaryDark: Color(0xFF4A47A0),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF28274A),
        buttonSecondaryTextDark: Color(0xFFA5A7BC),
        // Shadow
        shadow: Color(0x0D1E1B4B),
        shadowDark: Color(0x330E0D1A),
        scrim: Color(0x991E1B4B),
        scrimDark: Color(0xCC0E0D1A),
        selection: Color(0x332D2B55),
        selectionDark: Color(0x334A47A0),
        // Chat / AI
        chatBubbleUser: Color(0xFF2D2B55),
        chatBubbleUserDark: Color(0xFF4A47A0),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFFFFFFF),
        chatBubbleAssistant: Color(0xFFF4F4F8),
        chatBubbleAssistantDark: Color(0xFF201F36),
        chatBubbleAssistantText: Color(0xFF1E1B4B),
        chatBubbleAssistantTextDark: Color(0xFFF0F0F6),
        // Timeline
        timelineConnector: Color(0xFFE2E2EC),
        timelineConnectorDark: Color(0xFF33325A),
        timelineDot: Color(0xFF2D2B55),
        timelineDotDark: Color(0xFF6B6B8D),
        timelineDateHeader: Color(0xFF1E1B4B),
        timelineDateHeaderDark: Color(0xFFF0F0F6),
        // Tab bar
        tabBarIndicator: Color(0xFF2D2B55),
        tabBarIndicatorDark: Color(0xFF6B6B8D),
        tabBarSelectedLabel: Color(0xFF1E1B4B),
        tabBarSelectedLabelDark: Color(0xFFF0F0F6),
        tabBarUnselectedLabel: Color(0xFF8B8EA4),
        tabBarUnselectedLabelDark: Color(0xFF5E5F7A),
        // Trip card overlay
        tripCardOverlay: Color(0xFF1E1B4B),
        tripCardOverlayDark: Color(0xFF0E0D1A),
        tripCardTitle: Color(0xFFFFFFFF),
        tripCardTitleDark: Color(0xFFFFFFFF),
        tripCardSubtitle: Color(0xFFE2E2EC),
        tripCardSubtitleDark: Color(0xFFA5A7BC),
        // Divider
        divider: Color(0xFFE2E2EC),
        dividerDark: Color(0xFF33325A),
      );

  // ── Typography ──

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Playfair Display',
        bodyFamily: 'DM Sans',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 1.0,
        headingWeight: FontWeight.w700,
        titleWeight: FontWeight.w600,
        bodyWeight: FontWeight.w400,
        labelWeight: FontWeight.w500,
        captionWeight: FontWeight.w400,
        headingLetterSpacing: -0.3,
        bodyLetterSpacing: 0.0,
        labelLetterSpacing: 1.2,
        captionLetterSpacing: 0.2,
        headingLineHeight: 1.2,
        bodyLineHeight: 1.5,
        captionLineHeight: 1.4,
      );

  // ── Shape ──

  // ── Shape — sharp edges, no curves, clean and architectural ──

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 0,
        buttonRadius: 0,
        inputRadius: 0,
        dialogRadius: 0,
        glassRadius: 0,
        glassPillRadius: 0,
        badgeRadius: 0,
        photoRadius: 0,
        chipRadius: 0,
        avatarRadius: 9999, // keep avatar circles
        tooltipRadius: 0,
        snackbarRadius: 0,
        fabRadius: 0,
        switchRadius: 9999, // keep switch pill shape
        checkboxRadius: 0,
        menuRadius: 0,
        popupRadius: 0,
        bannerRadius: 0,
        searchBarRadius: 0,
        tabIndicatorRadius: 0,
        progressRadius: 0,
        shimmerRadius: 0,
        bottomSheetRadius: 0,
        navigationBarRadius: 0,
      );

  // ── Effects ──

  @override
  SkinEffects get effects => const SkinEffects(
        // Glass — subtle, not dominant
        glassFillOpacityDark: 0.08,
        glassFillOpacityLight: 0.6,
        glassBorderOpacityDark: 0.12,
        glassBorderOpacityLight: 0.5,
        glassBorderWidth: 1.0,
        glassBlurSigma: 20,
        glassDialogFillOpacityDark: 0.85,
        glassDialogFillOpacityLight: 0.92,
        glassDialogBorderOpacityDark: 0.15,
        glassDialogBorderOpacityLight: 0.4,
        // Shadows (light) — very subtle
        shadowSm: [
          BoxShadow(
            color: Color(0x081E1B4B),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
        shadowMd: [
          BoxShadow(
            color: Color(0x0C1E1B4B),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        shadowLg: [
          BoxShadow(
            color: Color(0x121E1B4B),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
        // Shadows (dark)
        shadowSmDark: [
          BoxShadow(
            color: Color(0x300E0D1A),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
        shadowMdDark: [
          BoxShadow(
            color: Color(0x400E0D1A),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        shadowLgDark: [
          BoxShadow(
            color: Color(0x600E0D1A),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
        // Glow — indigo tinted
        glowPrimary: [
          BoxShadow(
            color: Color(0x332D2B55),
            blurRadius: 20,
            spreadRadius: -4,
          ),
        ],
        // Animation — smooth, unhurried
        durationFast: Duration(milliseconds: 150),
        durationNormal: Duration(milliseconds: 350),
        durationSlow: Duration(milliseconds: 550),
        hoverScaleFactor: 1.01,
        pressScaleFactor: 0.99,
        hoverElevationBoost: 2.0,
        enableGlass: true,
        enableGlow: true,
        enableShadows: true,
        enableAnimations: true,
        enableBlur: true,
      );

  // ── Spacing — generous, editorial breathing room ──

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 16.0,
        cardContentPaddingCompact: 12.0,
        cardGap: 16.0,
        cardHeaderGap: 6.0,
        cardFooterGap: 10.0,
        cardPhotoGap: 10.0,
        screenPaddingHorizontal: 20.0,
        screenPaddingTop: 20.0,
        screenPaddingBottom: 20.0,
        sectionSpacing: 32.0,
        sectionHeaderBottomSpacing: 12.0,
        dialogContentPadding: 28.0,
        dialogTitleBottomSpacing: 16.0,
        dialogActionSpacing: 10.0,
        dialogActionTopSpacing: 28.0,
        buttonPaddingHorizontal: 36.0,
        buttonPaddingVertical: 16.0,
        buttonPaddingHorizontalSm: 20.0,
        buttonPaddingVerticalSm: 10.0,
        buttonGap: 10.0,
        inputContentPadding: 16.0,
        inputLabelSpacing: 8.0,
        inputGroupSpacing: 18.0,
        listItemPaddingVertical: 14.0,
        listItemPaddingHorizontal: 18.0,
        chipPaddingHorizontal: 14.0,
        chipPaddingVertical: 6.0,
        chipSpacing: 8.0,
        badgePaddingHorizontal: 10.0,
        badgePaddingVertical: 4.0,
        iconTextGap: 10.0,
        iconPadding: 4.0,
        timelineConnectorWidth: 1.5,
        timelineDotDiameter: 10.0,
        timelineLeftMargin: 44.0,
        timelineDateHeaderSpacing: 14.0,
        photoCarouselGap: 4.0,
        photoGridGap: 4.0,
        appBarTitleSpacing: 18.0,
        tabBarLabelPadding: 20.0,
        tabBarIndicatorWeight: 2.0,
        fabMargin: 20.0,
      );

  // ── Sizing ──

  @override
  SkinSizing get sizing => const SkinSizing(
        appBarHeight: 56.0,
        appBarElevation: 0.0,
        appBarCenterTitle: false,
        buttonHeight: 48.0,
        buttonHeightSm: 36.0,
        buttonHeightLg: 56.0,
        iconSize: 24.0,
        iconSizeSm: 18.0,
        iconSizeLg: 32.0,
        avatarSize: 40.0,
        avatarSizeSm: 28.0,
        avatarSizeLg: 56.0,
        cardElevation: 0.0,
        cardBorderWidth: 1.0,
        dividerThickness: 1.0,
        borderWidth: 1.0,
        photoCarouselHeight: 200.0,
        starSize: 14.0,
        starSpacing: 2.0,
      );

  // ── Component Styles ──

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        appBarStyle: AppBarVariant.solid,
        cardStyle: CardVariant.bordered,
        buttonVariant: ButtonVariant.filled,
        buttonTextTransform: TextTransform.none,
        inputVariant: InputVariant.outlined,
        chipVariant: ChipVariant.outlined,
        tabIndicatorVariant: TabIndicatorVariant.underline,
        showCardBorder: true,
        showCardShadow: false,
        showButtonShadow: false,
        showPhotoOverlayGradient: true,
        useRippleEffect: true,
        showTimelineConnectors: true,
        animateCardHover: true,
        tripCardOverlayOpacity: 0.45,
      );

  // ── Domain Colors — ALL unified navy for clean icon circles ──

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF3D3B70),
        train: Color(0xFF3D3B70),
        car: Color(0xFF3D3B70),
        bus: Color(0xFF3D3B70),
        ferry: Color(0xFF3D3B70),
        cruise: Color(0xFF3D3B70),
        subway: Color(0xFF3D3B70),
        hotel: Color(0xFF3D3B70),
        restaurant: Color(0xFF3D3B70),
        activity: Color(0xFF3D3B70),
        attraction: Color(0xFF3D3B70),
        rental: Color(0xFF3D3B70),
      );
}
