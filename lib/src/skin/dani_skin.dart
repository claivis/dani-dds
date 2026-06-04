import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/dani_color_scheme.dart';
import 'editor/element_style.dart';
import 'skin_colors.dart';
import 'skin_component_styles.dart';
import 'skin_domain_colors.dart';
import 'skin_effects.dart';
import 'skin_meta.dart';
import 'skin_shape.dart';
import 'skin_sizing.dart';
import 'skin_spacing.dart';
import 'skin_typography.dart';

export 'editor/element_style.dart';
export 'skin_colors.dart';
export 'skin_component_styles.dart';
export 'skin_domain_colors.dart';
export 'skin_effects.dart';
export 'skin_meta.dart';
export 'skin_shape.dart';
export 'skin_sizing.dart';
export 'skin_spacing.dart';
export 'skin_typography.dart';

/// The complete visual contract for a dani.go skin.
///
/// Concrete skins implement this to define fonts, colors, radii, shadows,
/// and effects. Access the active skin via [DaniSkin.of(context)].
///
/// Skins do NOT control layout (spacing, breakpoints, form factor) — those
/// stay in [DaniSpacing] and [DaniFormFactor].
abstract class DaniSkin {
  const DaniSkin();

  /// Metadata for the skin picker UI.
  SkinMeta get meta;

  /// Full color palette (light + dark mode).
  SkinColors get colors;

  /// Font families, weights, scale factor.
  SkinTypography get typography;

  /// Border radii for all UI element categories.
  SkinShape get shape;

  /// Glass, shadows, glow, animation parameters.
  SkinEffects get effects;

  /// Spacing and padding — controls visual density.
  /// Returns default values if not overridden by the skin.
  SkinSpacing get spacing => const SkinSpacing();

  /// Element sizing — controls dimensions of UI elements.
  /// Returns default values if not overridden by the skin.
  SkinSizing get sizing => const SkinSizing();

  /// Component style variants — high-level rendering switches.
  /// Returns default values if not overridden by the skin.
  SkinComponentStyles get componentStyles => const SkinComponentStyles();

  /// Optional domain color overrides (event types, transport types).
  /// Returns null to use [AppColors] defaults.
  SkinDomainColors? get domainColors => null;

  /// Per-element style overrides. Keyed by element path
  /// (e.g. `"tripDetails.timeline.eventCard"`).
  /// Empty map means all values are inherited from global skin params.
  Map<String, ElementStyle> get elementOverrides => const {};

  /// Resolve a style property for a specific element path.
  ///
  /// Walks up the element path hierarchy, checking for overrides at each level.
  /// Falls back to `null` if no override is found (caller should use the
  /// global skin param as default).
  ///
  /// Example:
  /// ```dart
  /// final bg = skin.resolve('tripDetails.timeline.eventCard', 'backgroundColor')
  ///     ?? skin.colors.surfaceElevated;
  /// ```
  T? resolve<T>(String elementPath, String property) {
    final overrides = elementOverrides;
    if (overrides.isEmpty) return null;

    // Check exact path, then walk up parents.
    var path = elementPath;
    while (path.isNotEmpty) {
      final style = overrides[path];
      if (style != null) {
        final value = _readStyleProperty<T>(style, property);
        if (value != null) {
          debugPrint('🎨 RESOLVE HIT: $elementPath.$property = $value (from override at "$path")');
          return value;
        }
      }
      // Move to parent: "a.b.c" → "a.b"
      final lastDot = path.lastIndexOf('.');
      if (lastDot < 0) break;
      path = path.substring(0, lastDot);
    }
    return null;
  }

  /// Read a named property from an [ElementStyle].
  T? _readStyleProperty<T>(ElementStyle style, String property) {
    final value = switch (property) {
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
    return value is T ? value : null;
  }

  /// Build a [DaniColorScheme] for the given brightness from this skin's colors.
  DaniColorScheme buildColorScheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final c = colors;
    return DaniColorScheme(
      primary: isDark ? c.primaryLight : c.primary,
      onPrimary: c.primaryForeground,
      secondary: c.secondary,
      onSecondary: c.secondaryForeground,
      background: c.bg(isDark),
      onBackground: c.txt(isDark),
      surface: c.surf(isDark),
      onSurface: c.txt(isDark),
      surfaceVariant: c.surfVariant(isDark),
      onSurfaceVariant: c.txtMuted(isDark),
      outline: c.brd(isDark),
      outlineVariant: c.brdSubtle(isDark),
      outlineTertiary: isDark ? c.backgroundDark : c.surfaceVariant,
      textPrimary: c.txt(isDark),
      textSecondary: c.txtMuted(isDark),
      textTertiary: c.txtSubtle(isDark),
      textDisabled: c.txtDisabled(isDark),
      success: c.success,
      onSuccess: isDark ? c.primaryForeground : Colors.white,
      error: c.error,
      onError: Colors.white,
      warning: c.warning,
      onWarning: c.primaryForeground,
      info: c.info,
      onInfo: c.primaryForeground,
      inputBackground: c.inputBg(isDark),
      inputBorder: c.inputBrd(isDark),
      inputBorderFocused: c.inputBrdFocused(isDark),
      buttonPrimary: c.btnPrimary(isDark),
      buttonPrimaryText: c.btnPrimaryTxt(isDark),
      buttonSecondary: c.btnSecondary(isDark),
      buttonSecondaryText: c.btnSecondaryTxt(isDark),
      shadow: c.shadowColor(isDark),
      scrim: c.scrimColor(isDark),
      selection: c.selectionColor(isDark),
      hover: c.selectionColor(isDark).withOpacity(0.08),
      shadowLight: c.shadowColor(isDark).withOpacity(0.05),
      shadowMedium: c.shadowColor(isDark).withOpacity(0.20),
      shadowHeavy: c.shadowColor(isDark).withOpacity(0.60),
    );
  }

  /// Build a complete [ThemeData] from this skin for the given brightness.
  ThemeData buildThemeData(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = buildColorScheme(brightness);
    final c = colors;
    final t = typography;
    final s = shape;

    final sp = spacing;
    final sz = sizing;
    final cs = componentStyles;

    final fontFallbacks = t.fontFallbacks.isNotEmpty
        ? t.fontFallbacks
        : kIsWeb
            ? const [
                'Noto Sans',
                'Noto Sans JP',
                'Noto Sans KR',
                'Noto Sans SC',
                'Noto Sans TC',
                'Noto Sans Arabic',
                'Noto Sans Thai',
                'Noto Sans Devanagari',
              ]
            : const <String>[];

    final hScale = t.headingScaleFactor ?? t.scaleFactor;
    final bScale = t.bodyScaleFactor ?? t.scaleFactor;

    // Use GoogleFonts to get proper font loading for non-bundled fonts.
    TextStyle _h({double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) {
      final effectiveSize = fontSize != null ? fontSize * hScale : null;
      if (t.headingFamily == 'Inter') {
        return TextStyle(fontFamily: 'Inter', fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.headingFontStyle);
      }
      try {
        return GoogleFonts.getFont(t.headingFamily, fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.headingFontStyle);
      } catch (_) {
        return TextStyle(fontFamily: 'Inter', fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.headingFontStyle);
      }
    }
    TextStyle _b({double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) {
      final effectiveSize = fontSize != null ? fontSize * bScale : null;
      if (t.bodyFamily == 'Inter') {
        return TextStyle(fontFamily: 'Inter', fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.bodyFontStyle);
      }
      try {
        return GoogleFonts.getFont(t.bodyFamily, fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.bodyFontStyle);
      } catch (_) {
        return TextStyle(fontFamily: 'Inter', fontSize: effectiveSize, fontWeight: fontWeight, height: height, letterSpacing: letterSpacing, fontStyle: t.bodyFontStyle);
      }
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      visualDensity: VisualDensity.compact,
      colorScheme: scheme.toFlutterColorScheme(brightness),
      fontFamily: t.bodyFamily == 'Inter' ? 'Inter' : null,
      fontFamilyFallback: fontFallbacks,
      textTheme: TextTheme(
        displayLarge: _h(
          fontSize: 48,
          fontWeight: t.headingWeight ?? FontWeight.w800,
          height: t.headingLineHeight ?? 1.1,
          letterSpacing: t.headingLetterSpacing ?? -0.5,
        ),
        displayMedium: _h(
          fontSize: 40,
          fontWeight: t.headingWeight ?? FontWeight.w800,
          height: t.headingLineHeight ?? 1.1,
        ),
        headlineLarge: _h(fontSize: 32, fontWeight: t.headingWeight ?? FontWeight.w700, height: t.headingLineHeight ?? 1.2),
        headlineMedium: _h(fontSize: 28, fontWeight: t.headingWeight ?? FontWeight.w700, height: t.headingLineHeight ?? 1.2),
        headlineSmall: _h(fontSize: 24, fontWeight: t.headingWeight ?? FontWeight.w700, height: 1.3),
        titleLarge: _h(fontSize: 18, fontWeight: t.titleWeight ?? FontWeight.w700, height: 1.4),
        titleMedium: _h(fontSize: 16, fontWeight: t.titleWeight ?? FontWeight.w600, height: 1.4),
        titleSmall: _b(fontSize: 14, fontWeight: t.titleWeight ?? FontWeight.w600, height: 1.4),
        bodyLarge: _b(fontSize: 18, fontWeight: t.bodyWeight ?? FontWeight.w400, height: t.bodyLineHeight ?? 1.5),
        bodyMedium: _b(fontSize: 16, fontWeight: t.bodyWeight ?? FontWeight.w400, height: t.bodyLineHeight ?? 1.5),
        bodySmall: _b(fontSize: 14, fontWeight: t.bodyWeight ?? FontWeight.w400, height: t.bodyLineHeight ?? 1.5),
        labelLarge: _b(fontSize: 14, fontWeight: t.labelWeight ?? FontWeight.w700, height: 1.3, letterSpacing: t.labelLetterSpacing ?? 0.1),
        labelMedium: _b(fontSize: 13, fontWeight: t.labelWeight ?? FontWeight.w500, height: 1.3),
        labelSmall: _b(fontSize: 12, fontWeight: t.captionWeight ?? t.labelWeight ?? FontWeight.w500, height: t.captionLineHeight ?? 1.3),
      ),
      cardTheme: CardThemeData(
        color: resolve<Color>('tripDetails.timeline.eventCard', 'backgroundColor') ?? c.surf(isDark),
        elevation: sz.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              resolve<double>('tripDetails.timeline.eventCard', 'borderRadius') ?? s.cardRadius),
          side: cs.showCardBorder
              ? BorderSide(
                  color: resolve<Color>('tripDetails.timeline.eventCard', 'borderColor') ?? c.brd(isDark),
                  width: sz.cardBorderWidth)
              : BorderSide.none,
        ),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: cs.showInputFill,
        fillColor: resolve<Color>('inputs', 'backgroundColor') ?? c.inputBg(isDark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              resolve<double>('inputs', 'borderRadius') ?? s.inputRadius),
          borderSide: BorderSide(
              color: resolve<Color>('inputs', 'borderColor') ?? c.inputBrd(isDark),
              width: sz.borderWidthFocus),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.inputRadius),
          borderSide: cs.showInputBorder
              ? BorderSide(color: c.inputBrd(isDark), width: sz.borderWidth)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.inputRadius),
          borderSide: BorderSide(color: c.inputBrdFocused(isDark), width: sz.borderWidthFocus),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(s.inputRadius),
          borderSide: BorderSide(color: c.error, width: sz.borderWidthFocus),
        ),
        contentPadding: EdgeInsets.all(sp.inputContentPadding),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.btnPrimary(isDark),
          foregroundColor: c.btnPrimaryTxt(isDark),
          elevation: cs.showButtonShadow ? 2 : 0,
          shadowColor: c.shadowColor(isDark),
          minimumSize: Size(sz.buttonMinWidth, sz.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s.buttonRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: sp.buttonPaddingHorizontal,
            vertical: sp.buttonPaddingVertical,
          ),
          textStyle: TextStyle(
            fontSize: 16 * bScale,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: c.bg(isDark),
        foregroundColor: c.txt(isDark),
        elevation: sz.appBarElevation,
        centerTitle: sz.appBarCenterTitle,
        toolbarHeight: sz.appBarHeight,
        titleTextStyle: TextStyle(
          fontFamily: t.headingFamily,
          fontSize: 20 * hScale,
          fontWeight: FontWeight.w700,
          color: c.txt(isDark),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: c.div(isDark),
        thickness: sz.dividerThickness,
        space: sz.dividerThickness,
        indent: sp.listDividerIndent,
        endIndent: sp.listDividerEndIndent,
      ),
      iconTheme: IconThemeData(
        color: c.primary,
        size: sz.iconSize,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: resolve<Color>('tooltips', 'backgroundColor') ?? c.tooltipBg(isDark),
          borderRadius: BorderRadius.circular(
              resolve<double>('tooltips', 'borderRadius') ?? s.tooltipRadius),
        ),
        textStyle: TextStyle(
          color: resolve<Color>('tooltips', 'textColor') ?? c.tooltipTxt(isDark),
          fontSize: 12 * bScale,
          fontFamily: resolve<String>('tooltips', 'fontFamily'),
        ),
        padding: EdgeInsets.all(sp.tooltipPadding),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: resolve<Color>('snackbars', 'backgroundColor') ?? c.snackBg(isDark),
        contentTextStyle: TextStyle(
          color: resolve<Color>('snackbars', 'textColor') ?? c.snackTxt(isDark),
          fontFamily: resolve<String>('snackbars', 'fontFamily'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              resolve<double>('snackbars', 'borderRadius') ?? s.snackbarRadius),
        ),
        behavior: SnackBarBehavior.floating,
        insetPadding: EdgeInsets.all(sp.snackbarMargin),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.primary,
        foregroundColor: c.primaryForeground,
        elevation: cs.showButtonShadow ? 6 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.fabRadius),
        ),
        sizeConstraints: BoxConstraints.tightFor(width: sz.fabSize, height: sz.fabSize),
        smallSizeConstraints: BoxConstraints.tightFor(width: sz.fabSizeSm, height: sz.fabSizeSm),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: cs.chipVariant == ChipVariant.filled ? c.surfVariant(isDark) : Colors.transparent,
        side: cs.chipVariant == ChipVariant.outlined
            ? BorderSide(color: c.brd(isDark), width: sz.borderWidth)
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.chipRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sp.chipPaddingHorizontal,
          vertical: sp.chipPaddingVertical,
        ),
        labelStyle: TextStyle(fontSize: 13 * bScale, color: c.txt(isDark)),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: c.tabSelected(isDark),
        unselectedLabelColor: c.tabUnselected(isDark),
        indicatorColor: c.tabIndicator(isDark),
        labelPadding: EdgeInsets.symmetric(horizontal: sp.tabBarLabelPadding),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: c.navBg(isDark),
        selectedItemColor: c.navSelected(isDark),
        unselectedItemColor: c.navUnselected(isDark),
        selectedIconTheme: IconThemeData(size: sz.iconSize),
        unselectedIconTheme: IconThemeData(size: sz.iconSize),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(c.switchThumbColor(isDark)),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return c.switchTrackActive(isDark);
          }
          return c.switchTrackInactive(isDark);
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.checkboxRadius),
        ),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return c.primary;
          return Colors.transparent;
        }),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStatePropertyAll(sz.scrollbarThickness),
        radius: Radius.circular(sz.scrollbarRadius),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: resolve<Color>('dialogs', 'backgroundColor') ?? c.surf(isDark),
        elevation: sz.dialogElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              resolve<double>('dialogs', 'borderRadius') ?? s.dialogRadius),
        ),
        contentTextStyle: _b(fontSize: 14, fontWeight: t.bodyWeight ?? FontWeight.w400, height: t.bodyLineHeight ?? 1.5).copyWith(color: c.txt(isDark)),
        titleTextStyle: _h(fontSize: 20, fontWeight: t.headingWeight ?? FontWeight.w700, height: 1.3).copyWith(color: c.txt(isDark)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surf(isDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(s.bottomSheetRadius),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.primary,
        linearTrackColor: c.surfVariant(isDark),
        circularTrackColor: c.surfVariant(isDark),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: c.surf(isDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(s.menuRadius),
        ),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: sp.listItemPaddingHorizontal,
          vertical: sp.listItemPaddingVertical,
        ),
        iconColor: c.txtMuted(isDark),
        textColor: c.txt(isDark),
      ),
    );
  }

  /// Access the active skin from the widget tree.
  static DaniSkin of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DaniSkinScope>();
    assert(scope != null, 'No DaniSkinScope found in widget tree. Wrap MaterialApp with DaniSkinScope.');
    return scope!.skin;
  }

  /// Access without listening for changes (useful in callbacks).
  static DaniSkin read(BuildContext context) {
    final scope = context.getInheritedWidgetOfExactType<DaniSkinScope>();
    assert(scope != null, 'No DaniSkinScope found in widget tree.');
    return scope!.skin;
  }
}

/// InheritedWidget that provides the active [DaniSkin] to the widget tree.
class DaniSkinScope extends InheritedWidget {
  const DaniSkinScope({
    super.key,
    required this.skin,
    required super.child,
  });

  final DaniSkin skin;

  @override
  bool updateShouldNotify(DaniSkinScope oldWidget) {
    // Always notify when the skin object changes — not just the ID.
    // This is critical for live preview in the skin editor, where
    // colors/shapes/effects change while the ID stays the same.
    return !identical(skin, oldWidget.skin);
  }
}
