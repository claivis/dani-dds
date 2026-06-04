import 'package:flutter/material.dart';
import '../skin_colors.dart';
import '../skin_component_styles.dart';
import '../skin_domain_colors.dart';
import '../skin_effects.dart';
import '../skin_meta.dart';
import '../skin_shape.dart';
import '../skin_sizing.dart';
import '../skin_spacing.dart';
import '../skin_typography.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helper functions
// ─────────────────────────────────────────────────────────────────────────────

/// Encode a [Color] to a hex string.
/// Produces "#RRGGBB" when alpha is fully opaque, "#AARRGGBB" otherwise.
String colorToJson(Color c) {
  final argb = c.toARGB32();
  final a = (argb >> 24) & 0xFF;
  if (a == 0xFF) {
    return '#${(argb & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
  return '#${argb.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

/// Decode a hex string ("#RRGGBB" or "#AARRGGBB") to a [Color].
Color colorFromJson(String hex) {
  final s = hex.startsWith('#') ? hex.substring(1) : hex;
  if (s.length == 6) {
    return Color(int.parse('FF$s', radix: 16));
  }
  return Color(int.parse(s, radix: 16));
}

/// Nullable variant of [colorFromJson].
Color? colorFromJsonNullable(String? hex) {
  if (hex == null) return null;
  return colorFromJson(hex);
}

/// Encode a [BoxShadow] to a JSON map.
Map<String, dynamic> boxShadowToJson(BoxShadow s) => {
      'color': colorToJson(s.color),
      'offsetX': s.offset.dx,
      'offsetY': s.offset.dy,
      'blurRadius': s.blurRadius,
      'spreadRadius': s.spreadRadius,
    };

/// Decode a JSON map to a [BoxShadow].
BoxShadow boxShadowFromJson(Map<String, dynamic> j) => BoxShadow(
      color: colorFromJson(j['color'] as String),
      offset: Offset(
        (j['offsetX'] as num).toDouble(),
        (j['offsetY'] as num).toDouble(),
      ),
      blurRadius: (j['blurRadius'] as num).toDouble(),
      spreadRadius: (j['spreadRadius'] as num? ?? 0.0).toDouble(),
    );

/// Encode a list of [BoxShadow] to JSON.
List<Map<String, dynamic>> boxShadowListToJson(List<BoxShadow> list) =>
    list.map(boxShadowToJson).toList();

/// Decode a JSON list to a list of [BoxShadow].
List<BoxShadow> boxShadowListFromJson(List<dynamic> list) =>
    list.map((e) => boxShadowFromJson(e as Map<String, dynamic>)).toList();

/// Encode a [FontWeight] to an integer (100–900).
int fontWeightToJson(FontWeight w) => w.index * 100 + 100;

/// Decode an integer (100–900) to a [FontWeight].
FontWeight fontWeightFromJson(int v) {
  final index = ((v - 100) ~/ 100).clamp(0, FontWeight.values.length - 1);
  return FontWeight.values[index];
}

// ── Curve mapping ────────────────────────────────────────────────────────────

const Map<String, Curve> _curveMap = {
  'easeInOut': Curves.easeInOut,
  'elasticOut': Curves.elasticOut,
  'fastOutSlowIn': Curves.fastOutSlowIn,
  'easeOutCubic': Curves.easeOutCubic,
  'easeOutBack': Curves.easeOutBack,
  'linear': Curves.linear,
  'decelerate': Curves.decelerate,
  'bounceOut': Curves.bounceOut,
  'ease': Curves.ease,
  'easeIn': Curves.easeIn,
  'easeOut': Curves.easeOut,
  'easeInCubic': Curves.easeInCubic,
  'easeInOutCubic': Curves.easeInOutCubic,
  'easeInQuad': Curves.easeInQuad,
  'easeOutQuad': Curves.easeOutQuad,
  'easeInOutQuad': Curves.easeInOutQuad,
  'easeInBack': Curves.easeInBack,
  'easeInOutBack': Curves.easeInOutBack,
  'elasticIn': Curves.elasticIn,
  'elasticInOut': Curves.elasticInOut,
  'bounceIn': Curves.bounceIn,
  'bounceInOut': Curves.bounceInOut,
  'fastLinearToSlowEaseIn': Curves.fastLinearToSlowEaseIn,
  'slowMiddle': Curves.slowMiddle,
};

// Inverse map: Curve instance → name string.
final Map<Curve, String> _curveNameMap = {
  for (final entry in _curveMap.entries) entry.value: entry.key,
};

/// Encode a [Curve] to its string name.
/// Falls back to "easeInOut" for unknown curves.
String curveToJson(Curve c) => _curveNameMap[c] ?? 'easeInOut';

/// Decode a string name to a [Curve].
/// Falls back to [Curves.easeInOut] for unknown names.
Curve curveFromJson(String name) => _curveMap[name] ?? Curves.easeInOut;

// ─────────────────────────────────────────────────────────────────────────────
// SkinMeta
// ─────────────────────────────────────────────────────────────────────────────

extension SkinMetaJson on SkinMeta {
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'previewColor': colorToJson(previewColor),
        if (previewColorSecondary != null)
          'previewColorSecondary': colorToJson(previewColorSecondary!),
        'isPremium': isPremium,
        'author': author,
        'version': version,
        'tags': tags,
        'category': category.name,
        'supportsDarkMode': supportsDarkMode,
      };
}

SkinMeta skinMetaFromJson(Map<String, dynamic> j) => SkinMeta(
      id: j['id'] as String,
      name: j['name'] as String,
      description: j['description'] as String,
      previewColor: colorFromJson(j['previewColor'] as String),
      previewColorSecondary:
          colorFromJsonNullable(j['previewColorSecondary'] as String?),
      isPremium: j['isPremium'] as bool? ?? false,
      author: j['author'] as String? ?? 'dani.go',
      version: j['version'] as String? ?? '1.0.0',
      tags: (j['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      category: SkinCategory.values.firstWhere(
        (e) => e.name == (j['category'] as String?),
        orElse: () => SkinCategory.general,
      ),
      supportsDarkMode: j['supportsDarkMode'] as bool? ?? true,
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinColors
// ─────────────────────────────────────────────────────────────────────────────

extension SkinColorsJson on SkinColors {
  Map<String, dynamic> toJson() => {
        // Required colors
        'primary': colorToJson(primary),
        'primaryLight': colorToJson(primaryLight),
        'primaryDark': colorToJson(primaryDark),
        'primaryForeground': colorToJson(primaryForeground),
        'secondary': colorToJson(secondary),
        'secondaryForeground': colorToJson(secondaryForeground),
        'background': colorToJson(background),
        'surface': colorToJson(surface),
        'surfaceElevated': colorToJson(surfaceElevated),
        'surfaceVariant': colorToJson(surfaceVariant),
        'backgroundDark': colorToJson(backgroundDark),
        'surfaceDark': colorToJson(surfaceDark),
        'surfaceDarkElevated': colorToJson(surfaceDarkElevated),
        'surfaceDarkVariant': colorToJson(surfaceDarkVariant),
        'text': colorToJson(text),
        'textMuted': colorToJson(textMuted),
        'textSubtle': colorToJson(textSubtle),
        'textDisabled': colorToJson(textDisabled),
        'textDark': colorToJson(textDark),
        'textDarkMuted': colorToJson(textDarkMuted),
        'textDarkSubtle': colorToJson(textDarkSubtle),
        'textDarkDisabled': colorToJson(textDarkDisabled),
        'border': colorToJson(border),
        'borderSubtle': colorToJson(borderSubtle),
        'borderStrong': colorToJson(borderStrong),
        'borderDark': colorToJson(borderDark),
        'borderDarkSubtle': colorToJson(borderDarkSubtle),
        'borderDarkStrong': colorToJson(borderDarkStrong),
        'success': colorToJson(success),
        'successLight': colorToJson(successLight),
        'successDark': colorToJson(successDark),
        'warning': colorToJson(warning),
        'warningLight': colorToJson(warningLight),
        'warningDark': colorToJson(warningDark),
        'error': colorToJson(error),
        'errorLight': colorToJson(errorLight),
        'errorDark': colorToJson(errorDark),
        'info': colorToJson(info),
        'infoLight': colorToJson(infoLight),
        'infoDark': colorToJson(infoDark),
        'inputBackground': colorToJson(inputBackground),
        'inputBorder': colorToJson(inputBorder),
        'inputBorderFocused': colorToJson(inputBorderFocused),
        'buttonPrimary': colorToJson(buttonPrimary),
        'buttonPrimaryText': colorToJson(buttonPrimaryText),
        'buttonSecondary': colorToJson(buttonSecondary),
        'buttonSecondaryText': colorToJson(buttonSecondaryText),
        'inputBackgroundDark': colorToJson(inputBackgroundDark),
        'inputBorderDark': colorToJson(inputBorderDark),
        'inputBorderFocusedDark': colorToJson(inputBorderFocusedDark),
        'buttonPrimaryDark': colorToJson(buttonPrimaryDark),
        'buttonPrimaryTextDark': colorToJson(buttonPrimaryTextDark),
        'buttonSecondaryDark': colorToJson(buttonSecondaryDark),
        'buttonSecondaryTextDark': colorToJson(buttonSecondaryTextDark),
        'shadow': colorToJson(shadow),
        'shadowDark': colorToJson(shadowDark),
        'scrim': colorToJson(scrim),
        'scrimDark': colorToJson(scrimDark),
        'selection': colorToJson(selection),
        'selectionDark': colorToJson(selectionDark),
        // Optional colors — only emit when non-null
        if (tertiary != null) 'tertiary': colorToJson(tertiary!),
        if (tertiaryForeground != null)
          'tertiaryForeground': colorToJson(tertiaryForeground!),
        if (accent != null) 'accent': colorToJson(accent!),
        if (accentForeground != null)
          'accentForeground': colorToJson(accentForeground!),
        if (textLink != null) 'textLink': colorToJson(textLink!),
        if (textLinkDark != null) 'textLinkDark': colorToJson(textLinkDark!),
        if (textOnPhoto != null) 'textOnPhoto': colorToJson(textOnPhoto!),
        if (textOnPhotoDark != null)
          'textOnPhotoDark': colorToJson(textOnPhotoDark!),
        if (buttonDanger != null) 'buttonDanger': colorToJson(buttonDanger!),
        if (buttonDangerText != null)
          'buttonDangerText': colorToJson(buttonDangerText!),
        if (buttonDangerDark != null)
          'buttonDangerDark': colorToJson(buttonDangerDark!),
        if (buttonDangerTextDark != null)
          'buttonDangerTextDark': colorToJson(buttonDangerTextDark!),
        if (navBarBackground != null)
          'navBarBackground': colorToJson(navBarBackground!),
        if (navBarBackgroundDark != null)
          'navBarBackgroundDark': colorToJson(navBarBackgroundDark!),
        if (navBarSelectedItem != null)
          'navBarSelectedItem': colorToJson(navBarSelectedItem!),
        if (navBarSelectedItemDark != null)
          'navBarSelectedItemDark': colorToJson(navBarSelectedItemDark!),
        if (navBarUnselectedItem != null)
          'navBarUnselectedItem': colorToJson(navBarUnselectedItem!),
        if (navBarUnselectedItemDark != null)
          'navBarUnselectedItemDark': colorToJson(navBarUnselectedItemDark!),
        if (tabBarIndicator != null)
          'tabBarIndicator': colorToJson(tabBarIndicator!),
        if (tabBarIndicatorDark != null)
          'tabBarIndicatorDark': colorToJson(tabBarIndicatorDark!),
        if (tabBarSelectedLabel != null)
          'tabBarSelectedLabel': colorToJson(tabBarSelectedLabel!),
        if (tabBarSelectedLabelDark != null)
          'tabBarSelectedLabelDark': colorToJson(tabBarSelectedLabelDark!),
        if (tabBarUnselectedLabel != null)
          'tabBarUnselectedLabel': colorToJson(tabBarUnselectedLabel!),
        if (tabBarUnselectedLabelDark != null)
          'tabBarUnselectedLabelDark': colorToJson(tabBarUnselectedLabelDark!),
        if (chatBubbleUser != null)
          'chatBubbleUser': colorToJson(chatBubbleUser!),
        if (chatBubbleUserDark != null)
          'chatBubbleUserDark': colorToJson(chatBubbleUserDark!),
        if (chatBubbleUserText != null)
          'chatBubbleUserText': colorToJson(chatBubbleUserText!),
        if (chatBubbleUserTextDark != null)
          'chatBubbleUserTextDark': colorToJson(chatBubbleUserTextDark!),
        if (chatBubbleAssistant != null)
          'chatBubbleAssistant': colorToJson(chatBubbleAssistant!),
        if (chatBubbleAssistantDark != null)
          'chatBubbleAssistantDark': colorToJson(chatBubbleAssistantDark!),
        if (chatBubbleAssistantText != null)
          'chatBubbleAssistantText': colorToJson(chatBubbleAssistantText!),
        if (chatBubbleAssistantTextDark != null)
          'chatBubbleAssistantTextDark':
              colorToJson(chatBubbleAssistantTextDark!),
        if (timelineConnector != null)
          'timelineConnector': colorToJson(timelineConnector!),
        if (timelineConnectorDark != null)
          'timelineConnectorDark': colorToJson(timelineConnectorDark!),
        if (timelineDot != null) 'timelineDot': colorToJson(timelineDot!),
        if (timelineDotDark != null)
          'timelineDotDark': colorToJson(timelineDotDark!),
        if (timelineDateHeader != null)
          'timelineDateHeader': colorToJson(timelineDateHeader!),
        if (timelineDateHeaderDark != null)
          'timelineDateHeaderDark': colorToJson(timelineDateHeaderDark!),
        if (shimmerBase != null) 'shimmerBase': colorToJson(shimmerBase!),
        if (shimmerBaseDark != null)
          'shimmerBaseDark': colorToJson(shimmerBaseDark!),
        if (shimmerHighlight != null)
          'shimmerHighlight': colorToJson(shimmerHighlight!),
        if (shimmerHighlightDark != null)
          'shimmerHighlightDark': colorToJson(shimmerHighlightDark!),
        if (tripCardOverlay != null)
          'tripCardOverlay': colorToJson(tripCardOverlay!),
        if (tripCardOverlayDark != null)
          'tripCardOverlayDark': colorToJson(tripCardOverlayDark!),
        if (tripCardTitle != null) 'tripCardTitle': colorToJson(tripCardTitle!),
        if (tripCardTitleDark != null)
          'tripCardTitleDark': colorToJson(tripCardTitleDark!),
        if (tripCardSubtitle != null)
          'tripCardSubtitle': colorToJson(tripCardSubtitle!),
        if (tripCardSubtitleDark != null)
          'tripCardSubtitleDark': colorToJson(tripCardSubtitleDark!),
        if (switchActiveTrack != null)
          'switchActiveTrack': colorToJson(switchActiveTrack!),
        if (switchActiveTrackDark != null)
          'switchActiveTrackDark': colorToJson(switchActiveTrackDark!),
        if (switchInactiveTrack != null)
          'switchInactiveTrack': colorToJson(switchInactiveTrack!),
        if (switchInactiveTrackDark != null)
          'switchInactiveTrackDark': colorToJson(switchInactiveTrackDark!),
        if (switchThumb != null) 'switchThumb': colorToJson(switchThumb!),
        if (switchThumbDark != null)
          'switchThumbDark': colorToJson(switchThumbDark!),
        if (tooltipBackground != null)
          'tooltipBackground': colorToJson(tooltipBackground!),
        if (tooltipBackgroundDark != null)
          'tooltipBackgroundDark': colorToJson(tooltipBackgroundDark!),
        if (tooltipText != null) 'tooltipText': colorToJson(tooltipText!),
        if (tooltipTextDark != null)
          'tooltipTextDark': colorToJson(tooltipTextDark!),
        if (snackbarBackground != null)
          'snackbarBackground': colorToJson(snackbarBackground!),
        if (snackbarBackgroundDark != null)
          'snackbarBackgroundDark': colorToJson(snackbarBackgroundDark!),
        if (snackbarText != null) 'snackbarText': colorToJson(snackbarText!),
        if (snackbarTextDark != null)
          'snackbarTextDark': colorToJson(snackbarTextDark!),
        if (divider != null) 'divider': colorToJson(divider!),
        if (dividerDark != null) 'dividerDark': colorToJson(dividerDark!),
        if (premiumGold != null) 'premiumGold': colorToJson(premiumGold!),
        if (premiumGoldDark != null)
          'premiumGoldDark': colorToJson(premiumGoldDark!),
        if (highlight != null) 'highlight': colorToJson(highlight!),
        if (highlightDark != null) 'highlightDark': colorToJson(highlightDark!),
      };
}

SkinColors skinColorsFromJson(Map<String, dynamic> j) => SkinColors(
      primary: colorFromJson(j['primary'] as String),
      primaryLight: colorFromJson(j['primaryLight'] as String),
      primaryDark: colorFromJson(j['primaryDark'] as String),
      primaryForeground: colorFromJson(j['primaryForeground'] as String),
      secondary: colorFromJson(j['secondary'] as String),
      secondaryForeground: colorFromJson(j['secondaryForeground'] as String),
      background: colorFromJson(j['background'] as String),
      surface: colorFromJson(j['surface'] as String),
      surfaceElevated: colorFromJson(j['surfaceElevated'] as String),
      surfaceVariant: colorFromJson(j['surfaceVariant'] as String),
      backgroundDark: colorFromJson(j['backgroundDark'] as String),
      surfaceDark: colorFromJson(j['surfaceDark'] as String),
      surfaceDarkElevated: colorFromJson(j['surfaceDarkElevated'] as String),
      surfaceDarkVariant: colorFromJson(j['surfaceDarkVariant'] as String),
      text: colorFromJson(j['text'] as String),
      textMuted: colorFromJson(j['textMuted'] as String),
      textSubtle: colorFromJson(j['textSubtle'] as String),
      textDisabled: colorFromJson(j['textDisabled'] as String),
      textDark: colorFromJson(j['textDark'] as String),
      textDarkMuted: colorFromJson(j['textDarkMuted'] as String),
      textDarkSubtle: colorFromJson(j['textDarkSubtle'] as String),
      textDarkDisabled: colorFromJson(j['textDarkDisabled'] as String),
      border: colorFromJson(j['border'] as String),
      borderSubtle: colorFromJson(j['borderSubtle'] as String),
      borderStrong: colorFromJson(j['borderStrong'] as String),
      borderDark: colorFromJson(j['borderDark'] as String),
      borderDarkSubtle: colorFromJson(j['borderDarkSubtle'] as String),
      borderDarkStrong: colorFromJson(j['borderDarkStrong'] as String),
      success: colorFromJson(j['success'] as String),
      successLight: colorFromJson(j['successLight'] as String),
      successDark: colorFromJson(j['successDark'] as String),
      warning: colorFromJson(j['warning'] as String),
      warningLight: colorFromJson(j['warningLight'] as String),
      warningDark: colorFromJson(j['warningDark'] as String),
      error: colorFromJson(j['error'] as String),
      errorLight: colorFromJson(j['errorLight'] as String),
      errorDark: colorFromJson(j['errorDark'] as String),
      info: colorFromJson(j['info'] as String),
      infoLight: colorFromJson(j['infoLight'] as String),
      infoDark: colorFromJson(j['infoDark'] as String),
      inputBackground: colorFromJson(j['inputBackground'] as String),
      inputBorder: colorFromJson(j['inputBorder'] as String),
      inputBorderFocused: colorFromJson(j['inputBorderFocused'] as String),
      buttonPrimary: colorFromJson(j['buttonPrimary'] as String),
      buttonPrimaryText: colorFromJson(j['buttonPrimaryText'] as String),
      buttonSecondary: colorFromJson(j['buttonSecondary'] as String),
      buttonSecondaryText: colorFromJson(j['buttonSecondaryText'] as String),
      inputBackgroundDark: colorFromJson(j['inputBackgroundDark'] as String),
      inputBorderDark: colorFromJson(j['inputBorderDark'] as String),
      inputBorderFocusedDark:
          colorFromJson(j['inputBorderFocusedDark'] as String),
      buttonPrimaryDark: colorFromJson(j['buttonPrimaryDark'] as String),
      buttonPrimaryTextDark: colorFromJson(j['buttonPrimaryTextDark'] as String),
      buttonSecondaryDark: colorFromJson(j['buttonSecondaryDark'] as String),
      buttonSecondaryTextDark:
          colorFromJson(j['buttonSecondaryTextDark'] as String),
      shadow: colorFromJson(j['shadow'] as String),
      shadowDark: colorFromJson(j['shadowDark'] as String),
      scrim: colorFromJson(j['scrim'] as String),
      scrimDark: colorFromJson(j['scrimDark'] as String),
      selection: colorFromJson(j['selection'] as String),
      selectionDark: colorFromJson(j['selectionDark'] as String),
      // Optional
      tertiary: colorFromJsonNullable(j['tertiary'] as String?),
      tertiaryForeground:
          colorFromJsonNullable(j['tertiaryForeground'] as String?),
      accent: colorFromJsonNullable(j['accent'] as String?),
      accentForeground: colorFromJsonNullable(j['accentForeground'] as String?),
      textLink: colorFromJsonNullable(j['textLink'] as String?),
      textLinkDark: colorFromJsonNullable(j['textLinkDark'] as String?),
      textOnPhoto: colorFromJsonNullable(j['textOnPhoto'] as String?),
      textOnPhotoDark: colorFromJsonNullable(j['textOnPhotoDark'] as String?),
      buttonDanger: colorFromJsonNullable(j['buttonDanger'] as String?),
      buttonDangerText: colorFromJsonNullable(j['buttonDangerText'] as String?),
      buttonDangerDark: colorFromJsonNullable(j['buttonDangerDark'] as String?),
      buttonDangerTextDark:
          colorFromJsonNullable(j['buttonDangerTextDark'] as String?),
      navBarBackground: colorFromJsonNullable(j['navBarBackground'] as String?),
      navBarBackgroundDark:
          colorFromJsonNullable(j['navBarBackgroundDark'] as String?),
      navBarSelectedItem:
          colorFromJsonNullable(j['navBarSelectedItem'] as String?),
      navBarSelectedItemDark:
          colorFromJsonNullable(j['navBarSelectedItemDark'] as String?),
      navBarUnselectedItem:
          colorFromJsonNullable(j['navBarUnselectedItem'] as String?),
      navBarUnselectedItemDark:
          colorFromJsonNullable(j['navBarUnselectedItemDark'] as String?),
      tabBarIndicator: colorFromJsonNullable(j['tabBarIndicator'] as String?),
      tabBarIndicatorDark:
          colorFromJsonNullable(j['tabBarIndicatorDark'] as String?),
      tabBarSelectedLabel:
          colorFromJsonNullable(j['tabBarSelectedLabel'] as String?),
      tabBarSelectedLabelDark:
          colorFromJsonNullable(j['tabBarSelectedLabelDark'] as String?),
      tabBarUnselectedLabel:
          colorFromJsonNullable(j['tabBarUnselectedLabel'] as String?),
      tabBarUnselectedLabelDark:
          colorFromJsonNullable(j['tabBarUnselectedLabelDark'] as String?),
      chatBubbleUser: colorFromJsonNullable(j['chatBubbleUser'] as String?),
      chatBubbleUserDark:
          colorFromJsonNullable(j['chatBubbleUserDark'] as String?),
      chatBubbleUserText:
          colorFromJsonNullable(j['chatBubbleUserText'] as String?),
      chatBubbleUserTextDark:
          colorFromJsonNullable(j['chatBubbleUserTextDark'] as String?),
      chatBubbleAssistant:
          colorFromJsonNullable(j['chatBubbleAssistant'] as String?),
      chatBubbleAssistantDark:
          colorFromJsonNullable(j['chatBubbleAssistantDark'] as String?),
      chatBubbleAssistantText:
          colorFromJsonNullable(j['chatBubbleAssistantText'] as String?),
      chatBubbleAssistantTextDark:
          colorFromJsonNullable(j['chatBubbleAssistantTextDark'] as String?),
      timelineConnector:
          colorFromJsonNullable(j['timelineConnector'] as String?),
      timelineConnectorDark:
          colorFromJsonNullable(j['timelineConnectorDark'] as String?),
      timelineDot: colorFromJsonNullable(j['timelineDot'] as String?),
      timelineDotDark: colorFromJsonNullable(j['timelineDotDark'] as String?),
      timelineDateHeader:
          colorFromJsonNullable(j['timelineDateHeader'] as String?),
      timelineDateHeaderDark:
          colorFromJsonNullable(j['timelineDateHeaderDark'] as String?),
      shimmerBase: colorFromJsonNullable(j['shimmerBase'] as String?),
      shimmerBaseDark: colorFromJsonNullable(j['shimmerBaseDark'] as String?),
      shimmerHighlight: colorFromJsonNullable(j['shimmerHighlight'] as String?),
      shimmerHighlightDark:
          colorFromJsonNullable(j['shimmerHighlightDark'] as String?),
      tripCardOverlay: colorFromJsonNullable(j['tripCardOverlay'] as String?),
      tripCardOverlayDark:
          colorFromJsonNullable(j['tripCardOverlayDark'] as String?),
      tripCardTitle: colorFromJsonNullable(j['tripCardTitle'] as String?),
      tripCardTitleDark:
          colorFromJsonNullable(j['tripCardTitleDark'] as String?),
      tripCardSubtitle: colorFromJsonNullable(j['tripCardSubtitle'] as String?),
      tripCardSubtitleDark:
          colorFromJsonNullable(j['tripCardSubtitleDark'] as String?),
      switchActiveTrack:
          colorFromJsonNullable(j['switchActiveTrack'] as String?),
      switchActiveTrackDark:
          colorFromJsonNullable(j['switchActiveTrackDark'] as String?),
      switchInactiveTrack:
          colorFromJsonNullable(j['switchInactiveTrack'] as String?),
      switchInactiveTrackDark:
          colorFromJsonNullable(j['switchInactiveTrackDark'] as String?),
      switchThumb: colorFromJsonNullable(j['switchThumb'] as String?),
      switchThumbDark: colorFromJsonNullable(j['switchThumbDark'] as String?),
      tooltipBackground:
          colorFromJsonNullable(j['tooltipBackground'] as String?),
      tooltipBackgroundDark:
          colorFromJsonNullable(j['tooltipBackgroundDark'] as String?),
      tooltipText: colorFromJsonNullable(j['tooltipText'] as String?),
      tooltipTextDark: colorFromJsonNullable(j['tooltipTextDark'] as String?),
      snackbarBackground:
          colorFromJsonNullable(j['snackbarBackground'] as String?),
      snackbarBackgroundDark:
          colorFromJsonNullable(j['snackbarBackgroundDark'] as String?),
      snackbarText: colorFromJsonNullable(j['snackbarText'] as String?),
      snackbarTextDark: colorFromJsonNullable(j['snackbarTextDark'] as String?),
      divider: colorFromJsonNullable(j['divider'] as String?),
      dividerDark: colorFromJsonNullable(j['dividerDark'] as String?),
      premiumGold: colorFromJsonNullable(j['premiumGold'] as String?),
      premiumGoldDark: colorFromJsonNullable(j['premiumGoldDark'] as String?),
      highlight: colorFromJsonNullable(j['highlight'] as String?),
      highlightDark: colorFromJsonNullable(j['highlightDark'] as String?),
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinTypography
// ─────────────────────────────────────────────────────────────────────────────

extension SkinTypographyJson on SkinTypography {
  Map<String, dynamic> toJson() => {
        'headingFamily': headingFamily,
        'bodyFamily': bodyFamily,
        'monoFamily': monoFamily,
        'fontFallbacks': fontFallbacks,
        'scaleFactor': scaleFactor,
        if (accentFamily != null) 'accentFamily': accentFamily,
        if (headingScaleFactor != null) 'headingScaleFactor': headingScaleFactor,
        if (bodyScaleFactor != null) 'bodyScaleFactor': bodyScaleFactor,
        if (headingWeight != null)
          'headingWeight': fontWeightToJson(headingWeight!),
        if (titleWeight != null) 'titleWeight': fontWeightToJson(titleWeight!),
        if (bodyWeight != null) 'bodyWeight': fontWeightToJson(bodyWeight!),
        if (labelWeight != null) 'labelWeight': fontWeightToJson(labelWeight!),
        if (captionWeight != null)
          'captionWeight': fontWeightToJson(captionWeight!),
        if (headingLetterSpacing != null)
          'headingLetterSpacing': headingLetterSpacing,
        if (bodyLetterSpacing != null) 'bodyLetterSpacing': bodyLetterSpacing,
        if (labelLetterSpacing != null) 'labelLetterSpacing': labelLetterSpacing,
        if (captionLetterSpacing != null)
          'captionLetterSpacing': captionLetterSpacing,
        if (headingLineHeight != null) 'headingLineHeight': headingLineHeight,
        if (bodyLineHeight != null) 'bodyLineHeight': bodyLineHeight,
        if (captionLineHeight != null) 'captionLineHeight': captionLineHeight,
        if (headingWordSpacing != null) 'headingWordSpacing': headingWordSpacing,
        if (bodyWordSpacing != null) 'bodyWordSpacing': bodyWordSpacing,
        if (headingFontStyle != null)
          'headingFontStyle': headingFontStyle!.index,
        if (bodyFontStyle != null) 'bodyFontStyle': bodyFontStyle!.index,
        if (headingTextBaseline != null)
          'headingTextBaseline': headingTextBaseline!.index,
        if (bodyTextBaseline != null)
          'bodyTextBaseline': bodyTextBaseline!.index,
      };
}

SkinTypography skinTypographyFromJson(Map<String, dynamic> j) =>
    SkinTypography(
      headingFamily: j['headingFamily'] as String,
      bodyFamily: j['bodyFamily'] as String,
      monoFamily: j['monoFamily'] as String? ?? 'JetBrains Mono',
      fontFallbacks:
          (j['fontFallbacks'] as List<dynamic>?)?.cast<String>() ?? [],
      scaleFactor: (j['scaleFactor'] as num?)?.toDouble() ?? 1.0,
      accentFamily: j['accentFamily'] as String?,
      headingScaleFactor: (j['headingScaleFactor'] as num?)?.toDouble(),
      bodyScaleFactor: (j['bodyScaleFactor'] as num?)?.toDouble(),
      headingWeight: j['headingWeight'] != null
          ? fontWeightFromJson(j['headingWeight'] as int)
          : null,
      titleWeight: j['titleWeight'] != null
          ? fontWeightFromJson(j['titleWeight'] as int)
          : null,
      bodyWeight: j['bodyWeight'] != null
          ? fontWeightFromJson(j['bodyWeight'] as int)
          : null,
      labelWeight: j['labelWeight'] != null
          ? fontWeightFromJson(j['labelWeight'] as int)
          : null,
      captionWeight: j['captionWeight'] != null
          ? fontWeightFromJson(j['captionWeight'] as int)
          : null,
      headingLetterSpacing: (j['headingLetterSpacing'] as num?)?.toDouble(),
      bodyLetterSpacing: (j['bodyLetterSpacing'] as num?)?.toDouble(),
      labelLetterSpacing: (j['labelLetterSpacing'] as num?)?.toDouble(),
      captionLetterSpacing: (j['captionLetterSpacing'] as num?)?.toDouble(),
      headingLineHeight: (j['headingLineHeight'] as num?)?.toDouble(),
      bodyLineHeight: (j['bodyLineHeight'] as num?)?.toDouble(),
      captionLineHeight: (j['captionLineHeight'] as num?)?.toDouble(),
      headingWordSpacing: (j['headingWordSpacing'] as num?)?.toDouble(),
      bodyWordSpacing: (j['bodyWordSpacing'] as num?)?.toDouble(),
      headingFontStyle: j['headingFontStyle'] != null
          ? FontStyle.values[j['headingFontStyle'] as int]
          : null,
      bodyFontStyle: j['bodyFontStyle'] != null
          ? FontStyle.values[j['bodyFontStyle'] as int]
          : null,
      headingTextBaseline: j['headingTextBaseline'] != null
          ? TextBaseline.values[j['headingTextBaseline'] as int]
          : null,
      bodyTextBaseline: j['bodyTextBaseline'] != null
          ? TextBaseline.values[j['bodyTextBaseline'] as int]
          : null,
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinShape
// ─────────────────────────────────────────────────────────────────────────────

extension SkinShapeJson on SkinShape {
  Map<String, dynamic> toJson() => {
        'cardRadius': cardRadius,
        'buttonRadius': buttonRadius,
        'inputRadius': inputRadius,
        'dialogRadius': dialogRadius,
        'glassRadius': glassRadius,
        'glassPillRadius': glassPillRadius,
        'badgeRadius': badgeRadius,
        'photoRadius': photoRadius,
        'chipRadius': chipRadius,
        'avatarRadius': avatarRadius,
        'tooltipRadius': tooltipRadius,
        'snackbarRadius': snackbarRadius,
        'fabRadius': fabRadius,
        'switchRadius': switchRadius,
        'checkboxRadius': checkboxRadius,
        'menuRadius': menuRadius,
        'popupRadius': popupRadius,
        'bannerRadius': bannerRadius,
        'searchBarRadius': searchBarRadius,
        'tabIndicatorRadius': tabIndicatorRadius,
        'progressRadius': progressRadius,
        'shimmerRadius': shimmerRadius,
        'bottomSheetRadius': bottomSheetRadius,
        'navigationBarRadius': navigationBarRadius,
        if (cardInnerRadius != null) 'cardInnerRadius': cardInnerRadius,
      };
}

SkinShape skinShapeFromJson(Map<String, dynamic> j) => SkinShape(
      cardRadius: (j['cardRadius'] as num).toDouble(),
      buttonRadius: (j['buttonRadius'] as num).toDouble(),
      inputRadius: (j['inputRadius'] as num).toDouble(),
      dialogRadius: (j['dialogRadius'] as num).toDouble(),
      glassRadius: (j['glassRadius'] as num).toDouble(),
      glassPillRadius: (j['glassPillRadius'] as num).toDouble(),
      badgeRadius: (j['badgeRadius'] as num).toDouble(),
      photoRadius: (j['photoRadius'] as num).toDouble(),
      chipRadius: (j['chipRadius'] as num?)?.toDouble() ?? 9999.0,
      avatarRadius: (j['avatarRadius'] as num?)?.toDouble() ?? 9999.0,
      tooltipRadius: (j['tooltipRadius'] as num?)?.toDouble() ?? 8.0,
      snackbarRadius: (j['snackbarRadius'] as num?)?.toDouble() ?? 8.0,
      fabRadius: (j['fabRadius'] as num?)?.toDouble() ?? 16.0,
      switchRadius: (j['switchRadius'] as num?)?.toDouble() ?? 9999.0,
      checkboxRadius: (j['checkboxRadius'] as num?)?.toDouble() ?? 4.0,
      menuRadius: (j['menuRadius'] as num?)?.toDouble() ?? 12.0,
      popupRadius: (j['popupRadius'] as num?)?.toDouble() ?? 12.0,
      bannerRadius: (j['bannerRadius'] as num?)?.toDouble() ?? 12.0,
      searchBarRadius: (j['searchBarRadius'] as num?)?.toDouble() ?? 9999.0,
      tabIndicatorRadius: (j['tabIndicatorRadius'] as num?)?.toDouble() ?? 2.0,
      progressRadius: (j['progressRadius'] as num?)?.toDouble() ?? 9999.0,
      shimmerRadius: (j['shimmerRadius'] as num?)?.toDouble() ?? 8.0,
      bottomSheetRadius: (j['bottomSheetRadius'] as num?)?.toDouble() ?? 20.0,
      navigationBarRadius:
          (j['navigationBarRadius'] as num?)?.toDouble() ?? 0.0,
      cardInnerRadius: (j['cardInnerRadius'] as num?)?.toDouble(),
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinEffects
// ─────────────────────────────────────────────────────────────────────────────

extension SkinEffectsJson on SkinEffects {
  Map<String, dynamic> toJson() => {
        'glassFillOpacityDark': glassFillOpacityDark,
        'glassFillOpacityLight': glassFillOpacityLight,
        'glassBorderOpacityDark': glassBorderOpacityDark,
        'glassBorderOpacityLight': glassBorderOpacityLight,
        'glassBorderWidth': glassBorderWidth,
        'glassBlurSigma': glassBlurSigma,
        'glassDialogFillOpacityDark': glassDialogFillOpacityDark,
        'glassDialogFillOpacityLight': glassDialogFillOpacityLight,
        'glassDialogBorderOpacityDark': glassDialogBorderOpacityDark,
        'glassDialogBorderOpacityLight': glassDialogBorderOpacityLight,
        'shadowSm': boxShadowListToJson(shadowSm),
        'shadowMd': boxShadowListToJson(shadowMd),
        'shadowLg': boxShadowListToJson(shadowLg),
        'shadowSmDark': boxShadowListToJson(shadowSmDark),
        'shadowMdDark': boxShadowListToJson(shadowMdDark),
        'shadowLgDark': boxShadowListToJson(shadowLgDark),
        if (glowPrimary != null) 'glowPrimary': boxShadowListToJson(glowPrimary!),
        if (glowSecondary != null)
          'glowSecondary': boxShadowListToJson(glowSecondary!),
        'durationFast': durationFast.inMilliseconds,
        'durationNormal': durationNormal.inMilliseconds,
        'durationSlow': durationSlow.inMilliseconds,
        'curveDefault': curveToJson(curveDefault),
        'curveSpring': curveToJson(curveSpring),
        'curveSmooth': curveToJson(curveSmooth),
        'pageTransitionDuration': pageTransitionDuration.inMilliseconds,
        'pageTransitionCurve': curveToJson(pageTransitionCurve),
        'hoverScaleFactor': hoverScaleFactor,
        'pressScaleFactor': pressScaleFactor,
        'hoverElevationBoost': hoverElevationBoost,
        if (shimmerBaseColor != null)
          'shimmerBaseColor': colorToJson(shimmerBaseColor!),
        if (shimmerHighlightColor != null)
          'shimmerHighlightColor': colorToJson(shimmerHighlightColor!),
        'shimmerDuration': shimmerDuration.inMilliseconds,
        if (rippleColor != null) 'rippleColor': colorToJson(rippleColor!),
        'rippleOpacity': rippleOpacity,
        if (overlayColor != null) 'overlayColor': colorToJson(overlayColor!),
        'overlayOpacity': overlayOpacity,
        'scrimBlurSigma': scrimBlurSigma,
        if (focusRingColor != null) 'focusRingColor': colorToJson(focusRingColor!),
        'focusRingWidth': focusRingWidth,
        'focusRingOffset': focusRingOffset,
        'enableGlass': enableGlass,
        'enableGlow': enableGlow,
        'enableShadows': enableShadows,
        'enableAnimations': enableAnimations,
        'enableBlur': enableBlur,
      };
}

SkinEffects skinEffectsFromJson(Map<String, dynamic> j) => SkinEffects(
      glassFillOpacityDark: (j['glassFillOpacityDark'] as num).toDouble(),
      glassFillOpacityLight: (j['glassFillOpacityLight'] as num).toDouble(),
      glassBorderOpacityDark: (j['glassBorderOpacityDark'] as num).toDouble(),
      glassBorderOpacityLight: (j['glassBorderOpacityLight'] as num).toDouble(),
      glassBorderWidth: (j['glassBorderWidth'] as num).toDouble(),
      glassBlurSigma: (j['glassBlurSigma'] as num).toDouble(),
      glassDialogFillOpacityDark:
          (j['glassDialogFillOpacityDark'] as num).toDouble(),
      glassDialogFillOpacityLight:
          (j['glassDialogFillOpacityLight'] as num).toDouble(),
      glassDialogBorderOpacityDark:
          (j['glassDialogBorderOpacityDark'] as num).toDouble(),
      glassDialogBorderOpacityLight:
          (j['glassDialogBorderOpacityLight'] as num).toDouble(),
      shadowSm:
          boxShadowListFromJson(j['shadowSm'] as List<dynamic>),
      shadowMd:
          boxShadowListFromJson(j['shadowMd'] as List<dynamic>),
      shadowLg:
          boxShadowListFromJson(j['shadowLg'] as List<dynamic>),
      shadowSmDark:
          boxShadowListFromJson(j['shadowSmDark'] as List<dynamic>),
      shadowMdDark:
          boxShadowListFromJson(j['shadowMdDark'] as List<dynamic>),
      shadowLgDark:
          boxShadowListFromJson(j['shadowLgDark'] as List<dynamic>),
      glowPrimary: j['glowPrimary'] != null
          ? boxShadowListFromJson(j['glowPrimary'] as List<dynamic>)
          : null,
      glowSecondary: j['glowSecondary'] != null
          ? boxShadowListFromJson(j['glowSecondary'] as List<dynamic>)
          : null,
      durationFast: Duration(milliseconds: j['durationFast'] as int? ?? 150),
      durationNormal:
          Duration(milliseconds: j['durationNormal'] as int? ?? 300),
      durationSlow: Duration(milliseconds: j['durationSlow'] as int? ?? 500),
      curveDefault:
          curveFromJson(j['curveDefault'] as String? ?? 'easeInOut'),
      curveSpring:
          curveFromJson(j['curveSpring'] as String? ?? 'elasticOut'),
      curveSmooth:
          curveFromJson(j['curveSmooth'] as String? ?? 'fastOutSlowIn'),
      pageTransitionDuration: Duration(
          milliseconds: j['pageTransitionDuration'] as int? ?? 300),
      pageTransitionCurve:
          curveFromJson(j['pageTransitionCurve'] as String? ?? 'easeInOut'),
      hoverScaleFactor:
          (j['hoverScaleFactor'] as num?)?.toDouble() ?? 1.02,
      pressScaleFactor:
          (j['pressScaleFactor'] as num?)?.toDouble() ?? 0.98,
      hoverElevationBoost:
          (j['hoverElevationBoost'] as num?)?.toDouble() ?? 4.0,
      shimmerBaseColor:
          colorFromJsonNullable(j['shimmerBaseColor'] as String?),
      shimmerHighlightColor:
          colorFromJsonNullable(j['shimmerHighlightColor'] as String?),
      shimmerDuration:
          Duration(milliseconds: j['shimmerDuration'] as int? ?? 1500),
      rippleColor: colorFromJsonNullable(j['rippleColor'] as String?),
      rippleOpacity: (j['rippleOpacity'] as num?)?.toDouble() ?? 0.12,
      overlayColor: colorFromJsonNullable(j['overlayColor'] as String?),
      overlayOpacity: (j['overlayOpacity'] as num?)?.toDouble() ?? 0.5,
      scrimBlurSigma: (j['scrimBlurSigma'] as num?)?.toDouble() ?? 0.0,
      focusRingColor: colorFromJsonNullable(j['focusRingColor'] as String?),
      focusRingWidth: (j['focusRingWidth'] as num?)?.toDouble() ?? 2.0,
      focusRingOffset: (j['focusRingOffset'] as num?)?.toDouble() ?? 2.0,
      enableGlass: j['enableGlass'] as bool? ?? true,
      enableGlow: j['enableGlow'] as bool? ?? true,
      enableShadows: j['enableShadows'] as bool? ?? true,
      enableAnimations: j['enableAnimations'] as bool? ?? true,
      enableBlur: j['enableBlur'] as bool? ?? true,
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinSpacing
// ─────────────────────────────────────────────────────────────────────────────

extension SkinSpacingJson on SkinSpacing {
  Map<String, dynamic> toJson() => {
        'cardContentPadding': cardContentPadding,
        'cardContentPaddingCompact': cardContentPaddingCompact,
        'cardGap': cardGap,
        'cardHeaderGap': cardHeaderGap,
        'cardFooterGap': cardFooterGap,
        'cardPhotoGap': cardPhotoGap,
        'screenPaddingHorizontal': screenPaddingHorizontal,
        'screenPaddingTop': screenPaddingTop,
        'screenPaddingBottom': screenPaddingBottom,
        'sectionSpacing': sectionSpacing,
        'sectionHeaderBottomSpacing': sectionHeaderBottomSpacing,
        'sectionDividerSpacing': sectionDividerSpacing,
        'dialogContentPadding': dialogContentPadding,
        'dialogTitleBottomSpacing': dialogTitleBottomSpacing,
        'dialogActionSpacing': dialogActionSpacing,
        'dialogActionTopSpacing': dialogActionTopSpacing,
        'buttonPaddingHorizontal': buttonPaddingHorizontal,
        'buttonPaddingVertical': buttonPaddingVertical,
        'buttonPaddingHorizontalSm': buttonPaddingHorizontalSm,
        'buttonPaddingVerticalSm': buttonPaddingVerticalSm,
        'buttonGap': buttonGap,
        'buttonIconGap': buttonIconGap,
        'inputContentPadding': inputContentPadding,
        'inputLabelSpacing': inputLabelSpacing,
        'inputHelperSpacing': inputHelperSpacing,
        'inputGroupSpacing': inputGroupSpacing,
        'listItemPaddingVertical': listItemPaddingVertical,
        'listItemPaddingHorizontal': listItemPaddingHorizontal,
        'listDividerIndent': listDividerIndent,
        'listDividerEndIndent': listDividerEndIndent,
        'chipPaddingHorizontal': chipPaddingHorizontal,
        'chipPaddingVertical': chipPaddingVertical,
        'chipSpacing': chipSpacing,
        'badgePaddingHorizontal': badgePaddingHorizontal,
        'badgePaddingVertical': badgePaddingVertical,
        'iconTextGap': iconTextGap,
        'iconPadding': iconPadding,
        'timelineConnectorWidth': timelineConnectorWidth,
        'timelineDotDiameter': timelineDotDiameter,
        'timelineLeftMargin': timelineLeftMargin,
        'timelineDateHeaderSpacing': timelineDateHeaderSpacing,
        'photoCarouselGap': photoCarouselGap,
        'photoGridGap': photoGridGap,
        'appBarTitleSpacing': appBarTitleSpacing,
        'appBarActionSpacing': appBarActionSpacing,
        'tabBarLabelPadding': tabBarLabelPadding,
        'tabBarIndicatorWeight': tabBarIndicatorWeight,
        'fabMargin': fabMargin,
        'fabExtendedPadding': fabExtendedPadding,
        'snackbarMargin': snackbarMargin,
        'snackbarContentPadding': snackbarContentPadding,
        'tooltipPadding': tooltipPadding,
        'tooltipMargin': tooltipMargin,
      };
}

SkinSpacing skinSpacingFromJson(Map<String, dynamic> j) => SkinSpacing(
      cardContentPadding:
          (j['cardContentPadding'] as num?)?.toDouble() ?? 12,
      cardContentPaddingCompact:
          (j['cardContentPaddingCompact'] as num?)?.toDouble() ?? 8,
      cardGap: (j['cardGap'] as num?)?.toDouble() ?? 8,
      cardHeaderGap: (j['cardHeaderGap'] as num?)?.toDouble() ?? 6,
      cardFooterGap: (j['cardFooterGap'] as num?)?.toDouble() ?? 8,
      cardPhotoGap: (j['cardPhotoGap'] as num?)?.toDouble() ?? 8,
      screenPaddingHorizontal:
          (j['screenPaddingHorizontal'] as num?)?.toDouble() ?? 16,
      screenPaddingTop:
          (j['screenPaddingTop'] as num?)?.toDouble() ?? 16,
      screenPaddingBottom:
          (j['screenPaddingBottom'] as num?)?.toDouble() ?? 16,
      sectionSpacing: (j['sectionSpacing'] as num?)?.toDouble() ?? 24,
      sectionHeaderBottomSpacing:
          (j['sectionHeaderBottomSpacing'] as num?)?.toDouble() ?? 8,
      sectionDividerSpacing:
          (j['sectionDividerSpacing'] as num?)?.toDouble() ?? 16,
      dialogContentPadding:
          (j['dialogContentPadding'] as num?)?.toDouble() ?? 24,
      dialogTitleBottomSpacing:
          (j['dialogTitleBottomSpacing'] as num?)?.toDouble() ?? 16,
      dialogActionSpacing:
          (j['dialogActionSpacing'] as num?)?.toDouble() ?? 8,
      dialogActionTopSpacing:
          (j['dialogActionTopSpacing'] as num?)?.toDouble() ?? 24,
      buttonPaddingHorizontal:
          (j['buttonPaddingHorizontal'] as num?)?.toDouble() ?? 32,
      buttonPaddingVertical:
          (j['buttonPaddingVertical'] as num?)?.toDouble() ?? 16,
      buttonPaddingHorizontalSm:
          (j['buttonPaddingHorizontalSm'] as num?)?.toDouble() ?? 16,
      buttonPaddingVerticalSm:
          (j['buttonPaddingVerticalSm'] as num?)?.toDouble() ?? 8,
      buttonGap: (j['buttonGap'] as num?)?.toDouble() ?? 8,
      buttonIconGap: (j['buttonIconGap'] as num?)?.toDouble() ?? 8,
      inputContentPadding:
          (j['inputContentPadding'] as num?)?.toDouble() ?? 16,
      inputLabelSpacing:
          (j['inputLabelSpacing'] as num?)?.toDouble() ?? 6,
      inputHelperSpacing:
          (j['inputHelperSpacing'] as num?)?.toDouble() ?? 4,
      inputGroupSpacing:
          (j['inputGroupSpacing'] as num?)?.toDouble() ?? 16,
      listItemPaddingVertical:
          (j['listItemPaddingVertical'] as num?)?.toDouble() ?? 12,
      listItemPaddingHorizontal:
          (j['listItemPaddingHorizontal'] as num?)?.toDouble() ?? 16,
      listDividerIndent:
          (j['listDividerIndent'] as num?)?.toDouble() ?? 0,
      listDividerEndIndent:
          (j['listDividerEndIndent'] as num?)?.toDouble() ?? 0,
      chipPaddingHorizontal:
          (j['chipPaddingHorizontal'] as num?)?.toDouble() ?? 12,
      chipPaddingVertical:
          (j['chipPaddingVertical'] as num?)?.toDouble() ?? 4,
      chipSpacing: (j['chipSpacing'] as num?)?.toDouble() ?? 6,
      badgePaddingHorizontal:
          (j['badgePaddingHorizontal'] as num?)?.toDouble() ?? 8,
      badgePaddingVertical:
          (j['badgePaddingVertical'] as num?)?.toDouble() ?? 2,
      iconTextGap: (j['iconTextGap'] as num?)?.toDouble() ?? 8,
      iconPadding: (j['iconPadding'] as num?)?.toDouble() ?? 4,
      timelineConnectorWidth:
          (j['timelineConnectorWidth'] as num?)?.toDouble() ?? 2,
      timelineDotDiameter:
          (j['timelineDotDiameter'] as num?)?.toDouble() ?? 12,
      timelineLeftMargin:
          (j['timelineLeftMargin'] as num?)?.toDouble() ?? 40,
      timelineDateHeaderSpacing:
          (j['timelineDateHeaderSpacing'] as num?)?.toDouble() ?? 12,
      photoCarouselGap: (j['photoCarouselGap'] as num?)?.toDouble() ?? 4,
      photoGridGap: (j['photoGridGap'] as num?)?.toDouble() ?? 4,
      appBarTitleSpacing:
          (j['appBarTitleSpacing'] as num?)?.toDouble() ?? 16,
      appBarActionSpacing:
          (j['appBarActionSpacing'] as num?)?.toDouble() ?? 4,
      tabBarLabelPadding:
          (j['tabBarLabelPadding'] as num?)?.toDouble() ?? 16,
      tabBarIndicatorWeight:
          (j['tabBarIndicatorWeight'] as num?)?.toDouble() ?? 2,
      fabMargin: (j['fabMargin'] as num?)?.toDouble() ?? 16,
      fabExtendedPadding:
          (j['fabExtendedPadding'] as num?)?.toDouble() ?? 20,
      snackbarMargin: (j['snackbarMargin'] as num?)?.toDouble() ?? 8,
      snackbarContentPadding:
          (j['snackbarContentPadding'] as num?)?.toDouble() ?? 16,
      tooltipPadding: (j['tooltipPadding'] as num?)?.toDouble() ?? 8,
      tooltipMargin: (j['tooltipMargin'] as num?)?.toDouble() ?? 8,
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinSizing
// ─────────────────────────────────────────────────────────────────────────────

extension SkinSizingJson on SkinSizing {
  Map<String, dynamic> toJson() => {
        'appBarHeight': appBarHeight,
        'appBarElevation': appBarElevation,
        'appBarCenterTitle': appBarCenterTitle,
        'bottomNavHeight': bottomNavHeight,
        'tabBarHeight': tabBarHeight,
        'buttonHeight': buttonHeight,
        'buttonHeightSm': buttonHeightSm,
        'buttonHeightLg': buttonHeightLg,
        'buttonMinWidth': buttonMinWidth,
        'buttonIconSize': buttonIconSize,
        'inputHeight': inputHeight,
        'inputHeightSm': inputHeightSm,
        'iconSize': iconSize,
        'iconSizeSm': iconSizeSm,
        'iconSizeLg': iconSizeLg,
        'iconSizeXl': iconSizeXl,
        'avatarSize': avatarSize,
        'avatarSizeSm': avatarSizeSm,
        'avatarSizeLg': avatarSizeLg,
        'badgeHeight': badgeHeight,
        'badgeDotSize': badgeDotSize,
        'chipHeight': chipHeight,
        'fabSize': fabSize,
        'fabSizeSm': fabSizeSm,
        'dividerThickness': dividerThickness,
        'borderWidth': borderWidth,
        'borderWidthThick': borderWidthThick,
        'borderWidthFocus': borderWidthFocus,
        'photoAspectRatio': photoAspectRatio,
        'photoThumbnailSize': photoThumbnailSize,
        'photoCarouselHeight': photoCarouselHeight,
        'cardMinHeight': cardMinHeight,
        'cardMaxWidth': cardMaxWidth == double.infinity
            ? null
            : cardMaxWidth,
        'cardElevation': cardElevation,
        'cardBorderWidth': cardBorderWidth,
        'dialogMaxWidth': dialogMaxWidth,
        'dialogMinWidth': dialogMinWidth,
        'dialogElevation': dialogElevation,
        'tooltipMaxWidth': tooltipMaxWidth,
        'snackbarMaxWidth': snackbarMaxWidth,
        'progressIndicatorSize': progressIndicatorSize,
        'progressIndicatorStrokeWidth': progressIndicatorStrokeWidth,
        'switchWidth': switchWidth,
        'switchHeight': switchHeight,
        'checkboxSize': checkboxSize,
        'radioSize': radioSize,
        'scrollbarThickness': scrollbarThickness,
        'scrollbarRadius': scrollbarRadius,
        'starSize': starSize,
        'starSpacing': starSpacing,
      };
}

SkinSizing skinSizingFromJson(Map<String, dynamic> j) => SkinSizing(
      appBarHeight: (j['appBarHeight'] as num?)?.toDouble() ?? 56,
      appBarElevation: (j['appBarElevation'] as num?)?.toDouble() ?? 0,
      appBarCenterTitle: j['appBarCenterTitle'] as bool? ?? false,
      bottomNavHeight: (j['bottomNavHeight'] as num?)?.toDouble() ?? 64,
      tabBarHeight: (j['tabBarHeight'] as num?)?.toDouble() ?? 48,
      buttonHeight: (j['buttonHeight'] as num?)?.toDouble() ?? 48,
      buttonHeightSm: (j['buttonHeightSm'] as num?)?.toDouble() ?? 36,
      buttonHeightLg: (j['buttonHeightLg'] as num?)?.toDouble() ?? 56,
      buttonMinWidth: (j['buttonMinWidth'] as num?)?.toDouble() ?? 64,
      buttonIconSize: (j['buttonIconSize'] as num?)?.toDouble() ?? 20,
      inputHeight: (j['inputHeight'] as num?)?.toDouble() ?? 48,
      inputHeightSm: (j['inputHeightSm'] as num?)?.toDouble() ?? 36,
      iconSize: (j['iconSize'] as num?)?.toDouble() ?? 24,
      iconSizeSm: (j['iconSizeSm'] as num?)?.toDouble() ?? 18,
      iconSizeLg: (j['iconSizeLg'] as num?)?.toDouble() ?? 32,
      iconSizeXl: (j['iconSizeXl'] as num?)?.toDouble() ?? 48,
      avatarSize: (j['avatarSize'] as num?)?.toDouble() ?? 40,
      avatarSizeSm: (j['avatarSizeSm'] as num?)?.toDouble() ?? 28,
      avatarSizeLg: (j['avatarSizeLg'] as num?)?.toDouble() ?? 56,
      badgeHeight: (j['badgeHeight'] as num?)?.toDouble() ?? 20,
      badgeDotSize: (j['badgeDotSize'] as num?)?.toDouble() ?? 8,
      chipHeight: (j['chipHeight'] as num?)?.toDouble() ?? 32,
      fabSize: (j['fabSize'] as num?)?.toDouble() ?? 56,
      fabSizeSm: (j['fabSizeSm'] as num?)?.toDouble() ?? 40,
      dividerThickness: (j['dividerThickness'] as num?)?.toDouble() ?? 1,
      borderWidth: (j['borderWidth'] as num?)?.toDouble() ?? 1,
      borderWidthThick: (j['borderWidthThick'] as num?)?.toDouble() ?? 2,
      borderWidthFocus: (j['borderWidthFocus'] as num?)?.toDouble() ?? 2,
      photoAspectRatio: (j['photoAspectRatio'] as num?)?.toDouble() ?? 1.78,
      photoThumbnailSize:
          (j['photoThumbnailSize'] as num?)?.toDouble() ?? 48,
      photoCarouselHeight:
          (j['photoCarouselHeight'] as num?)?.toDouble() ?? 200,
      cardMinHeight: (j['cardMinHeight'] as num?)?.toDouble() ?? 0,
      cardMaxWidth: j['cardMaxWidth'] == null
          ? double.infinity
          : (j['cardMaxWidth'] as num).toDouble(),
      cardElevation: (j['cardElevation'] as num?)?.toDouble() ?? 0,
      cardBorderWidth: (j['cardBorderWidth'] as num?)?.toDouble() ?? 1,
      dialogMaxWidth: (j['dialogMaxWidth'] as num?)?.toDouble() ?? 560,
      dialogMinWidth: (j['dialogMinWidth'] as num?)?.toDouble() ?? 280,
      dialogElevation: (j['dialogElevation'] as num?)?.toDouble() ?? 8,
      tooltipMaxWidth: (j['tooltipMaxWidth'] as num?)?.toDouble() ?? 200,
      snackbarMaxWidth: (j['snackbarMaxWidth'] as num?)?.toDouble() ?? 560,
      progressIndicatorSize:
          (j['progressIndicatorSize'] as num?)?.toDouble() ?? 24,
      progressIndicatorStrokeWidth:
          (j['progressIndicatorStrokeWidth'] as num?)?.toDouble() ?? 3,
      switchWidth: (j['switchWidth'] as num?)?.toDouble() ?? 52,
      switchHeight: (j['switchHeight'] as num?)?.toDouble() ?? 32,
      checkboxSize: (j['checkboxSize'] as num?)?.toDouble() ?? 20,
      radioSize: (j['radioSize'] as num?)?.toDouble() ?? 20,
      scrollbarThickness:
          (j['scrollbarThickness'] as num?)?.toDouble() ?? 6,
      scrollbarRadius: (j['scrollbarRadius'] as num?)?.toDouble() ?? 3,
      starSize: (j['starSize'] as num?)?.toDouble() ?? 16,
      starSpacing: (j['starSpacing'] as num?)?.toDouble() ?? 2,
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinComponentStyles
// ─────────────────────────────────────────────────────────────────────────────

/// Encode a [TextDecoration] to a string key.
String _textDecorationToJson(TextDecoration d) {
  if (d == TextDecoration.none) return 'none';
  if (d == TextDecoration.underline) return 'underline';
  if (d == TextDecoration.overline) return 'overline';
  if (d == TextDecoration.lineThrough) return 'lineThrough';
  return 'none';
}

/// Decode a string key to a [TextDecoration].
TextDecoration _textDecorationFromJson(String? s) {
  switch (s) {
    case 'underline':
      return TextDecoration.underline;
    case 'overline':
      return TextDecoration.overline;
    case 'lineThrough':
      return TextDecoration.lineThrough;
    default:
      return TextDecoration.none;
  }
}

extension SkinComponentStylesJson on SkinComponentStyles {
  Map<String, dynamic> toJson() => {
        'appBarStyle': appBarStyle.name,
        'cardStyle': cardStyle.name,
        'buttonVariant': buttonVariant.name,
        'buttonTextTransform': buttonTextTransform.name,
        'inputVariant': inputVariant.name,
        'dialogVariant': dialogVariant.name,
        'chipVariant': chipVariant.name,
        'badgeVariant': badgeVariant.name,
        'dividerVariant': dividerVariant.name,
        'photoShape': photoShape.name,
        'iconVariant': iconVariant.name,
        'loadingVariant': loadingVariant.name,
        'scrollPhysicsVariant': scrollPhysicsVariant.name,
        'snackbarPosition': snackbarPosition.name,
        'tooltipVariant': tooltipVariant.name,
        'listSeparator': listSeparator.name,
        'tabIndicatorVariant': tabIndicatorVariant.name,
        'switchVariant': switchVariant.name,
        'navRailVariant': navRailVariant.name,
        'cursorVariant': cursorVariant.name,
        'showCardBorder': showCardBorder,
        'showCardShadow': showCardShadow,
        'showInputBorder': showInputBorder,
        'showInputFill': showInputFill,
        'showButtonShadow': showButtonShadow,
        'showPhotoOverlayGradient': showPhotoOverlayGradient,
        'useRippleEffect': useRippleEffect,
        'showScrollbar': showScrollbar,
        'showDividers': showDividers,
        'showTimelineConnectors': showTimelineConnectors,
        'animatePageTransitions': animatePageTransitions,
        'animateCardHover': animateCardHover,
        'headingTextDecoration': _textDecorationToJson(headingTextDecoration),
        'linkTextDecoration': _textDecorationToJson(linkTextDecoration),
        'tripCardOverlayOpacity': tripCardOverlayOpacity,
        'photoOverlayGradientStops': photoOverlayGradientStops,
        'photoOverlayGradientOpacities': photoOverlayGradientOpacities,
      };
}

SkinComponentStyles skinComponentStylesFromJson(Map<String, dynamic> j) =>
    SkinComponentStyles(
      appBarStyle: AppBarVariant.values.firstWhere(
        (e) => e.name == (j['appBarStyle'] as String?),
        orElse: () => AppBarVariant.solid,
      ),
      cardStyle: CardVariant.values.firstWhere(
        (e) => e.name == (j['cardStyle'] as String?),
        orElse: () => CardVariant.bordered,
      ),
      buttonVariant: ButtonVariant.values.firstWhere(
        (e) => e.name == (j['buttonVariant'] as String?),
        orElse: () => ButtonVariant.filled,
      ),
      buttonTextTransform: TextTransform.values.firstWhere(
        (e) => e.name == (j['buttonTextTransform'] as String?),
        orElse: () => TextTransform.none,
      ),
      inputVariant: InputVariant.values.firstWhere(
        (e) => e.name == (j['inputVariant'] as String?),
        orElse: () => InputVariant.outlined,
      ),
      dialogVariant: DialogVariant.values.firstWhere(
        (e) => e.name == (j['dialogVariant'] as String?),
        orElse: () => DialogVariant.standard,
      ),
      chipVariant: ChipVariant.values.firstWhere(
        (e) => e.name == (j['chipVariant'] as String?),
        orElse: () => ChipVariant.filled,
      ),
      badgeVariant: BadgeVariant.values.firstWhere(
        (e) => e.name == (j['badgeVariant'] as String?),
        orElse: () => BadgeVariant.filled,
      ),
      dividerVariant: DividerVariant.values.firstWhere(
        (e) => e.name == (j['dividerVariant'] as String?),
        orElse: () => DividerVariant.solid,
      ),
      photoShape: PhotoShape.values.firstWhere(
        (e) => e.name == (j['photoShape'] as String?),
        orElse: () => PhotoShape.rounded,
      ),
      iconVariant: IconVariant.values.firstWhere(
        (e) => e.name == (j['iconVariant'] as String?),
        orElse: () => IconVariant.outlined,
      ),
      loadingVariant: LoadingVariant.values.firstWhere(
        (e) => e.name == (j['loadingVariant'] as String?),
        orElse: () => LoadingVariant.shimmer,
      ),
      scrollPhysicsVariant: ScrollPhysicsVariant.values.firstWhere(
        (e) => e.name == (j['scrollPhysicsVariant'] as String?),
        orElse: () => ScrollPhysicsVariant.platform,
      ),
      snackbarPosition: SnackbarPosition.values.firstWhere(
        (e) => e.name == (j['snackbarPosition'] as String?),
        orElse: () => SnackbarPosition.bottom,
      ),
      tooltipVariant: TooltipVariant.values.firstWhere(
        (e) => e.name == (j['tooltipVariant'] as String?),
        orElse: () => TooltipVariant.standard,
      ),
      listSeparator: ListSeparatorVariant.values.firstWhere(
        (e) => e.name == (j['listSeparator'] as String?),
        orElse: () => ListSeparatorVariant.divider,
      ),
      tabIndicatorVariant: TabIndicatorVariant.values.firstWhere(
        (e) => e.name == (j['tabIndicatorVariant'] as String?),
        orElse: () => TabIndicatorVariant.underline,
      ),
      switchVariant: SwitchVariant.values.firstWhere(
        (e) => e.name == (j['switchVariant'] as String?),
        orElse: () => SwitchVariant.material,
      ),
      navRailVariant: NavRailVariant.values.firstWhere(
        (e) => e.name == (j['navRailVariant'] as String?),
        orElse: () => NavRailVariant.standard,
      ),
      cursorVariant: CursorVariant.values.firstWhere(
        (e) => e.name == (j['cursorVariant'] as String?),
        orElse: () => CursorVariant.bar,
      ),
      showCardBorder: j['showCardBorder'] as bool? ?? true,
      showCardShadow: j['showCardShadow'] as bool? ?? true,
      showInputBorder: j['showInputBorder'] as bool? ?? true,
      showInputFill: j['showInputFill'] as bool? ?? true,
      showButtonShadow: j['showButtonShadow'] as bool? ?? false,
      showPhotoOverlayGradient: j['showPhotoOverlayGradient'] as bool? ?? true,
      useRippleEffect: j['useRippleEffect'] as bool? ?? true,
      showScrollbar: j['showScrollbar'] as bool? ?? true,
      showDividers: j['showDividers'] as bool? ?? true,
      showTimelineConnectors: j['showTimelineConnectors'] as bool? ?? true,
      animatePageTransitions: j['animatePageTransitions'] as bool? ?? true,
      animateCardHover: j['animateCardHover'] as bool? ?? true,
      headingTextDecoration:
          _textDecorationFromJson(j['headingTextDecoration'] as String?),
      linkTextDecoration:
          _textDecorationFromJson(j['linkTextDecoration'] as String?),
      tripCardOverlayOpacity:
          (j['tripCardOverlayOpacity'] as num?)?.toDouble() ?? 0.4,
      photoOverlayGradientStops:
          (j['photoOverlayGradientStops'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              const [0.0, 0.5, 1.0],
      photoOverlayGradientOpacities:
          (j['photoOverlayGradientOpacities'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              const [0.0, 0.1, 0.6],
    );

// ─────────────────────────────────────────────────────────────────────────────
// SkinDomainColors
// ─────────────────────────────────────────────────────────────────────────────

extension SkinDomainColorsJson on SkinDomainColors {
  Map<String, dynamic> toJson() => {
        if (flight != null) 'flight': colorToJson(flight!),
        if (train != null) 'train': colorToJson(train!),
        if (car != null) 'car': colorToJson(car!),
        if (bus != null) 'bus': colorToJson(bus!),
        if (ferry != null) 'ferry': colorToJson(ferry!),
        if (cruise != null) 'cruise': colorToJson(cruise!),
        if (subway != null) 'subway': colorToJson(subway!),
        if (hotel != null) 'hotel': colorToJson(hotel!),
        if (restaurant != null) 'restaurant': colorToJson(restaurant!),
        if (activity != null) 'activity': colorToJson(activity!),
        if (attraction != null) 'attraction': colorToJson(attraction!),
        if (rental != null) 'rental': colorToJson(rental!),
      };
}

SkinDomainColors skinDomainColorsFromJson(Map<String, dynamic> j) =>
    SkinDomainColors(
      flight: colorFromJsonNullable(j['flight'] as String?),
      train: colorFromJsonNullable(j['train'] as String?),
      car: colorFromJsonNullable(j['car'] as String?),
      bus: colorFromJsonNullable(j['bus'] as String?),
      ferry: colorFromJsonNullable(j['ferry'] as String?),
      cruise: colorFromJsonNullable(j['cruise'] as String?),
      subway: colorFromJsonNullable(j['subway'] as String?),
      hotel: colorFromJsonNullable(j['hotel'] as String?),
      restaurant: colorFromJsonNullable(j['restaurant'] as String?),
      activity: colorFromJsonNullable(j['activity'] as String?),
      attraction: colorFromJsonNullable(j['attraction'] as String?),
      rental: colorFromJsonNullable(j['rental'] as String?),
    );
