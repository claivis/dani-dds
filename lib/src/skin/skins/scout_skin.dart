import 'package:flutter/material.dart';

import '../dani_skin.dart';
import 'dds_skin.dart';

/// dani.scout skin — DDS base (monochrome, rectangular discipline, hairline
/// borders) but with a PINK primary instead of Dot Red.
///
/// Inherits everything from [DdsSkin] (typography, shape, effects, spacing,
/// sizing, domain colors, component styles) and overrides only [meta] and
/// [colors] so scout reads identically to DDS apart from the accent hue.
class ScoutSkin extends DdsSkin {
  const ScoutSkin();

  // Scout Pink — UI accent for dani.scout.
  static const _pink = Color(0xFFEC4899);       // primary
  static const _pinkLight = Color(0xFFF472B6);  // primaryLight
  static const _pinkDark = Color(0xFFDB2777);   // primaryDark

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'scout',
        name: 'Scout',
        description: 'dani.scout — DDS base with a pink accent',
        previewColor: _pink,
        isPremium: false,
        category: SkinCategory.minimal,
        tags: ['scout', 'monochrome', 'pink', 'system', 'rectangular'],
      );

  @override
  SkinColors get colors => const SkinColors(
        // Core — Scout Pink accent
        primary: _pink,
        primaryLight: _pinkLight,
        primaryDark: _pinkDark,
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
        // Components (light) — pink accents
        inputBackground: Color(0xFFFFFFFF),
        inputBorder: Color(0xFFE5E7EB),
        inputBorderFocused: _pink,
        buttonPrimary: _pink,
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFFFFFFF),
        buttonSecondaryText: Color(0xFF111827),
        // Components (dark) — pink accents
        inputBackgroundDark: Color(0xFF1F2937),
        inputBorderDark: Color(0xFF374151),
        inputBorderFocusedDark: _pinkLight,
        buttonPrimaryDark: _pinkLight,
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF1F2937),
        buttonSecondaryTextDark: Color(0xFFF9FAFB),
        // Special
        shadow: Color(0xFF000000),
        shadowDark: Color(0xFF000000),
        scrim: Color(0x99000000),
        scrimDark: Color(0x99000000),
        selection: Color(0x1AEC4899),  // Scout Pink at low opacity
        selectionDark: Color(0x1AF472B6),
        // Timeline
        timelineConnector: Color(0xFFE5E7EB),
        timelineConnectorDark: Color(0xFF374151),
        timelineDot: _pink,
        timelineDotDark: _pinkLight,
        timelineDateHeader: Color(0xFF6B7280),
        timelineDateHeaderDark: Color(0xFF9CA3AF),
        // Tab bar
        tabBarIndicator: _pink,
        tabBarIndicatorDark: _pinkLight,
        tabBarSelectedLabel: _pink,
        tabBarSelectedLabelDark: _pinkLight,
        tabBarUnselectedLabel: Color(0xFF6B7280),
        tabBarUnselectedLabelDark: Color(0xFF9CA3AF),
        // Chat
        chatBubbleUser: _pink,
        chatBubbleUserDark: _pinkLight,
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
}
