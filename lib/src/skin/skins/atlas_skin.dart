import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Modern companion skin — smart, efficient, trustworthy tool feel.
///
/// Slate Blue primary, coral/seafoam accents, Plus Jakarta Sans throughout,
/// dual geometry (rectangles + pills), border-based cards, pill tab indicator.
class AtlasSkin extends DaniSkin {
  const AtlasSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'atlas',
        name: 'Atlas',
        description: 'Modern companion — smart, clear, trustworthy',
        previewColor: Color(0xFF3B5998),
        previewColorSecondary: Color(0xFFE07A5F),
        category: SkinCategory.professional,
        tags: ['modern', 'blue', 'coral', 'professional', 'tool', 'pill-tabs'],
      );

  // ── Colors ──

  @override
  SkinColors get colors => const SkinColors(
        // Core palette
        primary: Color(0xFF3B5998), // Slate Blue
        primaryLight: Color(0xFF5B7EC2), // Soft Blue
        primaryDark: Color(0xFF2C4373), // Deep Blue
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFFE07A5F), // Coral
        secondaryForeground: Color(0xFFFFFFFF),
        // Tertiary / Accent
        tertiary: Color(0xFF5FB5A2), // Seafoam
        tertiaryForeground: Color(0xFFFFFFFF),
        accent: Color(0xFFE07A5F), // Coral as accent
        accentForeground: Color(0xFFFFFFFF),
        // Backgrounds (light)
        background: Color(0xFFF7F8FA), // Cool White
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFFFFF),
        surfaceVariant: Color(0xFFF0F2F5),
        // Backgrounds (dark) — Navy, not pure black
        backgroundDark: Color(0xFF0F1923),
        surfaceDark: Color(0xFF182636),
        surfaceDarkElevated: Color(0xFF1F3044),
        surfaceDarkVariant: Color(0xFF253A50),
        // Text (light)
        text: Color(0xFF1A2233), // Ink — navy-tinted dark
        textMuted: Color(0xFF5C6878), // Storm
        textSubtle: Color(0xFF8895A7), // Haze
        textDisabled: Color(0xFFB0B8C4), // Mist
        // Text (dark)
        textDark: Color(0xFFF0F2F5),
        textDarkMuted: Color(0xFFA3B1C4),
        textDarkSubtle: Color(0xFF7B8DA3),
        textDarkDisabled: Color(0xFF4D6078),
        // Text special
        textLink: Color(0xFF3B5998),
        textLinkDark: Color(0xFF5B7EC2),
        textOnPhoto: Color(0xFFFFFFFF),
        textOnPhotoDark: Color(0xFFFFFFFF),
        // Borders (light)
        border: Color(0xFFDFE3E8), // Cool gray border
        borderSubtle: Color(0xFFECEFF3),
        borderStrong: Color(0xFFC8CED6),
        // Borders (dark)
        borderDark: Color(0xFF2D4058),
        borderDarkSubtle: Color(0xFF253A50),
        borderDarkStrong: Color(0xFF3D5570),
        // Status — minimized palette (reuses accent colors)
        success: Color(0xFF5FB5A2), // = seafoam accent
        successLight: Color(0xFF7FC9B8),
        successDark: Color(0xFF4A9485),
        warning: Color(0xFFE5A84B),
        warningLight: Color(0xFFEDBD70),
        warningDark: Color(0xFFC89038),
        error: Color(0xFFD95757),
        errorLight: Color(0xFFE47878),
        errorDark: Color(0xFFBF4545),
        info: Color(0xFF3B5998), // = primary blue
        infoLight: Color(0xFF5B7EC2),
        infoDark: Color(0xFF2C4373),
        // Components (light)
        inputBackground: Color(0xFFF0F2F5), // Filled input bg
        inputBorder: Color(0xFFDFE3E8),
        inputBorderFocused: Color(0xFF3B5998),
        buttonPrimary: Color(0xFF3B5998),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFEDF0F7), // Tonal — light blue tint
        buttonSecondaryText: Color(0xFF3B5998),
        // Components (dark)
        inputBackgroundDark: Color(0xFF1F3044),
        inputBorderDark: Color(0xFF3D5570),
        inputBorderFocusedDark: Color(0xFF5B7EC2),
        buttonPrimaryDark: Color(0xFF5B7EC2),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF253A50),
        buttonSecondaryTextDark: Color(0xFF5B7EC2),
        // Button danger
        buttonDanger: Color(0xFFD95757),
        buttonDangerText: Color(0xFFFFFFFF),
        buttonDangerDark: Color(0xFFE47878),
        buttonDangerTextDark: Color(0xFFFFFFFF),
        // Special
        shadow: Color(0x0A1A2233),
        shadowDark: Color(0x40000000),
        scrim: Color(0x661A2233),
        scrimDark: Color(0xB3000000),
        selection: Color(0x333B5998),
        selectionDark: Color(0x335B7EC2),
        // Navigation
        navBarBackground: Color(0xFFFFFFFF),
        navBarBackgroundDark: Color(0xFF182636),
        navBarSelectedItem: Color(0xFF3B5998),
        navBarSelectedItemDark: Color(0xFF5B7EC2),
        navBarUnselectedItem: Color(0xFF8895A7),
        navBarUnselectedItemDark: Color(0xFF7B8DA3),
        // Tab bar
        tabBarIndicator: Color(0xFF3B5998),
        tabBarIndicatorDark: Color(0xFF5B7EC2),
        tabBarSelectedLabel: Color(0xFF3B5998),
        tabBarSelectedLabelDark: Color(0xFF5B7EC2),
        tabBarUnselectedLabel: Color(0xFF8895A7),
        tabBarUnselectedLabelDark: Color(0xFF7B8DA3),
        // Chat
        chatBubbleUser: Color(0xFF3B5998),
        chatBubbleUserDark: Color(0xFF2C4373),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFF0F2F5),
        chatBubbleAssistant: Color(0xFFF0F2F5),
        chatBubbleAssistantDark: Color(0xFF253A50),
        chatBubbleAssistantText: Color(0xFF1A2233),
        chatBubbleAssistantTextDark: Color(0xFFF0F2F5),
        // Timeline
        timelineConnector: Color(0xFFE2E5EA),
        timelineConnectorDark: Color(0xFF2D4058),
        timelineDot: Color(0xFF3B5998),
        timelineDotDark: Color(0xFF5B7EC2),
        timelineDateHeader: Color(0xFF5C6878),
        timelineDateHeaderDark: Color(0xFFA3B1C4),
        // Shimmer
        shimmerBase: Color(0xFFECEFF3),
        shimmerBaseDark: Color(0xFF253A50),
        shimmerHighlight: Color(0xFFF7F8FA),
        shimmerHighlightDark: Color(0xFF2D4058),
        // Trip card overlay
        tripCardOverlay: Color(0xFF1A2233),
        tripCardOverlayDark: Color(0xFF000000),
        tripCardTitle: Color(0xFFFFFFFF),
        tripCardTitleDark: Color(0xFFFFFFFF),
        tripCardSubtitle: Color(0xCCFFFFFF),
        tripCardSubtitleDark: Color(0xCCFFFFFF),
        // Switch
        switchActiveTrack: Color(0xFF3B5998),
        switchActiveTrackDark: Color(0xFF5B7EC2),
        switchInactiveTrack: Color(0xFFC8CED6),
        switchInactiveTrackDark: Color(0xFF3D5570),
        switchThumb: Color(0xFFFFFFFF),
        switchThumbDark: Color(0xFFF0F2F5),
        // Tooltip
        tooltipBackground: Color(0xFF1A2233),
        tooltipBackgroundDark: Color(0xFF2D4058),
        tooltipText: Color(0xFFFFFFFF),
        tooltipTextDark: Color(0xFFF0F2F5),
        // Snackbar
        snackbarBackground: Color(0xFF1A2233),
        snackbarBackgroundDark: Color(0xFF2D4058),
        snackbarText: Color(0xFFFFFFFF),
        snackbarTextDark: Color(0xFFF0F2F5),
        // Divider
        divider: Color(0xFFE2E5EA),
        dividerDark: Color(0xFF2D4058),
        // Premium
        premiumGold: Color(0xFFD4A506),
        premiumGoldDark: Color(0xFFE5B820),
        // Highlight
        highlight: Color(0x333B5998),
        highlightDark: Color(0x335B7EC2),
      );

  // ── Typography ──

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Plus Jakarta Sans',
        bodyFamily: 'Plus Jakarta Sans',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 0.95,
        headingScaleFactor: 1.0,
        bodyScaleFactor: 0.93,
        headingWeight: FontWeight.w700,
        titleWeight: FontWeight.w600,
        bodyWeight: FontWeight.w400,
        labelWeight: FontWeight.w500,
        captionWeight: FontWeight.w400,
        headingLetterSpacing: -0.4,
        bodyLetterSpacing: 0.0,
        labelLetterSpacing: 0.5,
        captionLetterSpacing: 0.2,
        headingLineHeight: 1.2,
        bodyLineHeight: 1.55,
        captionLineHeight: 1.3,
      );

  // ── Shape — Dual Geometry ──

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 12,
        buttonRadius: 8,
        inputRadius: 8,
        dialogRadius: 16,
        glassRadius: 16,
        glassPillRadius: 12,
        badgeRadius: 9999,
        photoRadius: 8,
        chipRadius: 9999, // Pill — interactive family
        avatarRadius: 9999,
        tooltipRadius: 6,
        snackbarRadius: 10,
        fabRadius: 16, // Rounded square, not circle
        menuRadius: 12,
        popupRadius: 12,
        bannerRadius: 12,
        searchBarRadius: 9999, // Pill — interactive family
        tabIndicatorRadius: 9999, // Pill — signature element
        bottomSheetRadius: 16,
        cardInnerRadius: 8,
      );

  // ── Effects — minimal, clean ──

  @override
  SkinEffects get effects => SkinEffects(
        // Glass — very subtle
        glassFillOpacityDark: 0.08,
        glassFillOpacityLight: 0.65,
        glassBorderOpacityDark: 0.10,
        glassBorderOpacityLight: 0.35,
        glassBorderWidth: 1.0,
        glassBlurSigma: 16,
        glassDialogFillOpacityDark: 0.10,
        glassDialogFillOpacityLight: 0.70,
        glassDialogBorderOpacityDark: 0.12,
        glassDialogBorderOpacityLight: 0.45,
        // Shadows (light) — barely there
        shadowSm: const [
          BoxShadow(color: Color(0x0A1A2233), blurRadius: 2, offset: Offset(0, 1)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x0F1A2233), blurRadius: 8, offset: Offset(0, 2)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x141A2233), blurRadius: 16, offset: Offset(0, 4)),
        ],
        // Shadows (dark)
        shadowSmDark: const [
          BoxShadow(color: Color(0x40000000), blurRadius: 2, offset: Offset(0, 1)),
        ],
        shadowMdDark: const [
          BoxShadow(color: Color(0x59000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
        shadowLgDark: const [
          BoxShadow(color: Color(0x73000000), blurRadius: 16, offset: Offset(0, 4)),
        ],
        // No glow
        glowPrimary: null,
        glowSecondary: null,
        // Animation — snappy
        durationFast: const Duration(milliseconds: 120),
        durationNormal: const Duration(milliseconds: 220),
        durationSlow: const Duration(milliseconds: 400),
        curveDefault: Curves.easeOut,
        curveSmooth: Curves.fastOutSlowIn,
        hoverScaleFactor: 1.015,
        pressScaleFactor: 0.985,
        hoverElevationBoost: 2.0,
        // Feature flags
        enableGlass: true,
        enableGlow: false,
        enableShadows: true,
        enableAnimations: true,
        enableBlur: true,
      );

  // ── Spacing — efficient, not cramped ──

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 14,
        cardContentPaddingCompact: 10,
        cardGap: 10,
        cardHeaderGap: 4,
        cardFooterGap: 8,
        cardPhotoGap: 10,
        screenPaddingHorizontal: 20,
        screenPaddingTop: 16,
        screenPaddingBottom: 16,
        sectionSpacing: 28,
        sectionHeaderBottomSpacing: 10,
        sectionDividerSpacing: 16,
        dialogContentPadding: 24,
        dialogTitleBottomSpacing: 14,
        dialogActionSpacing: 8,
        dialogActionTopSpacing: 24,
        buttonPaddingHorizontal: 24,
        buttonPaddingVertical: 12,
        buttonPaddingHorizontalSm: 14,
        buttonPaddingVerticalSm: 6,
        buttonGap: 8,
        buttonIconGap: 8,
        inputContentPadding: 14,
        inputLabelSpacing: 6,
        inputHelperSpacing: 4,
        inputGroupSpacing: 16,
        listItemPaddingVertical: 12,
        listItemPaddingHorizontal: 16,
        chipPaddingHorizontal: 14,
        chipPaddingVertical: 5,
        chipSpacing: 6,
        badgePaddingHorizontal: 8,
        badgePaddingVertical: 2,
        iconTextGap: 8,
        iconPadding: 4,
        timelineConnectorWidth: 1.5,
        timelineDotDiameter: 8,
        timelineLeftMargin: 44,
        timelineDateHeaderSpacing: 12,
        photoCarouselGap: 4,
        photoGridGap: 4,
        appBarTitleSpacing: 16,
        appBarActionSpacing: 4,
        tabBarLabelPadding: 16,
        tabBarIndicatorWeight: 2,
        fabMargin: 16,
        fabExtendedPadding: 20,
        snackbarMargin: 10,
        snackbarContentPadding: 14,
        tooltipPadding: 8,
        tooltipMargin: 8,
      );

  // ── Sizing — slightly compact ──

  @override
  SkinSizing get sizing => const SkinSizing(
        appBarHeight: 52,
        appBarElevation: 0,
        appBarCenterTitle: false,
        buttonHeight: 44,
        buttonHeightSm: 32,
        buttonHeightLg: 52,
        buttonMinWidth: 64,
        buttonIconSize: 18,
        iconSize: 22,
        iconSizeSm: 16,
        iconSizeLg: 28,
        avatarSize: 36,
        avatarSizeSm: 24,
        avatarSizeLg: 48,
        chipHeight: 30,
        fabSize: 52,
        fabSizeSm: 36,
        dividerThickness: 1,
        borderWidth: 1,
        borderWidthFocus: 2,
        cardElevation: 0,
        cardBorderWidth: 1,
        dialogElevation: 8,
        scrollbarThickness: 5,
        scrollbarRadius: 3,
        starSize: 14,
        starSpacing: 1,
      );

  // ── Component Styles ──

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        appBarStyle: AppBarVariant.solid,
        cardStyle: CardVariant.bordered, // Border-based separation
        buttonVariant: ButtonVariant.filled,
        buttonTextTransform: TextTransform.none,
        inputVariant: InputVariant.filled, // Filled inputs, no border until focus
        dialogVariant: DialogVariant.standard,
        chipVariant: ChipVariant.outlined, // Pill-shaped outlines
        badgeVariant: BadgeVariant.filled,
        dividerVariant: DividerVariant.solid,
        photoShape: PhotoShape.rounded,
        iconVariant: IconVariant.outlined, // Clean line icons
        loadingVariant: LoadingVariant.shimmer,
        tabIndicatorVariant: TabIndicatorVariant.pill, // Signature Atlas element
        switchVariant: SwitchVariant.material,
        showCardBorder: true,
        showCardShadow: false, // Borders only, no shadows
        showInputBorder: false, // Filled style — border only on focus
        showInputFill: true,
        showButtonShadow: false,
        showPhotoOverlayGradient: true,
        useRippleEffect: true,
        showScrollbar: true,
        showDividers: true,
        showTimelineConnectors: true,
        animatePageTransitions: true,
        animateCardHover: true,
        tripCardOverlayOpacity: 0.45,
        photoOverlayGradientStops: [0.0, 0.5, 1.0],
        photoOverlayGradientOpacities: [0.0, 0.12, 0.6],
      );

  // ── Domain Colors — clean, minimal palette ──

  @override
  SkinDomainColors? get domainColors => const SkinDomainColors(
        flight: Color(0xFF3B5998), // Primary blue
        train: Color(0xFF5FB5A2), // Seafoam
        car: Color(0xFF7A8599), // Neutral slate
        bus: Color(0xFF8E7A65), // Warm gray-brown
        ferry: Color(0xFF5D8FA8), // Ocean blue
        cruise: Color(0xFF3E708A), // Deep ocean
        subway: Color(0xFF8B6FA8), // Muted purple
        hotel: Color(0xFF3B5998), // Primary blue
        restaurant: Color(0xFFE07A5F), // Coral accent
        activity: Color(0xFF5FB5A2), // Seafoam accent
        attraction: Color(0xFFE5A84B), // Warm amber
        rental: Color(0xFF7A8599), // Neutral slate
      );
}
