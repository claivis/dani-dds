import 'package:flutter/material.dart';

import '../dani_skin.dart';
import 'editable_skin.dart';
import 'skin_element_tree.dart';
import 'skin_editor_provider.dart';

/// Reads and writes skin property values by dot-path (e.g. "colors.primary").
///
/// This is the bridge between the element tree (which references properties by
/// path string) and the actual mutable [EditableSkin] managed by the editor.
///
/// Supports two path schemes:
///   - Standard: `"colors.primary"`, `"typography.bodyFamily"` etc.
///   - Override:  `"override.<elementPath>.<property>"` — reads/writes an
///     [ElementStyle] override stored on the skin. Example:
///     `"override.tripDetails.chatPanel.userBubble.fontFamily"`.
class SkinPropAccessor {
  final EditableSkin skin;
  final SkinEditorNotifier notifier;

  const SkinPropAccessor(this.skin, this.notifier);

  // ── Override path helpers ─────────────────────────────────────────────

  /// True if [path] is an ElementStyle override path.
  static bool isOverridePath(String path) => path.startsWith('override.');

  /// Splits `"override.a.b.c.fontFamily"` → elementPath `"a.b.c"`, property `"fontFamily"`.
  static ({String elementPath, String property})? _parseOverridePath(String path) {
    if (!path.startsWith('override.')) return null;
    final rest = path.substring('override.'.length);
    final lastDot = rest.lastIndexOf('.');
    if (lastDot < 0) return null;
    return (elementPath: rest.substring(0, lastDot), property: rest.substring(lastDot + 1));
  }

  /// Read from an [ElementStyle] override.
  dynamic _readOverride(String elementPath, String property) {
    final style = skin.elementOverrides[elementPath];
    if (style == null) return null;
    return switch (property) {
      'backgroundColor' => style.backgroundColor,
      'textColor' => style.textColor,
      'borderColor' => style.borderColor,
      'fontFamily' => style.fontFamily,
      'fontSize' => style.fontSize,
      'fontWeight' => style.fontWeight,
      'borderRadius' => style.borderRadius,
      'borderWidth' => style.borderWidth,
      'padding' => style.padding,
      'opacity' => style.opacity,
      _ => null,
    };
  }

  /// Write to an [ElementStyle] override.
  void _writeOverride(String elementPath, String property, dynamic value) {
    debugPrint('🎨 SKIN WRITE OVERRIDE: elementPath=$elementPath, property=$property, value=$value');
    notifier.setElementOverride(elementPath, property, value);
  }

  /// Clear an [ElementStyle] override.
  void clearOverride(String path) {
    final parsed = _parseOverridePath(path);
    if (parsed == null) return;
    notifier.clearElementOverride(parsed.elementPath, parsed.property);
  }

  // ── Read / Write ──────────────────────────────────────────────────────

  /// Read a property value by path. Returns null if path is invalid or not set.
  dynamic read(String path) {
    // Handle override paths.
    final overrideParsed = _parseOverridePath(path);
    if (overrideParsed != null) {
      return _readOverride(overrideParsed.elementPath, overrideParsed.property);
    }

    final parts = path.split('.');
    if (parts.length != 2) return null;
    final group = parts[0];
    final field = parts[1];

    return switch (group) {
      'colors' => _readColor(field),
      'typography' => _readTypography(field),
      'shape' => _readShape(field),
      'effects' => _readEffects(field),
      'spacing' => _readSpacing(field),
      'sizing' => _readSizing(field),
      'componentStyles' => _readComponentStyles(field),
      'domainColors' => _readDomainColors(field),
      _ => null,
    };
  }

  /// Write a property value by path.
  void write(String path, dynamic value) {
    // Handle override paths.
    final overrideParsed = _parseOverridePath(path);
    if (overrideParsed != null) {
      _writeOverride(overrideParsed.elementPath, overrideParsed.property, value);
      return;
    }

    final parts = path.split('.');
    if (parts.length != 2) return;
    final group = parts[0];
    final field = parts[1];

    switch (group) {
      case 'colors':
        _writeColor(field, value);
      case 'typography':
        _writeTypography(field, value);
      case 'shape':
        _writeShape(field, value);
      case 'effects':
        _writeEffects(field, value);
      case 'spacing':
        _writeSpacing(field, value);
      case 'sizing':
        _writeSizing(field, value);
      case 'componentStyles':
        _writeComponentStyles(field, value);
      case 'domainColors':
        _writeDomainColors(field, value);
    }
  }

  /// Get a display string for the current value.
  String displayValue(SkinProp prop) {
    final val = read(prop.path);
    if (val == null) return '(not set)';
    return formatValue(val, prop.type);
  }

  /// Format any value according to its prop type.
  String formatValue(dynamic val, PropType type) {
    return switch (type) {
      PropType.color => _colorHex(val as Color),
      PropType.font => val.toString(),
      PropType.number => (val as num).toStringAsFixed(1),
      PropType.toggle => (val as bool) ? 'ON' : 'OFF',
      PropType.variant => val.toString().split('.').last,
    };
  }

  // ── Inheritance resolution ────────────────────────────────────────────

  /// Resolve the effective value for a property, following its fallback chain.
  /// Returns the value and a human-readable source label.
  ///
  /// If the direct value is set, returns it with source `null` (= local).
  /// If null and a [fallbackPath] is defined, reads from that path.
  /// If the fallback is also null, returns null.
  ({dynamic value, String? sourceLabel}) resolveWithSource(SkinProp prop) {
    final direct = read(prop.path);
    if (direct != null) return (value: direct, sourceLabel: null);

    // Try fallback path.
    if (prop.fallbackPath != null) {
      final fallbackVal = read(prop.fallbackPath!);
      if (fallbackVal != null) {
        final label = prop.fallbackLabel ?? prop.fallbackPath!;
        return (value: fallbackVal, sourceLabel: label);
      }
    }

    // No direct value and no resolved fallback — return label-only hint.
    if (prop.fallbackLabel != null) {
      return (value: null, sourceLabel: prop.fallbackLabel);
    }

    return (value: null, sourceLabel: null);
  }

  String _colorHex(Color c) =>
      '#${c.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

  // ── Color readers ──────────────────────────────────────────────────────

  Color? _readColor(String field) {
    final c = skin.colors;
    return switch (field) {
      'primary' => c.primary,
      'primaryLight' => c.primaryLight,
      'primaryDark' => c.primaryDark,
      'primaryForeground' => c.primaryForeground,
      'secondary' => c.secondary,
      'secondaryForeground' => c.secondaryForeground,
      'background' => c.background,
      'surface' => c.surface,
      'surfaceElevated' => c.surfaceElevated,
      'surfaceVariant' => c.surfaceVariant,
      'text' => c.text,
      'textMuted' => c.textMuted,
      'textSubtle' => c.textSubtle,
      'textDisabled' => c.textDisabled,
      'textLink' => c.textLink,
      'border' => c.border,
      'borderSubtle' => c.borderSubtle,
      'borderStrong' => c.borderStrong,
      'success' => c.success,
      'warning' => c.warning,
      'error' => c.error,
      'info' => c.info,
      'inputBackground' => c.inputBackground,
      'inputBorder' => c.inputBorder,
      'inputBorderFocused' => c.inputBorderFocused,
      'buttonPrimary' => c.buttonPrimary,
      'buttonPrimaryText' => c.buttonPrimaryText,
      'buttonSecondary' => c.buttonSecondary,
      'buttonSecondaryText' => c.buttonSecondaryText,
      'buttonDanger' => c.buttonDanger,
      'buttonDangerText' => c.buttonDangerText,
      'shadow' => c.shadow,
      'navBarBackground' => c.navBarBackground,
      'navBarSelectedItem' => c.navBarSelectedItem,
      'navBarUnselectedItem' => c.navBarUnselectedItem,
      'tabBarIndicator' => c.tabBarIndicator,
      'tabBarSelectedLabel' => c.tabBarSelectedLabel,
      'tabBarUnselectedLabel' => c.tabBarUnselectedLabel,
      'chatBubbleUser' => c.chatBubbleUser,
      'chatBubbleUserText' => c.chatBubbleUserText,
      'chatBubbleAssistant' => c.chatBubbleAssistant,
      'chatBubbleAssistantText' => c.chatBubbleAssistantText,
      'timelineConnector' => c.timelineConnector,
      'timelineDot' => c.timelineDot,
      'timelineDateHeader' => c.timelineDateHeader,
      'shimmerBase' => c.shimmerBase,
      'shimmerHighlight' => c.shimmerHighlight,
      'tripCardOverlay' => c.tripCardOverlay,
      'tripCardTitle' => c.tripCardTitle,
      'tripCardSubtitle' => c.tripCardSubtitle,
      'switchActiveTrack' => c.switchActiveTrack,
      'switchInactiveTrack' => c.switchInactiveTrack,
      'switchThumb' => c.switchThumb,
      'tooltipBackground' => c.tooltipBackground,
      'tooltipText' => c.tooltipText,
      'snackbarBackground' => c.snackbarBackground,
      'snackbarText' => c.snackbarText,
      _ => null,
    };
  }

  // ── Typography readers ─────────────────────────────────────────────────

  dynamic _readTypography(String field) {
    final t = skin.typography;
    return switch (field) {
      'headingFamily' => t.headingFamily,
      'bodyFamily' => t.bodyFamily,
      'monoFamily' => t.monoFamily,
      'accentFamily' => t.accentFamily,
      'scaleFactor' => t.scaleFactor,
      'headingScaleFactor' => t.headingScaleFactor,
      'bodyScaleFactor' => t.bodyScaleFactor,
      'headingWeight' => t.headingWeight,
      'bodyWeight' => t.bodyWeight,
      'titleWeight' => t.titleWeight,
      'labelWeight' => t.labelWeight,
      _ => null,
    };
  }

  // ── Shape readers ──────────────────────────────────────────────────────

  double? _readShape(String field) {
    final s = skin.shape;
    return switch (field) {
      'cardRadius' => s.cardRadius,
      'buttonRadius' => s.buttonRadius,
      'inputRadius' => s.inputRadius,
      'dialogRadius' => s.dialogRadius,
      'glassRadius' => s.glassRadius,
      'photoRadius' => s.photoRadius,
      'chipRadius' => s.chipRadius,
      'menuRadius' => s.menuRadius,
      'popupRadius' => s.popupRadius,
      'bannerRadius' => s.bannerRadius,
      'tooltipRadius' => s.tooltipRadius,
      'snackbarRadius' => s.snackbarRadius,
      'shimmerRadius' => s.shimmerRadius,
      'bottomSheetRadius' => s.bottomSheetRadius,
      _ => null,
    };
  }

  // ── Effects readers ────────────────────────────────────────────────────

  dynamic _readEffects(String field) {
    final e = skin.effects;
    return switch (field) {
      'enableGlass' => e.enableGlass,
      'enableGlow' => e.enableGlow,
      'enableShadows' => e.enableShadows,
      'enableAnimations' => e.enableAnimations,
      'enableBlur' => e.enableBlur,
      'glassBlurSigma' => e.glassBlurSigma,
      'glassFillOpacityDark' => e.glassFillOpacityDark,
      'glassFillOpacityLight' => e.glassFillOpacityLight,
      'glassBorderWidth' => e.glassBorderWidth,
      _ => null,
    };
  }

  // ── Spacing readers ────────────────────────────────────────────────────

  double? _readSpacing(String field) {
    final s = skin.spacing;
    return switch (field) {
      'cardContentPadding' => s.cardContentPadding,
      'timelineConnectorWidth' => s.timelineConnectorWidth,
      'timelineDotDiameter' => s.timelineDotDiameter,
      'timelineDateHeaderSpacing' => s.timelineDateHeaderSpacing,
      'dialogContentPadding' => s.dialogContentPadding,
      _ => null,
    };
  }

  // ── Sizing readers ─────────────────────────────────────────────────────

  dynamic _readSizing(String field) {
    final s = skin.sizing;
    return switch (field) {
      'appBarHeight' => s.appBarHeight,
      'bottomNavHeight' => s.bottomNavHeight,
      'tabBarHeight' => s.tabBarHeight,
      'buttonHeight' => s.buttonHeight,
      'inputHeight' => s.inputHeight,
      'borderWidth' => s.borderWidth,
      'borderWidthThick' => s.borderWidthThick,
      'dialogMaxWidth' => s.dialogMaxWidth,
      _ => null,
    };
  }

  // ── ComponentStyles readers ────────────────────────────────────────────

  dynamic _readComponentStyles(String field) {
    final cs = skin.componentStyles;
    return switch (field) {
      'appBarStyle' => cs.appBarStyle,
      'cardStyle' => cs.cardStyle,
      'buttonVariant' => cs.buttonVariant,
      'inputVariant' => cs.inputVariant,
      'dialogVariant' => cs.dialogVariant,
      'photoShape' => cs.photoShape,
      'loadingVariant' => cs.loadingVariant,
      'snackbarPosition' => cs.snackbarPosition,
      'tabIndicatorVariant' => cs.tabIndicatorVariant,
      'switchVariant' => cs.switchVariant,
      'showCardBorder' => cs.showCardBorder,
      'showCardShadow' => cs.showCardShadow,
      'showButtonShadow' => cs.showButtonShadow,
      'showTimelineConnectors' => cs.showTimelineConnectors,
      'tripCardOverlayOpacity' => cs.tripCardOverlayOpacity,
      _ => null,
    };
  }

  // ── DomainColors readers ───────────────────────────────────────────────

  Color? _readDomainColors(String field) {
    final dc = skin.domainColors;
    if (dc == null) return null;
    return switch (field) {
      'flight' => dc.flight,
      'train' => dc.train,
      'car' => dc.car,
      'bus' => dc.bus,
      'ferry' => dc.ferry,
      'hotel' => dc.hotel,
      'restaurant' => dc.restaurant,
      'activity' => dc.activity,
      'attraction' => dc.attraction,
      'rental' => dc.rental,
      _ => null,
    };
  }

  // ── Writers (delegate to existing notifier methods) ─────────────────────

  void _writeColor(String field, dynamic value) {
    if (value is! Color) return;
    // Build a new SkinColors with the single field changed.
    // This is verbose but avoids reflection.
    final c = skin.colors;
    final updated = SkinColors(
      primary: field == 'primary' ? value : c.primary,
      primaryLight: field == 'primaryLight' ? value : c.primaryLight,
      primaryDark: field == 'primaryDark' ? value : c.primaryDark,
      primaryForeground: field == 'primaryForeground' ? value : c.primaryForeground,
      secondary: field == 'secondary' ? value : c.secondary,
      secondaryForeground: field == 'secondaryForeground' ? value : c.secondaryForeground,
      background: field == 'background' ? value : c.background,
      surface: field == 'surface' ? value : c.surface,
      surfaceElevated: field == 'surfaceElevated' ? value : c.surfaceElevated,
      surfaceVariant: field == 'surfaceVariant' ? value : c.surfaceVariant,
      backgroundDark: c.backgroundDark,
      surfaceDark: c.surfaceDark,
      surfaceDarkElevated: c.surfaceDarkElevated,
      surfaceDarkVariant: c.surfaceDarkVariant,
      text: field == 'text' ? value : c.text,
      textMuted: field == 'textMuted' ? value : c.textMuted,
      textSubtle: field == 'textSubtle' ? value : c.textSubtle,
      textDisabled: field == 'textDisabled' ? value : c.textDisabled,
      textDark: c.textDark,
      textDarkMuted: c.textDarkMuted,
      textDarkSubtle: c.textDarkSubtle,
      textDarkDisabled: c.textDarkDisabled,
      textLink: field == 'textLink' ? value : c.textLink,
      border: field == 'border' ? value : c.border,
      borderSubtle: field == 'borderSubtle' ? value : c.borderSubtle,
      borderStrong: field == 'borderStrong' ? value : c.borderStrong,
      borderDark: c.borderDark,
      borderDarkSubtle: c.borderDarkSubtle,
      borderDarkStrong: c.borderDarkStrong,
      success: field == 'success' ? value : c.success,
      successLight: c.successLight,
      successDark: c.successDark,
      warning: field == 'warning' ? value : c.warning,
      warningLight: c.warningLight,
      warningDark: c.warningDark,
      error: field == 'error' ? value : c.error,
      errorLight: c.errorLight,
      errorDark: c.errorDark,
      info: field == 'info' ? value : c.info,
      infoLight: c.infoLight,
      infoDark: c.infoDark,
      inputBackground: field == 'inputBackground' ? value : c.inputBackground,
      inputBorder: field == 'inputBorder' ? value : c.inputBorder,
      inputBorderFocused: field == 'inputBorderFocused' ? value : c.inputBorderFocused,
      buttonPrimary: field == 'buttonPrimary' ? value : c.buttonPrimary,
      buttonPrimaryText: field == 'buttonPrimaryText' ? value : c.buttonPrimaryText,
      buttonSecondary: field == 'buttonSecondary' ? value : c.buttonSecondary,
      buttonSecondaryText: field == 'buttonSecondaryText' ? value : c.buttonSecondaryText,
      buttonDanger: field == 'buttonDanger' ? value : c.buttonDanger,
      buttonDangerText: field == 'buttonDangerText' ? value : c.buttonDangerText,
      shadow: field == 'shadow' ? value : c.shadow,
      shadowDark: c.shadowDark,
      scrim: c.scrim,
      scrimDark: c.scrimDark,
      selection: c.selection,
      selectionDark: c.selectionDark,
      navBarBackground: field == 'navBarBackground' ? value : c.navBarBackground,
      navBarSelectedItem: field == 'navBarSelectedItem' ? value : c.navBarSelectedItem,
      navBarUnselectedItem: field == 'navBarUnselectedItem' ? value : c.navBarUnselectedItem,
      tabBarIndicator: field == 'tabBarIndicator' ? value : c.tabBarIndicator,
      tabBarSelectedLabel: field == 'tabBarSelectedLabel' ? value : c.tabBarSelectedLabel,
      tabBarUnselectedLabel: field == 'tabBarUnselectedLabel' ? value : c.tabBarUnselectedLabel,
      chatBubbleUser: field == 'chatBubbleUser' ? value : c.chatBubbleUser,
      chatBubbleUserText: field == 'chatBubbleUserText' ? value : c.chatBubbleUserText,
      chatBubbleAssistant: field == 'chatBubbleAssistant' ? value : c.chatBubbleAssistant,
      chatBubbleAssistantText: field == 'chatBubbleAssistantText' ? value : c.chatBubbleAssistantText,
      timelineConnector: field == 'timelineConnector' ? value : c.timelineConnector,
      timelineDot: field == 'timelineDot' ? value : c.timelineDot,
      timelineDateHeader: field == 'timelineDateHeader' ? value : c.timelineDateHeader,
      shimmerBase: field == 'shimmerBase' ? value : c.shimmerBase,
      shimmerHighlight: field == 'shimmerHighlight' ? value : c.shimmerHighlight,
      tripCardOverlay: field == 'tripCardOverlay' ? value : c.tripCardOverlay,
      tripCardTitle: field == 'tripCardTitle' ? value : c.tripCardTitle,
      tripCardSubtitle: field == 'tripCardSubtitle' ? value : c.tripCardSubtitle,
      switchActiveTrack: field == 'switchActiveTrack' ? value : c.switchActiveTrack,
      switchInactiveTrack: field == 'switchInactiveTrack' ? value : c.switchInactiveTrack,
      switchThumb: field == 'switchThumb' ? value : c.switchThumb,
      tooltipBackground: field == 'tooltipBackground' ? value : c.tooltipBackground,
      tooltipText: field == 'tooltipText' ? value : c.tooltipText,
      snackbarBackground: field == 'snackbarBackground' ? value : c.snackbarBackground,
      snackbarText: field == 'snackbarText' ? value : c.snackbarText,
      inputBackgroundDark: c.inputBackgroundDark,
      inputBorderDark: c.inputBorderDark,
      inputBorderFocusedDark: c.inputBorderFocusedDark,
      buttonPrimaryDark: c.buttonPrimaryDark,
      buttonPrimaryTextDark: c.buttonPrimaryTextDark,
      buttonSecondaryDark: c.buttonSecondaryDark,
      buttonSecondaryTextDark: c.buttonSecondaryTextDark,
    );
    notifier.updateColors(updated);
  }

  void _writeTypography(String field, dynamic value) {
    final t = skin.typography;
    notifier.updateTypography(SkinTypography(
      headingFamily: field == 'headingFamily' ? value as String : t.headingFamily,
      bodyFamily: field == 'bodyFamily' ? value as String : t.bodyFamily,
      monoFamily: field == 'monoFamily' ? value as String : t.monoFamily,
      accentFamily: field == 'accentFamily' ? value as String? : t.accentFamily,
      scaleFactor: field == 'scaleFactor' ? (value as num).toDouble() : t.scaleFactor,
      headingScaleFactor: field == 'headingScaleFactor' ? (value as num?)?.toDouble() : t.headingScaleFactor,
      bodyScaleFactor: field == 'bodyScaleFactor' ? (value as num?)?.toDouble() : t.bodyScaleFactor,
      fontFallbacks: t.fontFallbacks,
      headingWeight: t.headingWeight,
      titleWeight: t.titleWeight,
      bodyWeight: t.bodyWeight,
      labelWeight: t.labelWeight,
      captionWeight: t.captionWeight,
      headingLetterSpacing: t.headingLetterSpacing,
      bodyLetterSpacing: t.bodyLetterSpacing,
      labelLetterSpacing: t.labelLetterSpacing,
      captionLetterSpacing: t.captionLetterSpacing,
      headingLineHeight: t.headingLineHeight,
      bodyLineHeight: t.bodyLineHeight,
      captionLineHeight: t.captionLineHeight,
    ));
  }

  void _writeShape(String field, dynamic value) {
    if (value is! num) return;
    final v = value.toDouble();
    final s = skin.shape;
    notifier.updateShape(SkinShape(
      cardRadius: field == 'cardRadius' ? v : s.cardRadius,
      buttonRadius: field == 'buttonRadius' ? v : s.buttonRadius,
      inputRadius: field == 'inputRadius' ? v : s.inputRadius,
      dialogRadius: field == 'dialogRadius' ? v : s.dialogRadius,
      glassRadius: field == 'glassRadius' ? v : s.glassRadius,
      glassPillRadius: s.glassPillRadius,
      badgeRadius: s.badgeRadius,
      photoRadius: field == 'photoRadius' ? v : s.photoRadius,
      chipRadius: field == 'chipRadius' ? v : s.chipRadius,
      menuRadius: field == 'menuRadius' ? v : s.menuRadius,
      popupRadius: field == 'popupRadius' ? v : s.popupRadius,
      bannerRadius: field == 'bannerRadius' ? v : s.bannerRadius,
      tooltipRadius: field == 'tooltipRadius' ? v : s.tooltipRadius,
      snackbarRadius: field == 'snackbarRadius' ? v : s.snackbarRadius,
      shimmerRadius: field == 'shimmerRadius' ? v : s.shimmerRadius,
      bottomSheetRadius: field == 'bottomSheetRadius' ? v : s.bottomSheetRadius,
      avatarRadius: s.avatarRadius,
      fabRadius: s.fabRadius,
      switchRadius: s.switchRadius,
      checkboxRadius: s.checkboxRadius,
      searchBarRadius: s.searchBarRadius,
      tabIndicatorRadius: s.tabIndicatorRadius,
      progressRadius: s.progressRadius,
      navigationBarRadius: s.navigationBarRadius,
    ));
  }

  void _writeEffects(String field, dynamic value) {
    final e = skin.effects;
    notifier.updateEffects(SkinEffects(
      enableGlass: field == 'enableGlass' ? value as bool : e.enableGlass,
      enableGlow: field == 'enableGlow' ? value as bool : e.enableGlow,
      enableShadows: field == 'enableShadows' ? value as bool : e.enableShadows,
      enableAnimations: field == 'enableAnimations' ? value as bool : e.enableAnimations,
      enableBlur: field == 'enableBlur' ? value as bool : e.enableBlur,
      glassBlurSigma: field == 'glassBlurSigma' ? (value as num).toDouble() : e.glassBlurSigma,
      glassFillOpacityDark: field == 'glassFillOpacityDark' ? (value as num).toDouble() : e.glassFillOpacityDark,
      glassFillOpacityLight: field == 'glassFillOpacityLight' ? (value as num).toDouble() : e.glassFillOpacityLight,
      glassBorderWidth: field == 'glassBorderWidth' ? (value as num).toDouble() : e.glassBorderWidth,
      glassBorderOpacityDark: e.glassBorderOpacityDark,
      glassBorderOpacityLight: e.glassBorderOpacityLight,
      glassDialogFillOpacityDark: e.glassDialogFillOpacityDark,
      glassDialogFillOpacityLight: e.glassDialogFillOpacityLight,
      glassDialogBorderOpacityDark: e.glassDialogBorderOpacityDark,
      glassDialogBorderOpacityLight: e.glassDialogBorderOpacityLight,
      shadowSm: e.shadowSm,
      shadowMd: e.shadowMd,
      shadowLg: e.shadowLg,
      shadowSmDark: e.shadowSmDark,
      shadowMdDark: e.shadowMdDark,
      shadowLgDark: e.shadowLgDark,
      durationFast: e.durationFast,
      durationNormal: e.durationNormal,
      durationSlow: e.durationSlow,
      curveDefault: e.curveDefault,
      curveSpring: e.curveSpring,
      curveSmooth: e.curveSmooth,
      hoverScaleFactor: e.hoverScaleFactor,
      pressScaleFactor: e.pressScaleFactor,
      hoverElevationBoost: e.hoverElevationBoost,
    ));
  }

  void _writeSpacing(String field, dynamic value) {
    if (value is! num) return;
    final v = value.toDouble();
    final s = skin.spacing;
    notifier.updateSpacing(SkinSpacing(
      cardContentPadding: field == 'cardContentPadding' ? v : s.cardContentPadding,
      cardContentPaddingCompact: s.cardContentPaddingCompact,
      cardGap: s.cardGap,
      cardHeaderGap: s.cardHeaderGap,
      cardFooterGap: s.cardFooterGap,
      cardPhotoGap: s.cardPhotoGap,
      screenPaddingHorizontal: s.screenPaddingHorizontal,
      screenPaddingTop: s.screenPaddingTop,
      screenPaddingBottom: s.screenPaddingBottom,
      sectionSpacing: s.sectionSpacing,
      sectionHeaderBottomSpacing: s.sectionHeaderBottomSpacing,
      sectionDividerSpacing: s.sectionDividerSpacing,
      dialogContentPadding: field == 'dialogContentPadding' ? v : s.dialogContentPadding,
      dialogTitleBottomSpacing: s.dialogTitleBottomSpacing,
      dialogActionSpacing: s.dialogActionSpacing,
      dialogActionTopSpacing: s.dialogActionTopSpacing,
      buttonPaddingHorizontal: s.buttonPaddingHorizontal,
      buttonPaddingVertical: s.buttonPaddingVertical,
      buttonPaddingHorizontalSm: s.buttonPaddingHorizontalSm,
      buttonPaddingVerticalSm: s.buttonPaddingVerticalSm,
      buttonGap: s.buttonGap,
      buttonIconGap: s.buttonIconGap,
      inputContentPadding: s.inputContentPadding,
      inputLabelSpacing: s.inputLabelSpacing,
      inputHelperSpacing: s.inputHelperSpacing,
      inputGroupSpacing: s.inputGroupSpacing,
      listItemPaddingVertical: s.listItemPaddingVertical,
      listItemPaddingHorizontal: s.listItemPaddingHorizontal,
      chipPaddingHorizontal: s.chipPaddingHorizontal,
      chipPaddingVertical: s.chipPaddingVertical,
      chipSpacing: s.chipSpacing,
      badgePaddingHorizontal: s.badgePaddingHorizontal,
      badgePaddingVertical: s.badgePaddingVertical,
      iconTextGap: s.iconTextGap,
      iconPadding: s.iconPadding,
      timelineConnectorWidth: field == 'timelineConnectorWidth' ? v : s.timelineConnectorWidth,
      timelineDotDiameter: field == 'timelineDotDiameter' ? v : s.timelineDotDiameter,
      timelineLeftMargin: s.timelineLeftMargin,
      timelineDateHeaderSpacing: field == 'timelineDateHeaderSpacing' ? v : s.timelineDateHeaderSpacing,
      photoCarouselGap: s.photoCarouselGap,
      photoGridGap: s.photoGridGap,
      appBarTitleSpacing: s.appBarTitleSpacing,
      appBarActionSpacing: s.appBarActionSpacing,
      tabBarLabelPadding: s.tabBarLabelPadding,
      tabBarIndicatorWeight: s.tabBarIndicatorWeight,
    ));
  }

  void _writeSizing(String field, dynamic value) {
    if (value is! num) return;
    final v = value.toDouble();
    final s = skin.sizing;
    notifier.updateSizing(SkinSizing(
      appBarHeight: field == 'appBarHeight' ? v : s.appBarHeight,
      bottomNavHeight: field == 'bottomNavHeight' ? v : s.bottomNavHeight,
      tabBarHeight: field == 'tabBarHeight' ? v : s.tabBarHeight,
      buttonHeight: field == 'buttonHeight' ? v : s.buttonHeight,
      inputHeight: field == 'inputHeight' ? v : s.inputHeight,
      borderWidth: field == 'borderWidth' ? v : s.borderWidth,
      borderWidthThick: field == 'borderWidthThick' ? v : s.borderWidthThick,
      dialogMaxWidth: field == 'dialogMaxWidth' ? v : s.dialogMaxWidth,
      appBarElevation: s.appBarElevation,
      appBarCenterTitle: s.appBarCenterTitle,
      buttonHeightSm: s.buttonHeightSm,
      buttonHeightLg: s.buttonHeightLg,
      buttonMinWidth: s.buttonMinWidth,
      buttonIconSize: s.buttonIconSize,
      inputHeightSm: s.inputHeightSm,
      iconSize: s.iconSize,
      iconSizeSm: s.iconSizeSm,
      iconSizeLg: s.iconSizeLg,
      iconSizeXl: s.iconSizeXl,
      avatarSize: s.avatarSize,
      avatarSizeSm: s.avatarSizeSm,
      avatarSizeLg: s.avatarSizeLg,
      badgeHeight: s.badgeHeight,
      badgeDotSize: s.badgeDotSize,
      chipHeight: s.chipHeight,
      fabSize: s.fabSize,
      fabSizeSm: s.fabSizeSm,
      dividerThickness: s.dividerThickness,
      borderWidthFocus: s.borderWidthFocus,
      photoAspectRatio: s.photoAspectRatio,
      photoThumbnailSize: s.photoThumbnailSize,
      photoCarouselHeight: s.photoCarouselHeight,
      cardMinHeight: s.cardMinHeight,
      cardMaxWidth: s.cardMaxWidth,
      cardElevation: s.cardElevation,
      cardBorderWidth: s.cardBorderWidth,
      dialogMinWidth: s.dialogMinWidth,
      dialogElevation: s.dialogElevation,
    ));
  }

  void _writeComponentStyles(String field, dynamic value) {
    // Component styles use enums — for now, only handle booleans and doubles.
    final cs = skin.componentStyles;
    if (value is bool) {
      notifier.updateComponentStyles(SkinComponentStyles(
        showCardBorder: field == 'showCardBorder' ? value : cs.showCardBorder,
        showCardShadow: field == 'showCardShadow' ? value : cs.showCardShadow,
        showButtonShadow: field == 'showButtonShadow' ? value : cs.showButtonShadow,
        showTimelineConnectors: field == 'showTimelineConnectors' ? value : cs.showTimelineConnectors,
        showInputBorder: cs.showInputBorder,
        showInputFill: cs.showInputFill,
        showPhotoOverlayGradient: cs.showPhotoOverlayGradient,
        useRippleEffect: cs.useRippleEffect,
        showScrollbar: cs.showScrollbar,
        showDividers: cs.showDividers,
        animatePageTransitions: cs.animatePageTransitions,
        animateCardHover: cs.animateCardHover,
        appBarStyle: cs.appBarStyle,
        cardStyle: cs.cardStyle,
        buttonVariant: cs.buttonVariant,
        buttonTextTransform: cs.buttonTextTransform,
        inputVariant: cs.inputVariant,
        dialogVariant: cs.dialogVariant,
        chipVariant: cs.chipVariant,
        badgeVariant: cs.badgeVariant,
        dividerVariant: cs.dividerVariant,
        photoShape: cs.photoShape,
        iconVariant: cs.iconVariant,
        loadingVariant: cs.loadingVariant,
        snackbarPosition: cs.snackbarPosition,
        tooltipVariant: cs.tooltipVariant,
        listSeparator: cs.listSeparator,
        tabIndicatorVariant: cs.tabIndicatorVariant,
        switchVariant: cs.switchVariant,
        navRailVariant: cs.navRailVariant,
        cursorVariant: cs.cursorVariant,
        tripCardOverlayOpacity: field == 'tripCardOverlayOpacity' ? (value as num).toDouble() : cs.tripCardOverlayOpacity,
      ));
    } else if (value is num) {
      notifier.updateComponentStyles(SkinComponentStyles(
        tripCardOverlayOpacity: field == 'tripCardOverlayOpacity' ? value.toDouble() : cs.tripCardOverlayOpacity,
        showCardBorder: cs.showCardBorder,
        showCardShadow: cs.showCardShadow,
        showButtonShadow: cs.showButtonShadow,
        showTimelineConnectors: cs.showTimelineConnectors,
        showInputBorder: cs.showInputBorder,
        showInputFill: cs.showInputFill,
        showPhotoOverlayGradient: cs.showPhotoOverlayGradient,
        useRippleEffect: cs.useRippleEffect,
        showScrollbar: cs.showScrollbar,
        showDividers: cs.showDividers,
        animatePageTransitions: cs.animatePageTransitions,
        animateCardHover: cs.animateCardHover,
        appBarStyle: cs.appBarStyle,
        cardStyle: cs.cardStyle,
        buttonVariant: cs.buttonVariant,
        buttonTextTransform: cs.buttonTextTransform,
        inputVariant: cs.inputVariant,
        dialogVariant: cs.dialogVariant,
        chipVariant: cs.chipVariant,
        badgeVariant: cs.badgeVariant,
        dividerVariant: cs.dividerVariant,
        photoShape: cs.photoShape,
        iconVariant: cs.iconVariant,
        loadingVariant: cs.loadingVariant,
        snackbarPosition: cs.snackbarPosition,
        tooltipVariant: cs.tooltipVariant,
        listSeparator: cs.listSeparator,
        tabIndicatorVariant: cs.tabIndicatorVariant,
        switchVariant: cs.switchVariant,
        navRailVariant: cs.navRailVariant,
        cursorVariant: cs.cursorVariant,
      ));
    }
  }

  void _writeDomainColors(String field, dynamic value) {
    if (value is! Color) return;
    final dc = skin.domainColors ?? const SkinDomainColors();
    notifier.updateDomainColors(SkinDomainColors(
      flight: field == 'flight' ? value : dc.flight,
      train: field == 'train' ? value : dc.train,
      car: field == 'car' ? value : dc.car,
      bus: field == 'bus' ? value : dc.bus,
      ferry: field == 'ferry' ? value : dc.ferry,
      hotel: field == 'hotel' ? value : dc.hotel,
      restaurant: field == 'restaurant' ? value : dc.restaurant,
      activity: field == 'activity' ? value : dc.activity,
      attraction: field == 'attraction' ? value : dc.attraction,
      rental: field == 'rental' ? value : dc.rental,
    ));
  }
}
