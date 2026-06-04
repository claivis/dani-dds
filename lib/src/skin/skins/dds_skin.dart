import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// DDS (Dani Design System) skin — monochrome base with Dot Red accent.
///
/// Translates canonical tokens from shared/design/dds-tokens.yaml into
/// the DaniSkin system. Space Grotesk for body/UI, Space Mono for data.
/// Rectangular discipline (4px radii), hairline borders, no shadows/gradients.
/// All dani products use the same Dot Red UI accent.
class DdsSkin extends DaniSkin {
  const DdsSkin();

  // Dot Red — unified UI accent for all dani products
  static const _accentDark = Color(0xFFFF2D2D);    // Dot Red dark
  static const _accentLight = Color(0xFFE80000);   // Dot Red light

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'dds',
        name: 'DDS',
        description: 'Dani Design System — monochrome + Dot Red accent',
        previewColor: Color(0xFFFF2D2D),
        isPremium: false,
        category: SkinCategory.minimal,
        tags: ['dds', 'monochrome', 'red', 'system', 'rectangular'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — Dot Red accent
        primary: _accentLight,
        primaryLight: _accentDark,
        primaryDark: _accentLight,
        primaryForeground: Color(0xFFFFFFFF),
        secondary: Color(0xFF6B7280),
        secondaryForeground: Color(0xFFFFFFFF),
        // Backgrounds (light) — standard light
        background: Color(0xFFF9FAFB),
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFF3F4F6),
        surfaceVariant: Color(0xFFF3F4F6),
        // Backgrounds (dark) — standard dark
        backgroundDark: Color(0xFF111827),
        surfaceDark: Color(0xFF1F2937),
        surfaceDarkElevated: Color(0xFF374151),
        surfaceDarkVariant: Color(0xFF283040),
        // Text (light)
        text: Color(0xFF111827),
        textMuted: Color(0xFF6B7280),
        textSubtle: Color(0xFF9CA3AF),
        textDisabled: Color(0xFFD1D5DB),
        // Text (dark)
        textDark: Color(0xFFF9FAFB),
        textDarkMuted: Color(0xFF9CA3AF),
        textDarkSubtle: Color(0xFF6B7280),
        textDarkDisabled: Color(0xFF4B5563),
        // Borders (light)
        border: Color(0xFFE5E7EB),
        borderSubtle: Color(0xFFF3F4F6),
        borderStrong: Color(0xFFD1D5DB),
        // Borders (dark)
        borderDark: Color(0xFF374151),
        borderDarkSubtle: Color(0xFF283040),
        borderDarkStrong: Color(0xFF4B5563),
        // Status
        success: Color(0xFF3AFF7D),
        successLight: Color(0xFF5CFF96),
        successDark: Color(0xFF0A8F3D),
        warning: Color(0xFFFFB300),
        warningLight: Color(0xFFFFCC33),
        warningDark: Color(0xFF8F5C00),
        error: Color(0xFFFF2D2D),
        errorLight: Color(0xFFFF5C5C),
        errorDark: Color(0xFFE80000),
        info: Color(0xFF00B8FF),
        infoLight: Color(0xFF33C8FF),
        infoDark: Color(0xFF0070B2),
        // Components (light)
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFFE5E7EB),
        inputBorderFocused: _accentLight,
        buttonPrimary: _accentLight,
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFFFFFFF),
        buttonSecondaryText: Color(0xFF111827),
        // Components (dark)
        inputBackgroundDark: Color(0xFF1F2937),
        inputBorderDark: Color(0xFF374151),
        inputBorderFocusedDark: _accentDark,
        buttonPrimaryDark: _accentDark,
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF1F2937),
        buttonSecondaryTextDark: Color(0xFFF9FAFB),
        // Special
        shadow: Color(0xFF000000),
        shadowDark: Color(0xFF000000),
        scrim: Color(0x99000000),
        scrimDark: Color(0x99000000),
        selection: Color(0x1AE80000),  // Dot Red at low opacity
        selectionDark: Color(0x1AFF2D2D),
        // Timeline
        timelineConnector: Color(0xFFE5E7EB),
        timelineConnectorDark: Color(0xFF374151),
        timelineDot: _accentLight,
        timelineDotDark: _accentDark,
        timelineDateHeader: Color(0xFF6B7280),
        timelineDateHeaderDark: Color(0xFF9CA3AF),
        // Tab bar
        tabBarIndicator: _accentLight,
        tabBarIndicatorDark: _accentDark,
        tabBarSelectedLabel: _accentLight,
        tabBarSelectedLabelDark: _accentDark,
        tabBarUnselectedLabel: Color(0xFF6B7280),
        tabBarUnselectedLabelDark: Color(0xFF9CA3AF),
        // Chat
        chatBubbleUser: _accentLight,
        chatBubbleUserDark: _accentDark,
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFFFFFFF),
        chatBubbleAssistant: Color(0xFFF3F4F6),
        chatBubbleAssistantDark: Color(0xFF283040),
        chatBubbleAssistantText: Color(0xFF111827),
        chatBubbleAssistantTextDark: Color(0xFFF9FAFB),
        // Shimmer
        shimmerBase: Color(0xFFF3F4F6),
        shimmerBaseDark: Color(0xFF283040),
        shimmerHighlight: Color(0xFFFFFFFF),
        shimmerHighlightDark: Color(0xFF374151),
      );

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Space Grotesk',
        bodyFamily: 'Space Grotesk',
        monoFamily: 'Space Mono',
        scaleFactor: 1.0,
        headingWeight: FontWeight.w600,
        bodyWeight: FontWeight.w500,
        headingLetterSpacing: -0.01,
        bodyLetterSpacing: 0.0,
        headingLineHeight: 1.2,
        bodyLineHeight: 1.5,
      );

  @override
  SkinShape get shape => const SkinShape(
        // Rectangular discipline — 4px on controls, 2px on small items
        cardRadius: 4,
        buttonRadius: 4,
        inputRadius: 4,
        dialogRadius: 4,
        glassRadius: 4,
        glassPillRadius: 4,
        badgeRadius: 2,
        photoRadius: 4,
        chipRadius: 4,
      );

  @override
  SkinEffects get effects => const SkinEffects(
        // No glass, no glow, no blur — DDS rule: no gradients, no shadows
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
        enableBlur: false,
        // No shadows — borders only
        shadowSm: [],
        shadowMd: [],
        shadowLg: [],
        shadowSmDark: [],
        shadowMdDark: [],
        shadowLgDark: [],
        hoverScaleFactor: 1.0,
        pressScaleFactor: 1.0,
        hoverElevationBoost: 0,
      );

  @override
  SkinSpacing get spacing => const SkinSpacing(
        // DDS 4px grid
        cardContentPadding: 18,  // dot-tokens: card_padding
        cardGap: 14,             // dot-tokens: card_gap
        buttonPaddingHorizontal: 16,
        buttonPaddingVertical: 14,
        sectionSpacing: 24,      // dot-tokens: section_gap
        chipPaddingHorizontal: 8,
        chipPaddingVertical: 4,
        iconTextGap: 8,          // dot-tokens: sm
        dialogContentPadding: 18,
        timelineConnectorWidth: 1,  // hairline
        timelineDotDiameter: 6,
      );

  @override
  SkinSizing get sizing => const SkinSizing(
        buttonHeight: 44,
        buttonHeightSm: 32,
        cardBorderWidth: 1,      // hairline
        borderWidth: 1,          // hairline
        borderWidthThick: 2,     // strong
        dividerThickness: 1,     // hairline
        iconSize: 18,
        appBarCenterTitle: false,
        appBarHeight: 48,
        scrollbarThickness: 4,
        scrollbarRadius: 2,
      );

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        // Use the standard per-type colors (null = fall through to AppColors defaults)
        flight: Color(0xFF0EA5E9),     // sky-500
        train: Color(0xFF8B5CF6),      // purple-500
        car: Color(0xFFF59E0B),        // amber-500
        bus: Color(0xFFD97706),        // amber-600
        ferry: Color(0xFF0284C7),      // sky-600
        cruise: Color(0xFF0369A1),     // sky-700
        subway: Color(0xFF06B6D4),     // cyan-500
        hotel: Color(0xFF14B8A6),      // teal-500
        restaurant: Color(0xFFF59E0B), // amber-500
        activity: Color(0xFF10B981),   // emerald-500
        attraction: Color(0xFF10B981), // emerald-500
        rental: Color(0xFFF59E0B),     // amber-500
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
        photoShape: PhotoShape.rounded,
        loadingVariant: LoadingVariant.linear,
        scrollPhysicsVariant: ScrollPhysicsVariant.bouncing,
        tabIndicatorVariant: TabIndicatorVariant.underline,
        showCardBorder: true,
        showCardShadow: false,
        showButtonShadow: false,
        showPhotoOverlayGradient: false,
        useRippleEffect: false,
        animateCardHover: false,
        tripCardOverlayOpacity: 0.5,
      );
}
