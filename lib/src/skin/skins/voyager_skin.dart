import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Premium editorial skin — calm confidence, luxury travel magazine feel.
///
/// Deep Teal primary, warm sand/gold accents, DM Sans headings + Inter body,
/// generous spacing, shadow-based card separation, rounded shape language.
class VoyagerSkin extends DaniSkin {
  const VoyagerSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'voyager',
        name: 'Voyager',
        description: 'Premium editorial — calm, warm, refined',
        previewColor: Color(0xFF0D7377),
        previewColorSecondary: Color(0xFFC8A882),
        category: SkinCategory.classic,
        tags: ['premium', 'editorial', 'warm', 'teal', 'gold', 'professional'],
      );

  // ── Colors ──

  @override
  SkinColors get colors => const SkinColors(
        // Core palette
        primary: Color(0xFF0D7377), // Deep Teal
        primaryLight: Color(0xFF1A9CA0), // Soft Teal
        primaryDark: Color(0xFF095457), // Midnight Teal
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFFC8A882), // Warm Sand
        secondaryForeground: Color(0xFF1C1C1E),
        // Tertiary / Accent
        tertiary: Color(0xFFB8965A), // Burnished Gold
        tertiaryForeground: Color(0xFFFFFFFF),
        accent: Color(0xFFB8965A),
        accentForeground: Color(0xFFFFFFFF),
        // Backgrounds (light)
        background: Color(0xFFFAFAF8), // Warm White
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF5F3F0), // Pale Linen
        // Backgrounds (dark)
        backgroundDark: Color(0xFF111114), // True Dark
        surfaceDark: Color(0xFF1A1A1E),
        surfaceDarkElevated: Color(0xFF222226),
        surfaceDarkVariant: Color(0xFF2A2A2E),
        // Text (light)
        text: Color(0xFF1C1C1E), // Charcoal
        textMuted: Color(0xFF6B6B70), // Graphite
        textSubtle: Color(0xFF8E8E93), // Silver
        textDisabled: Color(0xFFAEAEB2),
        // Text (dark)
        textDark: Color(0xFFF5F5F7),
        textDarkMuted: Color(0xFFA1A1A6),
        textDarkSubtle: Color(0xFF7C7C80),
        textDarkDisabled: Color(0xFF545456),
        // Text special
        textLink: Color(0xFF0D7377),
        textLinkDark: Color(0xFF1A9CA0),
        textOnPhoto: Color(0xFFFFFFFF),
        textOnPhotoDark: Color(0xFFFFFFFF),
        // Borders (light)
        border: Color(0xFFE5E3E0), // Warm gray border
        borderSubtle: Color(0xFFF0EEEB),
        borderStrong: Color(0xFFD1CFCB),
        // Borders (dark)
        borderDark: Color(0xFF333336),
        borderDarkSubtle: Color(0xFF2A2A2E),
        borderDarkStrong: Color(0xFF48484A),
        // Status
        success: Color(0xFF2D9F6F),
        successLight: Color(0xFF4DBF8E),
        successDark: Color(0xFF1F7A52),
        warning: Color(0xFFD4920A),
        warningLight: Color(0xFFE5AB30),
        warningDark: Color(0xFFB07808),
        error: Color(0xFFD14343),
        errorLight: Color(0xFFE06666),
        errorDark: Color(0xFFB33636),
        info: Color(0xFF3478C6),
        infoLight: Color(0xFF5A95D6),
        infoDark: Color(0xFF2660A8),
        // Components (light)
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFFD1CFCB),
        inputBorderFocused: Color(0xFF0D7377),
        buttonPrimary: Color(0xFF0D7377),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFF5F3F0),
        buttonSecondaryText: Color(0xFF0D7377),
        // Components (dark)
        inputBackgroundDark: Color(0xFF222226),
        inputBorderDark: Color(0xFF48484A),
        inputBorderFocusedDark: Color(0xFF1A9CA0),
        buttonPrimaryDark: Color(0xFF1A9CA0),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF2A2A2E),
        buttonSecondaryTextDark: Color(0xFF1A9CA0),
        // Button danger
        buttonDanger: Color(0xFFD14343),
        buttonDangerText: Color(0xFFFFFFFF),
        buttonDangerDark: Color(0xFFE06666),
        buttonDangerTextDark: Color(0xFFFFFFFF),
        // Special
        shadow: Color(0x0F1C1C1E), // Warm shadow
        shadowDark: Color(0x66000000),
        scrim: Color(0x661C1C1E),
        scrimDark: Color(0xB3000000),
        selection: Color(0x330D7377),
        selectionDark: Color(0x331A9CA0),
        // Navigation
        navBarBackground: Color(0xFFFFFFFF),
        navBarBackgroundDark: Color(0xFF1A1A1E),
        navBarSelectedItem: Color(0xFF0D7377),
        navBarSelectedItemDark: Color(0xFF1A9CA0),
        navBarUnselectedItem: Color(0xFF8E8E93),
        navBarUnselectedItemDark: Color(0xFF7C7C80),
        // Tab bar
        tabBarIndicator: Color(0xFF0D7377),
        tabBarIndicatorDark: Color(0xFF1A9CA0),
        tabBarSelectedLabel: Color(0xFF0D7377),
        tabBarSelectedLabelDark: Color(0xFF1A9CA0),
        tabBarUnselectedLabel: Color(0xFF8E8E93),
        tabBarUnselectedLabelDark: Color(0xFF7C7C80),
        // Chat
        chatBubbleUser: Color(0xFF0D7377),
        chatBubbleUserDark: Color(0xFF095457),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFF5F5F7),
        chatBubbleAssistant: Color(0xFFF5F3F0),
        chatBubbleAssistantDark: Color(0xFF2A2A2E),
        chatBubbleAssistantText: Color(0xFF1C1C1E),
        chatBubbleAssistantTextDark: Color(0xFFF5F5F7),
        // Timeline
        timelineConnector: Color(0xFFE0DDD8),
        timelineConnectorDark: Color(0xFF333336),
        timelineDot: Color(0xFF0D7377),
        timelineDotDark: Color(0xFF1A9CA0),
        timelineDateHeader: Color(0xFF6B6B70),
        timelineDateHeaderDark: Color(0xFFA1A1A6),
        // Shimmer
        shimmerBase: Color(0xFFF0EEEB),
        shimmerBaseDark: Color(0xFF2A2A2E),
        shimmerHighlight: Color(0xFFFAFAF8),
        shimmerHighlightDark: Color(0xFF333336),
        // Trip card overlay
        tripCardOverlay: Color(0xFF1C1C1E),
        tripCardOverlayDark: Color(0xFF000000),
        tripCardTitle: Color(0xFFFFFFFF),
        tripCardTitleDark: Color(0xFFFFFFFF),
        tripCardSubtitle: Color(0xCCFFFFFF),
        tripCardSubtitleDark: Color(0xCCFFFFFF),
        // Switch
        switchActiveTrack: Color(0xFF0D7377),
        switchActiveTrackDark: Color(0xFF1A9CA0),
        switchInactiveTrack: Color(0xFFD1CFCB),
        switchInactiveTrackDark: Color(0xFF48484A),
        switchThumb: Color(0xFFFFFFFF),
        switchThumbDark: Color(0xFFF5F5F7),
        // Tooltip
        tooltipBackground: Color(0xFF1C1C1E),
        tooltipBackgroundDark: Color(0xFF333336),
        tooltipText: Color(0xFFFFFFFF),
        tooltipTextDark: Color(0xFFF5F5F7),
        // Snackbar
        snackbarBackground: Color(0xFF1C1C1E),
        snackbarBackgroundDark: Color(0xFF333336),
        snackbarText: Color(0xFFFFFFFF),
        snackbarTextDark: Color(0xFFF5F5F7),
        // Divider
        divider: Color(0xFFE5E3E0),
        dividerDark: Color(0xFF333336),
        // Premium
        premiumGold: Color(0xFFB8965A),
        premiumGoldDark: Color(0xFFD4B07A),
        // Highlight
        highlight: Color(0x330D7377),
        highlightDark: Color(0x331A9CA0),
      );

  // ── Typography ──

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'DM Sans',
        bodyFamily: 'Inter',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 1.0,
        headingScaleFactor: 1.1,
        bodyScaleFactor: 1.0,
        headingWeight: FontWeight.w700,
        titleWeight: FontWeight.w600,
        bodyWeight: FontWeight.w400,
        labelWeight: FontWeight.w500,
        captionWeight: FontWeight.w400,
        headingLetterSpacing: -0.3,
        bodyLetterSpacing: 0.0,
        labelLetterSpacing: 0.3,
        captionLetterSpacing: 0.1,
        headingLineHeight: 1.15,
        bodyLineHeight: 1.5,
        captionLineHeight: 1.3,
      );

  // ── Shape ──

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 16,
        buttonRadius: 10,
        inputRadius: 10,
        dialogRadius: 20,
        glassRadius: 20,
        glassPillRadius: 14,
        badgeRadius: 9999,
        photoRadius: 12,
        chipRadius: 8,
        avatarRadius: 9999,
        tooltipRadius: 8,
        snackbarRadius: 10,
        fabRadius: 16,
        menuRadius: 14,
        popupRadius: 14,
        bannerRadius: 16,
        searchBarRadius: 12,
        tabIndicatorRadius: 6,
        bottomSheetRadius: 20,
        cardInnerRadius: 12,
      );

  // ── Effects ──

  @override
  SkinEffects get effects => SkinEffects(
        // Glass — refined, higher opacity for readability
        glassFillOpacityDark: 0.10,
        glassFillOpacityLight: 0.55,
        glassBorderOpacityDark: 0.12,
        glassBorderOpacityLight: 0.45,
        glassBorderWidth: 1.0,
        glassBlurSigma: 20,
        glassDialogFillOpacityDark: 0.12,
        glassDialogFillOpacityLight: 0.65,
        glassDialogBorderOpacityDark: 0.15,
        glassDialogBorderOpacityLight: 0.55,
        // Shadows (light) — warm, natural
        shadowSm: const [
          BoxShadow(color: Color(0x0F1C1C1E), blurRadius: 3, offset: Offset(0, 1)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x141C1C1E), blurRadius: 12, offset: Offset(0, 4)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x1A1C1C1E), blurRadius: 24, offset: Offset(0, 8)),
        ],
        // Shadows (dark)
        shadowSmDark: const [
          BoxShadow(color: Color(0x4D000000), blurRadius: 3, offset: Offset(0, 1)),
        ],
        shadowMdDark: const [
          BoxShadow(color: Color(0x66000000), blurRadius: 12, offset: Offset(0, 4)),
        ],
        shadowLgDark: const [
          BoxShadow(color: Color(0x80000000), blurRadius: 24, offset: Offset(0, 8)),
        ],
        // No glow — Voyager doesn't glow
        glowPrimary: null,
        glowSecondary: null,
        // Animation — smooth and measured
        durationFast: const Duration(milliseconds: 150),
        durationNormal: const Duration(milliseconds: 250),
        durationSlow: const Duration(milliseconds: 450),
        curveDefault: Curves.easeInOut,
        curveSmooth: Curves.fastOutSlowIn,
        hoverScaleFactor: 1.01,
        pressScaleFactor: 0.99,
        hoverElevationBoost: 2.0,
        // Feature flags
        enableGlass: true,
        enableGlow: false,
        enableShadows: true,
        enableAnimations: true,
        enableBlur: true,
      );

  // ── Spacing — generous, editorial ──

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 16,
        cardContentPaddingCompact: 10,
        cardGap: 12,
        cardHeaderGap: 6,
        cardFooterGap: 10,
        cardPhotoGap: 12,
        screenPaddingHorizontal: 20,
        screenPaddingTop: 20,
        screenPaddingBottom: 20,
        sectionSpacing: 32,
        sectionHeaderBottomSpacing: 12,
        sectionDividerSpacing: 20,
        dialogContentPadding: 28,
        dialogTitleBottomSpacing: 16,
        dialogActionSpacing: 10,
        dialogActionTopSpacing: 28,
        buttonPaddingHorizontal: 28,
        buttonPaddingVertical: 14,
        buttonPaddingHorizontalSm: 16,
        buttonPaddingVerticalSm: 8,
        buttonGap: 10,
        buttonIconGap: 8,
        inputContentPadding: 16,
        inputLabelSpacing: 8,
        inputHelperSpacing: 6,
        inputGroupSpacing: 20,
        listItemPaddingVertical: 14,
        listItemPaddingHorizontal: 16,
        chipPaddingHorizontal: 12,
        chipPaddingVertical: 6,
        chipSpacing: 8,
        badgePaddingHorizontal: 10,
        badgePaddingVertical: 3,
        iconTextGap: 10,
        iconPadding: 4,
        timelineConnectorWidth: 1.5,
        timelineDotDiameter: 10,
        timelineLeftMargin: 48,
        timelineDateHeaderSpacing: 16,
        photoCarouselGap: 4,
        photoGridGap: 4,
        appBarTitleSpacing: 16,
        appBarActionSpacing: 6,
        tabBarLabelPadding: 20,
        tabBarIndicatorWeight: 2.5,
        fabMargin: 20,
        fabExtendedPadding: 24,
        snackbarMargin: 12,
        snackbarContentPadding: 16,
        tooltipPadding: 10,
        tooltipMargin: 8,
      );

  // ── Sizing ──

  @override
  SkinSizing get sizing => const SkinSizing(
        appBarHeight: 56,
        appBarElevation: 0,
        appBarCenterTitle: false,
        buttonHeight: 48,
        buttonHeightSm: 36,
        buttonHeightLg: 56,
        buttonMinWidth: 64,
        buttonIconSize: 20,
        iconSize: 22,
        iconSizeSm: 18,
        iconSizeLg: 30,
        avatarSize: 40,
        avatarSizeSm: 28,
        avatarSizeLg: 56,
        chipHeight: 32,
        fabSize: 56,
        fabSizeSm: 40,
        dividerThickness: 1,
        borderWidth: 1,
        borderWidthFocus: 2,
        cardElevation: 0,
        cardBorderWidth: 0, // Shadow-based, no borders
        dialogElevation: 12,
        scrollbarThickness: 6,
        scrollbarRadius: 3,
        starSize: 14,
        starSpacing: 1,
      );

  // ── Component Styles ──

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        appBarStyle: AppBarVariant.solid,
        cardStyle: CardVariant.elevated, // Shadow-based separation
        buttonVariant: ButtonVariant.filled,
        buttonTextTransform: TextTransform.none,
        inputVariant: InputVariant.outlined,
        dialogVariant: DialogVariant.standard,
        chipVariant: ChipVariant.outlined,
        badgeVariant: BadgeVariant.filled,
        dividerVariant: DividerVariant.solid,
        photoShape: PhotoShape.rounded,
        iconVariant: IconVariant.rounded, // Softer icons
        loadingVariant: LoadingVariant.shimmer,
        tabIndicatorVariant: TabIndicatorVariant.underline,
        switchVariant: SwitchVariant.material,
        showCardBorder: false, // No borders — shadows only
        showCardShadow: true,
        showInputBorder: true,
        showInputFill: false,
        showButtonShadow: false,
        showPhotoOverlayGradient: true,
        useRippleEffect: true,
        showScrollbar: true,
        showDividers: true,
        showTimelineConnectors: true,
        animatePageTransitions: true,
        animateCardHover: true,
        tripCardOverlayOpacity: 0.35,
        photoOverlayGradientStops: [0.0, 0.5, 1.0],
        photoOverlayGradientOpacities: [0.0, 0.08, 0.55],
      );

  // ── Domain Colors — muted, sophisticated palette ──

  @override
  SkinDomainColors? get domainColors => const SkinDomainColors(
        flight: Color(0xFF3478C6), // Calm blue
        train: Color(0xFF6B7F3A), // Olive green
        car: Color(0xFF7A6B5D), // Warm taupe
        bus: Color(0xFF8B7355), // Dusty brown
        ferry: Color(0xFF4A8B9B), // Muted ocean
        cruise: Color(0xFF2E6B7F), // Deep ocean
        subway: Color(0xFF8A6B9E), // Muted purple
        hotel: Color(0xFF0D7377), // Primary teal
        restaurant: Color(0xFFC27A3E), // Warm amber
        activity: Color(0xFF5B8A5D), // Sage green
        attraction: Color(0xFFB8965A), // Gold accent
        rental: Color(0xFF7A6B5D), // Warm taupe
      );
}
