import 'package:flutter/material.dart';

/// Complete color palette for a skin. Defines both light and dark mode colors.
///
/// Skins provide all colors — widgets never reference hardcoded hex values.
/// Use the convenience methods [bg], [surf], [txt], [brd] for isDark-aware access.
class SkinColors {
  const SkinColors({
    // Core palette
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    // Tertiary / Accent
    this.tertiary,
    this.tertiaryForeground,
    this.accent,
    this.accentForeground,
    // Backgrounds (light)
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.surfaceVariant,
    // Backgrounds (dark)
    required this.backgroundDark,
    required this.surfaceDark,
    required this.surfaceDarkElevated,
    required this.surfaceDarkVariant,
    // Text (light)
    required this.text,
    required this.textMuted,
    required this.textSubtle,
    required this.textDisabled,
    // Text (dark)
    required this.textDark,
    required this.textDarkMuted,
    required this.textDarkSubtle,
    required this.textDarkDisabled,
    // Text special
    this.textLink,
    this.textLinkDark,
    this.textOnPhoto,
    this.textOnPhotoDark,
    // Borders (light)
    required this.border,
    required this.borderSubtle,
    required this.borderStrong,
    // Borders (dark)
    required this.borderDark,
    required this.borderDarkSubtle,
    required this.borderDarkStrong,
    // Status
    required this.success,
    required this.successLight,
    required this.successDark,
    required this.warning,
    required this.warningLight,
    required this.warningDark,
    required this.error,
    required this.errorLight,
    required this.errorDark,
    required this.info,
    required this.infoLight,
    required this.infoDark,
    // Components (light)
    required this.inputBackground,
    required this.inputBorder,
    required this.inputBorderFocused,
    required this.buttonPrimary,
    required this.buttonPrimaryText,
    required this.buttonSecondary,
    required this.buttonSecondaryText,
    // Components (dark)
    required this.inputBackgroundDark,
    required this.inputBorderDark,
    required this.inputBorderFocusedDark,
    required this.buttonPrimaryDark,
    required this.buttonPrimaryTextDark,
    required this.buttonSecondaryDark,
    required this.buttonSecondaryTextDark,
    // Button danger
    this.buttonDanger,
    this.buttonDangerText,
    this.buttonDangerDark,
    this.buttonDangerTextDark,
    // Special
    required this.shadow,
    required this.shadowDark,
    required this.scrim,
    required this.scrimDark,
    required this.selection,
    required this.selectionDark,
    // Navigation
    this.navBarBackground,
    this.navBarBackgroundDark,
    this.navBarSelectedItem,
    this.navBarSelectedItemDark,
    this.navBarUnselectedItem,
    this.navBarUnselectedItemDark,
    // Tab bar
    this.tabBarIndicator,
    this.tabBarIndicatorDark,
    this.tabBarSelectedLabel,
    this.tabBarSelectedLabelDark,
    this.tabBarUnselectedLabel,
    this.tabBarUnselectedLabelDark,
    // Chat / AI
    this.chatBubbleUser,
    this.chatBubbleUserDark,
    this.chatBubbleUserText,
    this.chatBubbleUserTextDark,
    this.chatBubbleAssistant,
    this.chatBubbleAssistantDark,
    this.chatBubbleAssistantText,
    this.chatBubbleAssistantTextDark,
    // Timeline
    this.timelineConnector,
    this.timelineConnectorDark,
    this.timelineDot,
    this.timelineDotDark,
    this.timelineDateHeader,
    this.timelineDateHeaderDark,
    // Shimmer / Loading
    this.shimmerBase,
    this.shimmerBaseDark,
    this.shimmerHighlight,
    this.shimmerHighlightDark,
    // Trip card overlay
    this.tripCardOverlay,
    this.tripCardOverlayDark,
    this.tripCardTitle,
    this.tripCardTitleDark,
    this.tripCardSubtitle,
    this.tripCardSubtitleDark,
    // Toggle / Switch
    this.switchActiveTrack,
    this.switchActiveTrackDark,
    this.switchInactiveTrack,
    this.switchInactiveTrackDark,
    this.switchThumb,
    this.switchThumbDark,
    // Tooltip
    this.tooltipBackground,
    this.tooltipBackgroundDark,
    this.tooltipText,
    this.tooltipTextDark,
    // Snackbar
    this.snackbarBackground,
    this.snackbarBackgroundDark,
    this.snackbarText,
    this.snackbarTextDark,
    // Divider
    this.divider,
    this.dividerDark,
    // Premium/special
    this.premiumGold,
    this.premiumGoldDark,
    // Highlight / Marker
    this.highlight,
    this.highlightDark,
  });

  // ── Core palette ──
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;

  // ── Tertiary / Accent ──
  /// Optional third brand color. Falls back to [secondary] if null.
  /// Screen: decorative accents, tertiary buttons, category highlights.
  final Color? tertiary;
  final Color? tertiaryForeground;
  /// Optional pure accent color for highlights. Falls back to [primary] if null.
  /// Screen: links, active indicators, selection highlights.
  final Color? accent;
  final Color? accentForeground;

  // ── Backgrounds (light) ──
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color surfaceVariant;

  // ── Backgrounds (dark) ──
  final Color backgroundDark;
  final Color surfaceDark;
  final Color surfaceDarkElevated;
  final Color surfaceDarkVariant;

  // ── Text (light) ──
  final Color text;
  final Color textMuted;
  final Color textSubtle;
  final Color textDisabled;

  // ── Text (dark) ──
  final Color textDark;
  final Color textDarkMuted;
  final Color textDarkSubtle;
  final Color textDarkDisabled;

  // ── Borders (light) ──
  final Color border;
  final Color borderSubtle;
  final Color borderStrong;

  // ── Borders (dark) ──
  final Color borderDark;
  final Color borderDarkSubtle;
  final Color borderDarkStrong;

  // ── Status ──
  final Color success;
  final Color successLight;
  final Color successDark;
  final Color warning;
  final Color warningLight;
  final Color warningDark;
  final Color error;
  final Color errorLight;
  final Color errorDark;
  final Color info;
  final Color infoLight;
  final Color infoDark;

  // ── Components (light) ──
  final Color inputBackground;
  final Color inputBorder;
  final Color inputBorderFocused;
  final Color buttonPrimary;
  final Color buttonPrimaryText;
  final Color buttonSecondary;
  final Color buttonSecondaryText;

  // ── Components (dark) ──
  final Color inputBackgroundDark;
  final Color inputBorderDark;
  final Color inputBorderFocusedDark;
  final Color buttonPrimaryDark;
  final Color buttonPrimaryTextDark;
  final Color buttonSecondaryDark;
  final Color buttonSecondaryTextDark;

  // ── Text special ──
  /// Link/URL text color. Null = use [primary].
  final Color? textLink;
  final Color? textLinkDark;
  /// Text color on photo overlays. Null = use Colors.white.
  final Color? textOnPhoto;
  final Color? textOnPhotoDark;

  // ── Button danger ──
  /// Destructive button color. Null = use [error].
  final Color? buttonDanger;
  final Color? buttonDangerText;
  final Color? buttonDangerDark;
  final Color? buttonDangerTextDark;

  // ── Special ──
  final Color shadow;
  final Color shadowDark;
  final Color scrim;
  final Color scrimDark;
  final Color selection;
  final Color selectionDark;

  // ── Navigation bar ──
  /// Bottom navigation bar background. Null = use [surface].
  final Color? navBarBackground;
  final Color? navBarBackgroundDark;
  /// Selected nav item color. Null = use [primary].
  final Color? navBarSelectedItem;
  final Color? navBarSelectedItemDark;
  /// Unselected nav item color. Null = use [textMuted].
  final Color? navBarUnselectedItem;
  final Color? navBarUnselectedItemDark;

  // ── Tab bar ──
  /// Tab bar indicator (underline/pill) color. Null = use [primary].
  final Color? tabBarIndicator;
  final Color? tabBarIndicatorDark;
  /// Selected tab label color. Null = use [primary].
  final Color? tabBarSelectedLabel;
  final Color? tabBarSelectedLabelDark;
  /// Unselected tab label color. Null = use [textMuted].
  final Color? tabBarUnselectedLabel;
  final Color? tabBarUnselectedLabelDark;

  // ── Chat / AI ──
  /// User chat bubble background. Null = use [primary].
  /// Screen: Gemini AI chat sidebar, trip assistant.
  final Color? chatBubbleUser;
  final Color? chatBubbleUserDark;
  final Color? chatBubbleUserText;
  final Color? chatBubbleUserTextDark;
  /// Assistant chat bubble background. Null = use [surfaceVariant].
  final Color? chatBubbleAssistant;
  final Color? chatBubbleAssistantDark;
  final Color? chatBubbleAssistantText;
  final Color? chatBubbleAssistantTextDark;

  // ── Timeline ──
  /// Vertical connector line color. Null = use [borderSubtle].
  /// Screen: trip timeline view — the line connecting events.
  final Color? timelineConnector;
  final Color? timelineConnectorDark;
  /// Timeline dot/circle color. Null = use [primary].
  final Color? timelineDot;
  final Color? timelineDotDark;
  /// Date header text color in timeline. Null = use [textMuted].
  final Color? timelineDateHeader;
  final Color? timelineDateHeaderDark;

  // ── Shimmer / Loading ──
  /// Shimmer skeleton base color. Null = derive from [surfaceVariant].
  /// Screen: all loading skeleton states.
  final Color? shimmerBase;
  final Color? shimmerBaseDark;
  /// Shimmer sweep highlight color. Null = derive from [surfaceElevated].
  final Color? shimmerHighlight;
  final Color? shimmerHighlightDark;

  // ── Trip card overlay ──
  /// Overlay color on trip card background images. Null = use Colors.black.
  /// Screen: home screen trip grid cards.
  final Color? tripCardOverlay;
  final Color? tripCardOverlayDark;
  /// Trip card title text color (over photo). Null = use Colors.white.
  final Color? tripCardTitle;
  final Color? tripCardTitleDark;
  /// Trip card subtitle text color (over photo). Null = use Colors.white70.
  final Color? tripCardSubtitle;
  final Color? tripCardSubtitleDark;

  // ── Toggle / Switch ──
  /// Active switch track color. Null = use [primary].
  final Color? switchActiveTrack;
  final Color? switchActiveTrackDark;
  /// Inactive switch track color. Null = derive from [border].
  final Color? switchInactiveTrack;
  final Color? switchInactiveTrackDark;
  /// Switch thumb color. Null = use Colors.white.
  final Color? switchThumb;
  final Color? switchThumbDark;

  // ── Tooltip ──
  /// Tooltip background. Null = use inverse surface.
  final Color? tooltipBackground;
  final Color? tooltipBackgroundDark;
  /// Tooltip text. Null = use inverse text.
  final Color? tooltipText;
  final Color? tooltipTextDark;

  // ── Snackbar ──
  /// Snackbar background. Null = use inverse surface.
  final Color? snackbarBackground;
  final Color? snackbarBackgroundDark;
  /// Snackbar text. Null = use inverse text.
  final Color? snackbarText;
  final Color? snackbarTextDark;

  // ── Divider ──
  /// Explicit divider color. Null = use [border].
  final Color? divider;
  final Color? dividerDark;

  // ── Premium / Special ──
  /// Gold color for premium badges. Null = use Color(0xFFD4A506).
  final Color? premiumGold;
  final Color? premiumGoldDark;
  /// Text highlight/marker color. Null = use [selection].
  final Color? highlight;
  final Color? highlightDark;

  // ── Convenience (isDark-aware) ──

  Color bg(bool isDark) => isDark ? backgroundDark : background;
  Color surf(bool isDark) => isDark ? surfaceDark : surface;
  Color surfElevated(bool isDark) => isDark ? surfaceDarkElevated : surfaceElevated;
  Color surfVariant(bool isDark) => isDark ? surfaceDarkVariant : surfaceVariant;
  Color txt(bool isDark) => isDark ? textDark : text;
  Color txtMuted(bool isDark) => isDark ? textDarkMuted : textMuted;
  Color txtSubtle(bool isDark) => isDark ? textDarkSubtle : textSubtle;
  Color txtDisabled(bool isDark) => isDark ? textDarkDisabled : textDisabled;
  Color brd(bool isDark) => isDark ? borderDark : border;
  Color brdSubtle(bool isDark) => isDark ? borderDarkSubtle : borderSubtle;
  Color brdStrong(bool isDark) => isDark ? borderDarkStrong : borderStrong;
  Color inputBg(bool isDark) => isDark ? inputBackgroundDark : inputBackground;
  Color inputBrd(bool isDark) => isDark ? inputBorderDark : inputBorder;
  Color inputBrdFocused(bool isDark) => isDark ? inputBorderFocusedDark : inputBorderFocused;
  Color btnPrimary(bool isDark) => isDark ? buttonPrimaryDark : buttonPrimary;
  Color btnPrimaryTxt(bool isDark) => isDark ? buttonPrimaryTextDark : buttonPrimaryText;
  Color btnSecondary(bool isDark) => isDark ? buttonSecondaryDark : buttonSecondary;
  Color btnSecondaryTxt(bool isDark) => isDark ? buttonSecondaryTextDark : buttonSecondaryText;
  Color shadowColor(bool isDark) => isDark ? shadowDark : shadow;
  Color scrimColor(bool isDark) => isDark ? scrimDark : scrim;
  Color selectionColor(bool isDark) => isDark ? selectionDark : selection;

  // ── Extended convenience ──

  Color linkColor(bool isDark) => isDark ? (textLinkDark ?? primaryLight) : (textLink ?? primary);
  Color onPhotoText(bool isDark) => isDark ? (textOnPhotoDark ?? const Color(0xFFFFFFFF)) : (textOnPhoto ?? const Color(0xFFFFFFFF));

  Color btnDanger(bool isDark) => isDark ? (buttonDangerDark ?? error) : (buttonDanger ?? error);
  Color btnDangerTxt(bool isDark) => isDark ? (buttonDangerTextDark ?? const Color(0xFFFFFFFF)) : (buttonDangerText ?? const Color(0xFFFFFFFF));

  Color navBg(bool isDark) => isDark ? (navBarBackgroundDark ?? surfaceDark) : (navBarBackground ?? surface);
  Color navSelected(bool isDark) => isDark ? (navBarSelectedItemDark ?? primaryLight) : (navBarSelectedItem ?? primary);
  Color navUnselected(bool isDark) => isDark ? (navBarUnselectedItemDark ?? textDarkMuted) : (navBarUnselectedItem ?? textMuted);

  Color tabIndicator(bool isDark) => isDark ? (tabBarIndicatorDark ?? primaryLight) : (tabBarIndicator ?? primary);
  Color tabSelected(bool isDark) => isDark ? (tabBarSelectedLabelDark ?? primaryLight) : (tabBarSelectedLabel ?? primary);
  Color tabUnselected(bool isDark) => isDark ? (tabBarUnselectedLabelDark ?? textDarkMuted) : (tabBarUnselectedLabel ?? textMuted);

  Color chatUserBg(bool isDark) => isDark ? (chatBubbleUserDark ?? primary) : (chatBubbleUser ?? primary);
  Color chatUserTxt(bool isDark) => isDark ? (chatBubbleUserTextDark ?? primaryForeground) : (chatBubbleUserText ?? primaryForeground);
  Color chatAiBg(bool isDark) => isDark ? (chatBubbleAssistantDark ?? surfaceDarkVariant) : (chatBubbleAssistant ?? surfaceVariant);
  Color chatAiTxt(bool isDark) => isDark ? (chatBubbleAssistantTextDark ?? textDark) : (chatBubbleAssistantText ?? text);

  Color tlConnector(bool isDark) => isDark ? (timelineConnectorDark ?? borderDarkSubtle) : (timelineConnector ?? borderSubtle);
  Color tlDot(bool isDark) => isDark ? (timelineDotDark ?? primaryLight) : (timelineDot ?? primary);
  Color tlDateHeader(bool isDark) => isDark ? (timelineDateHeaderDark ?? textDarkMuted) : (timelineDateHeader ?? textMuted);

  Color shimBase(bool isDark) => isDark ? (shimmerBaseDark ?? surfaceDarkVariant) : (shimmerBase ?? surfaceVariant);
  Color shimHighlight(bool isDark) => isDark ? (shimmerHighlightDark ?? surfaceDarkElevated) : (shimmerHighlight ?? surfaceElevated);

  Color tripOverlay(bool isDark) => isDark ? (tripCardOverlayDark ?? const Color(0xFF000000)) : (tripCardOverlay ?? const Color(0xFF000000));
  Color tripTitle(bool isDark) => isDark ? (tripCardTitleDark ?? const Color(0xFFFFFFFF)) : (tripCardTitle ?? const Color(0xFFFFFFFF));
  Color tripSubtitle(bool isDark) => isDark ? (tripCardSubtitleDark ?? const Color(0xB3FFFFFF)) : (tripCardSubtitle ?? const Color(0xB3FFFFFF));

  Color switchTrackActive(bool isDark) => isDark ? (switchActiveTrackDark ?? primaryLight) : (switchActiveTrack ?? primary);
  Color switchTrackInactive(bool isDark) => isDark ? (switchInactiveTrackDark ?? borderDark) : (switchInactiveTrack ?? border);
  Color switchThumbColor(bool isDark) => isDark ? (switchThumbDark ?? const Color(0xFFFFFFFF)) : (switchThumb ?? const Color(0xFFFFFFFF));

  Color tooltipBg(bool isDark) => isDark ? (tooltipBackgroundDark ?? const Color(0xFF1E1E1E)) : (tooltipBackground ?? const Color(0xFF333333));
  Color tooltipTxt(bool isDark) => isDark ? (tooltipTextDark ?? const Color(0xFFFFFFFF)) : (tooltipText ?? const Color(0xFFFFFFFF));

  Color snackBg(bool isDark) => isDark ? (snackbarBackgroundDark ?? const Color(0xFF333333)) : (snackbarBackground ?? const Color(0xFF1E1E1E));
  Color snackTxt(bool isDark) => isDark ? (snackbarTextDark ?? const Color(0xFFFFFFFF)) : (snackbarText ?? const Color(0xFFFFFFFF));

  Color div(bool isDark) => isDark ? (dividerDark ?? borderDark) : (divider ?? border);

  Color gold(bool isDark) => isDark ? (premiumGoldDark ?? const Color(0xFFD4A506)) : (premiumGold ?? const Color(0xFFD4A506));
  Color hlColor(bool isDark) => isDark ? (highlightDark ?? selectionDark) : (highlight ?? selection);
}
