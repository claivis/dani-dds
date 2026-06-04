import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Wild, high-energy skin — electric lime on black, mono font, glow everything.
///
/// Inspired by hacker terminals, rave flyers, and warning tape.
/// This skin is intentionally aggressive and polarizing.
class AcidSkin extends DaniSkin {
  const AcidSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'acid',
        name: 'Acid',
        description: 'Electric, wild, high-voltage',
        previewColor: Color(0xFFBEFF00),
        previewColorSecondary: Color(0xFFFF00AA),
        category: SkinCategory.bold,
        tags: ['wild', 'neon', 'lime', 'rave', 'hacker', 'bold', 'dark'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — electric lime + hot magenta
        primary: Color(0xFFBEFF00), // Electric lime
        primaryLight: Color(0xFFD4FF4D),
        primaryDark: Color(0xFF8BCC00),
        primaryForeground: Color(0xFF0A0A0A), // Black text on lime
        secondary: Color(0xFFFF00AA), // Hot magenta
        secondaryForeground: Color(0xFFFFFFFF),
        // Tertiary
        tertiary: Color(0xFF00F0FF), // Electric cyan
        tertiaryForeground: Color(0xFF0A0A0A),
        accent: Color(0xFFFF00AA),
        accentForeground: Color(0xFFFFFFFF),
        // Backgrounds — true black
        background: Color(0xFF050505),
        surface: Color(0xFF0D0D0D),
        surfaceElevated: Color(0xFF151515),
        surfaceVariant: Color(0xFF1A1A1A),
        // Backgrounds dark (same — this is a dark-first skin)
        backgroundDark: Color(0xFF050505),
        surfaceDark: Color(0xFF0D0D0D),
        surfaceDarkElevated: Color(0xFF151515),
        surfaceDarkVariant: Color(0xFF1A1A1A),
        // Text — high contrast lime/white on black
        text: Color(0xFFEEEEEE),
        textMuted: Color(0xFFBEFF00), // Lime for secondary text!
        textSubtle: Color(0xFF88AA00),
        textDisabled: Color(0xFF444444),
        // Text dark
        textDark: Color(0xFFEEEEEE),
        textDarkMuted: Color(0xFFBEFF00),
        textDarkSubtle: Color(0xFF88AA00),
        textDarkDisabled: Color(0xFF444444),
        // Text special
        textLink: Color(0xFF00F0FF),
        textLinkDark: Color(0xFF00F0FF),
        textOnPhoto: Color(0xFFBEFF00),
        textOnPhotoDark: Color(0xFFBEFF00),
        // Borders — lime outlines
        border: Color(0xFF2A2A2A),
        borderSubtle: Color(0xFF1A1A1A),
        borderStrong: Color(0xFFBEFF00), // Lime border!
        // Borders dark
        borderDark: Color(0xFF2A2A2A),
        borderDarkSubtle: Color(0xFF1A1A1A),
        borderDarkStrong: Color(0xFFBEFF00),
        // Status — all neon
        success: Color(0xFFBEFF00), // Lime = success
        successLight: Color(0xFFD4FF4D),
        successDark: Color(0xFF8BCC00),
        warning: Color(0xFFFFDD00), // Electric yellow
        warningLight: Color(0xFFFFEE55),
        warningDark: Color(0xFFCCAA00),
        error: Color(0xFFFF0055), // Hot red-pink
        errorLight: Color(0xFFFF4488),
        errorDark: Color(0xFFCC0044),
        info: Color(0xFF00F0FF), // Cyan
        infoLight: Color(0xFF55F5FF),
        infoDark: Color(0xFF00BBCC),
        // Components
        inputBackground: Color(0xFF0A0A0A),
        inputBorder: Color(0xFF333333),
        inputBorderFocused: Color(0xFFBEFF00),
        buttonPrimary: Color(0xFFBEFF00),
        buttonPrimaryText: Color(0xFF0A0A0A),
        buttonSecondary: Color(0xFF1A1A1A),
        buttonSecondaryText: Color(0xFFBEFF00),
        // Components dark
        inputBackgroundDark: Color(0xFF0A0A0A),
        inputBorderDark: Color(0xFF333333),
        inputBorderFocusedDark: Color(0xFFBEFF00),
        buttonPrimaryDark: Color(0xFFBEFF00),
        buttonPrimaryTextDark: Color(0xFF0A0A0A),
        buttonSecondaryDark: Color(0xFF1A1A1A),
        buttonSecondaryTextDark: Color(0xFFBEFF00),
        // Button danger
        buttonDanger: Color(0xFFFF0055),
        buttonDangerText: Color(0xFFFFFFFF),
        buttonDangerDark: Color(0xFFFF4488),
        buttonDangerTextDark: Color(0xFFFFFFFF),
        // Special
        shadow: Color(0xFF000000),
        shadowDark: Color(0xFF000000),
        scrim: Color(0xCC000000),
        scrimDark: Color(0xCC000000),
        selection: Color(0x55BEFF00),
        selectionDark: Color(0x55BEFF00),
        // Timeline
        timelineConnector: Color(0xFF2A2A2A),
        timelineConnectorDark: Color(0xFF2A2A2A),
        timelineDot: Color(0xFFBEFF00),
        timelineDotDark: Color(0xFFBEFF00),
        timelineDateHeader: Color(0xFFFF00AA), // Magenta date headers!
        timelineDateHeaderDark: Color(0xFFFF00AA),
        // Tab bar
        tabBarIndicator: Color(0xFFBEFF00),
        tabBarIndicatorDark: Color(0xFFBEFF00),
        tabBarSelectedLabel: Color(0xFFBEFF00),
        tabBarSelectedLabelDark: Color(0xFFBEFF00),
        tabBarUnselectedLabel: Color(0xFF666666),
        tabBarUnselectedLabelDark: Color(0xFF666666),
        // Chat
        chatBubbleUser: Color(0xFFBEFF00),
        chatBubbleUserDark: Color(0xFF8BCC00),
        chatBubbleUserText: Color(0xFF0A0A0A),
        chatBubbleUserTextDark: Color(0xFF0A0A0A),
        chatBubbleAssistant: Color(0xFF1A1A1A),
        chatBubbleAssistantDark: Color(0xFF1A1A1A),
        chatBubbleAssistantText: Color(0xFFEEEEEE),
        chatBubbleAssistantTextDark: Color(0xFFEEEEEE),
        // Shimmer
        shimmerBase: Color(0xFF1A1A1A),
        shimmerBaseDark: Color(0xFF1A1A1A),
        shimmerHighlight: Color(0xFF2A2A2A),
        shimmerHighlightDark: Color(0xFF2A2A2A),
        // Trip card
        tripCardOverlay: Color(0xFF000000),
        tripCardOverlayDark: Color(0xFF000000),
        tripCardTitle: Color(0xFFBEFF00),
        tripCardTitleDark: Color(0xFFBEFF00),
        tripCardSubtitle: Color(0xFF88AA00),
        tripCardSubtitleDark: Color(0xFF88AA00),
        // Switch
        switchActiveTrack: Color(0xFFBEFF00),
        switchActiveTrackDark: Color(0xFFBEFF00),
        switchInactiveTrack: Color(0xFF333333),
        switchInactiveTrackDark: Color(0xFF333333),
        switchThumb: Color(0xFF0A0A0A),
        switchThumbDark: Color(0xFF0A0A0A),
        // Tooltip
        tooltipBackground: Color(0xFFBEFF00),
        tooltipBackgroundDark: Color(0xFFBEFF00),
        tooltipText: Color(0xFF0A0A0A),
        tooltipTextDark: Color(0xFF0A0A0A),
        // Snackbar
        snackbarBackground: Color(0xFFBEFF00),
        snackbarBackgroundDark: Color(0xFFBEFF00),
        snackbarText: Color(0xFF0A0A0A),
        snackbarTextDark: Color(0xFF0A0A0A),
        // Divider
        divider: Color(0xFF2A2A2A),
        dividerDark: Color(0xFF2A2A2A),
        // Premium
        premiumGold: Color(0xFFFFDD00),
        premiumGoldDark: Color(0xFFFFDD00),
        // Highlight
        highlight: Color(0x55BEFF00),
        highlightDark: Color(0x55BEFF00),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Space Mono',
        bodyFamily: 'Space Mono',
        monoFamily: 'Space Mono',
        scaleFactor: 0.88,
        headingScaleFactor: 1.15,
        bodyScaleFactor: 0.85,
        headingWeight: FontWeight.w700,
        titleWeight: FontWeight.w700,
        bodyWeight: FontWeight.w400,
        labelWeight: FontWeight.w700,
        captionWeight: FontWeight.w400,
        headingLetterSpacing: -1.0, // Very tight
        bodyLetterSpacing: 0.5,
        labelLetterSpacing: 2.0, // Wide-tracked labels
        captionLetterSpacing: 1.0,
        headingLineHeight: 1.0, // Ultra tight
        bodyLineHeight: 1.5,
        captionLineHeight: 1.3,
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 2, // Almost sharp — just barely not 0
        buttonRadius: 2,
        inputRadius: 2,
        dialogRadius: 4,
        glassRadius: 4,
        glassPillRadius: 2,
        badgeRadius: 2, // NOT round — rectangular badges!
        photoRadius: 0, // Sharp photos
        chipRadius: 2,
        avatarRadius: 2, // Square avatars!
        tooltipRadius: 0,
        snackbarRadius: 0,
        fabRadius: 2,
        menuRadius: 2,
        popupRadius: 2,
        bannerRadius: 0, // Full-bleed banner
        searchBarRadius: 2,
        tabIndicatorRadius: 0,
        bottomSheetRadius: 0,
        cardInnerRadius: 0,
      );

  @override
  SkinEffects get effects => SkinEffects(
        // Glass — dark tinted
        glassFillOpacityDark: 0.05,
        glassFillOpacityLight: 0.05,
        glassBorderOpacityDark: 0.3,
        glassBorderOpacityLight: 0.3,
        glassBorderWidth: 1.0,
        glassBlurSigma: 8,
        glassDialogFillOpacityDark: 0.08,
        glassDialogFillOpacityLight: 0.08,
        glassDialogBorderOpacityDark: 0.4,
        glassDialogBorderOpacityLight: 0.4,
        // Shadows — lime glow
        shadowSm: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.1), blurRadius: 4, offset: Offset.zero),
        ],
        shadowMd: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.15), blurRadius: 12, offset: Offset.zero),
        ],
        shadowLg: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.2), blurRadius: 24, offset: Offset.zero),
        ],
        shadowSmDark: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.1), blurRadius: 4, offset: Offset.zero),
        ],
        shadowMdDark: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.15), blurRadius: 12, offset: Offset.zero),
        ],
        shadowLgDark: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.2), blurRadius: 24, offset: Offset.zero),
        ],
        // Dual glow — lime + magenta
        glowPrimary: [
          BoxShadow(color: const Color(0xFFBEFF00).withOpacity(0.4), blurRadius: 20, spreadRadius: -2),
          BoxShadow(color: const Color(0xFFFF00AA).withOpacity(0.2), blurRadius: 40, spreadRadius: -8),
        ],
        glowSecondary: [
          BoxShadow(color: const Color(0xFFFF00AA).withOpacity(0.35), blurRadius: 24, spreadRadius: -4),
        ],
        // Animation — fast and snappy
        durationFast: const Duration(milliseconds: 80),
        durationNormal: const Duration(milliseconds: 160),
        durationSlow: const Duration(milliseconds: 300),
        curveDefault: Curves.easeOut,
        curveSmooth: Curves.fastOutSlowIn,
        hoverScaleFactor: 1.03,
        pressScaleFactor: 0.96,
        hoverElevationBoost: 4.0,
        enableGlass: true,
        enableGlow: true,
        enableShadows: true,
        enableAnimations: true,
        enableBlur: true,
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 10,
        cardContentPaddingCompact: 6,
        cardGap: 6,
        cardHeaderGap: 2,
        cardFooterGap: 6,
        cardPhotoGap: 8,
        screenPaddingHorizontal: 12,
        screenPaddingTop: 8,
        screenPaddingBottom: 8,
        sectionSpacing: 20,
        sectionHeaderBottomSpacing: 4,
        buttonPaddingHorizontal: 20,
        buttonPaddingVertical: 10,
        dialogContentPadding: 16,
        timelineConnectorWidth: 1,
        timelineDotDiameter: 6, // Tiny dots
        timelineLeftMargin: 36,
        tabBarLabelPadding: 12,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        appBarHeight: 48,
        buttonHeight: 40,
        buttonHeightSm: 28,
        iconSize: 20,
        iconSizeSm: 14,
        cardElevation: 0,
        cardBorderWidth: 1,
        borderWidth: 1,
        dividerThickness: 1,
        scrollbarThickness: 4,
        scrollbarRadius: 0,
        starSize: 12,
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        appBarStyle: AppBarVariant.solid,
        cardStyle: CardVariant.bordered,
        buttonVariant: ButtonVariant.outlined, // Outlined buttons — wire frame
        buttonTextTransform: TextTransform.uppercase,
        inputVariant: InputVariant.outlined,
        chipVariant: ChipVariant.outlined,
        badgeVariant: BadgeVariant.outlined,
        dividerVariant: DividerVariant.solid,
        photoShape: PhotoShape.square, // Sharp photos
        iconVariant: IconVariant.sharp, // Sharp icons
        loadingVariant: LoadingVariant.dots, // Animated dots
        tabIndicatorVariant: TabIndicatorVariant.underline,
        switchVariant: SwitchVariant.minimal,
        showCardBorder: true,
        showCardShadow: true, // Lime glow shadow
        showInputBorder: true,
        showInputFill: false,
        showButtonShadow: false,
        showPhotoOverlayGradient: true,
        useRippleEffect: false,
        animatePageTransitions: true,
        animateCardHover: true,
        tripCardOverlayOpacity: 0.7, // Heavy overlay
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF00F0FF), // Cyan
        train: Color(0xFFFF00AA), // Magenta
        car: Color(0xFFFFDD00), // Yellow
        bus: Color(0xFFBEFF00), // Lime
        ferry: Color(0xFF00F0FF), // Cyan
        cruise: Color(0xFF0088FF), // Blue
        subway: Color(0xFFFF00AA), // Magenta
        hotel: Color(0xFFBEFF00), // Lime
        restaurant: Color(0xFFFF6600), // Orange
        activity: Color(0xFF00F0FF), // Cyan
        attraction: Color(0xFFFF00AA), // Magenta
        rental: Color(0xFFFFDD00), // Yellow
      );
}
