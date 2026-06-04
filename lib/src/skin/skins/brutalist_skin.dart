import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Raw, developer-aesthetic skin — mono font, zero radii, hard shadows.
class BrutalistSkin extends DaniSkin {
  const BrutalistSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'brutalist',
        name: 'Brutalist',
        description: 'Raw, developer, anti-design',
        previewColor: Color(0xFF000000),
        isPremium: false,
        category: SkinCategory.bold,
        tags: ['mono', 'raw', 'developer', 'sharp', 'high-contrast'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — pure black/white
        primary: Color(0xFF000000),
        primaryLight: Color(0xFF333333),
        primaryDark: Color(0xFF000000),
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFF666666),
        secondaryForeground: Color(0xFFFFFFFF),
        // Backgrounds (light) — pure white
        background: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFF5F5F5),
        surfaceVariant: Color(0xFFF0F0F0),
        // Backgrounds (dark) — pure black
        backgroundDark: Color(0xFF000000),
        surfaceDark: Color(0xFF111111),
        surfaceDarkElevated: Color(0xFF1A1A1A),
        surfaceDarkVariant: Color(0xFF1A1A1A),
        // Text (light) — pure black
        text: Color(0xFF000000),
        textMuted: Color(0xFF444444),
        textSubtle: Color(0xFF666666),
        textDisabled: Color(0xFFAAAAAA),
        // Text (dark) — pure white
        textDark: Color(0xFFFFFFFF),
        textDarkMuted: Color(0xFFBBBBBB),
        textDarkSubtle: Color(0xFF888888),
        textDarkDisabled: Color(0xFF555555),
        // Borders (light) — strong black
        border: Color(0xFF000000),
        borderSubtle: Color(0xFFDDDDDD),
        borderStrong: Color(0xFF000000),
        // Borders (dark) — strong white
        borderDark: Color(0xFFFFFFFF),
        borderDarkSubtle: Color(0xFF333333),
        borderDarkStrong: Color(0xFFFFFFFF),
        // Status — high contrast
        success: Color(0xFF00AA00),
        successLight: Color(0xFF33CC33),
        successDark: Color(0xFF008800),
        warning: Color(0xFFFFAA00),
        warningLight: Color(0xFFFFCC33),
        warningDark: Color(0xFFDD8800),
        error: Color(0xFFFF0000),
        errorLight: Color(0xFFFF4444),
        errorDark: Color(0xFFCC0000),
        info: Color(0xFF0066FF),
        infoLight: Color(0xFF3388FF),
        infoDark: Color(0xFF0044CC),
        // Components (light)
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFF000000),
        inputBorderFocused: Color(0xFF000000),
        buttonPrimary: Color(0xFF000000),
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFFFFFFF),
        buttonSecondaryText: Color(0xFF000000),
        // Components (dark)
        inputBackgroundDark: Color(0xFF111111),
        inputBorderDark: Color(0xFFFFFFFF),
        inputBorderFocusedDark: Color(0xFFFFFFFF),
        buttonPrimaryDark: Color(0xFFFFFFFF),
        buttonPrimaryTextDark: Color(0xFF000000),
        buttonSecondaryDark: Color(0xFF111111),
        buttonSecondaryTextDark: Color(0xFFFFFFFF),
        // Special
        shadow: Color(0xFF000000),
        shadowDark: Color(0xFFFFFFFF),
        scrim: Color(0x99000000),
        scrimDark: Color(0x99000000),
        selection: Color(0x33000000),
        selectionDark: Color(0x33FFFFFF),
        // Timeline
        timelineConnector: Color(0xFF000000),
        timelineConnectorDark: Color(0xFFFFFFFF),
        timelineDot: Color(0xFF000000),
        timelineDotDark: Color(0xFFFFFFFF),
        timelineDateHeader: Color(0xFF444444),
        timelineDateHeaderDark: Color(0xFFBBBBBB),
        // Tab bar
        tabBarIndicator: Color(0xFF000000),
        tabBarIndicatorDark: Color(0xFFFFFFFF),
        tabBarSelectedLabel: Color(0xFF000000),
        tabBarSelectedLabelDark: Color(0xFFFFFFFF),
        tabBarUnselectedLabel: Color(0xFF666666),
        tabBarUnselectedLabelDark: Color(0xFF888888),
        // Chat
        chatBubbleUser: Color(0xFF000000),
        chatBubbleUserDark: Color(0xFFFFFFFF),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFF000000),
        chatBubbleAssistant: Color(0xFFF0F0F0),
        chatBubbleAssistantDark: Color(0xFF1A1A1A),
        chatBubbleAssistantText: Color(0xFF000000),
        chatBubbleAssistantTextDark: Color(0xFFFFFFFF),
        // Shimmer
        shimmerBase: Color(0xFFF0F0F0),
        shimmerBaseDark: Color(0xFF1A1A1A),
        shimmerHighlight: Color(0xFFFFFFFF),
        shimmerHighlightDark: Color(0xFF333333),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'JetBrains Mono',
        bodyFamily: 'JetBrains Mono',
        monoFamily: 'JetBrains Mono',
        scaleFactor: 0.95,
        headingWeight: FontWeight.w700,
        bodyWeight: FontWeight.w400,
        headingLetterSpacing: -0.5,
        bodyLetterSpacing: 0.0,
        headingLineHeight: 1.2,
        bodyLineHeight: 1.5,
      );

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 0, // ALL sharp corners
        buttonRadius: 0,
        inputRadius: 0,
        dialogRadius: 0,
        glassRadius: 0,
        glassPillRadius: 0,
        badgeRadius: 0,
        photoRadius: 0,
        chipRadius: 0,
      );

  @override
  SkinEffects get effects => const SkinEffects(
        // Glass DISABLED
        glassFillOpacityDark: 0.0,
        glassFillOpacityLight: 0.0,
        glassBorderOpacityDark: 0.0,
        glassBorderOpacityLight: 0.0,
        glassBorderWidth: 2.0,
        glassBlurSigma: 0,
        glassDialogFillOpacityDark: 0.0,
        glassDialogFillOpacityLight: 0.0,
        glassDialogBorderOpacityDark: 0.0,
        glassDialogBorderOpacityLight: 0.0,
        enableGlass: false,
        enableGlow: false,
        enableBlur: false,
        // Hard offset shadows — no blur, pure offset
        shadowSm: [
          BoxShadow(color: Color(0xFF000000), blurRadius: 0, offset: Offset(2, 2)),
        ],
        shadowMd: [
          BoxShadow(color: Color(0xFF000000), blurRadius: 0, offset: Offset(3, 3)),
        ],
        shadowLg: [
          BoxShadow(color: Color(0xFF000000), blurRadius: 0, offset: Offset(4, 4)),
        ],
        shadowSmDark: [
          BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 0, offset: Offset(2, 2)),
        ],
        shadowMdDark: [
          BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 0, offset: Offset(3, 3)),
        ],
        shadowLgDark: [
          BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 0, offset: Offset(4, 4)),
        ],
        hoverScaleFactor: 1.0,
        pressScaleFactor: 1.0,
        hoverElevationBoost: 0,
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        cardContentPadding: 10,
        cardGap: 4,
        buttonPaddingHorizontal: 24,
        buttonPaddingVertical: 12,
        sectionSpacing: 16,
        chipPaddingHorizontal: 8,
        chipPaddingVertical: 2,
        iconTextGap: 6,
        dialogContentPadding: 20,
        timelineConnectorWidth: 3,
        timelineDotDiameter: 8,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        buttonHeight: 44,
        buttonHeightSm: 32,
        cardBorderWidth: 2,
        borderWidth: 2,
        borderWidthThick: 3,
        dividerThickness: 2,
        iconSize: 22,
        appBarCenterTitle: false,
        appBarHeight: 52,
        scrollbarThickness: 8,
        scrollbarRadius: 0,
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFF000000),
        train: Color(0xFF000000),
        car: Color(0xFF000000),
        bus: Color(0xFF000000),
        ferry: Color(0xFF000000),
        cruise: Color(0xFF000000),
        subway: Color(0xFF000000),
        hotel: Color(0xFF444444),
        restaurant: Color(0xFF444444),
        activity: Color(0xFF444444),
        attraction: Color(0xFF444444),
        rental: Color(0xFF444444),
      );

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        cardStyle: CardVariant.bordered,
        buttonVariant: ButtonVariant.filled,
        buttonTextTransform: TextTransform.uppercase,
        inputVariant: InputVariant.outlined,
        chipVariant: ChipVariant.outlined,
        iconVariant: IconVariant.sharp,
        dividerVariant: DividerVariant.solid,
        photoShape: PhotoShape.square,
        loadingVariant: LoadingVariant.linear,
        scrollPhysicsVariant: ScrollPhysicsVariant.clamping,
        tabIndicatorVariant: TabIndicatorVariant.underline,
        showCardBorder: true,
        showCardShadow: true,
        showButtonShadow: true,
        showPhotoOverlayGradient: false,
        useRippleEffect: false,
        animateCardHover: false,
        tripCardOverlayOpacity: 0.6,
      );
}
