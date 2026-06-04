import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../skin/dani_skin.dart';
import '../skin/skin_typography.dart';
import 'dani_form_factor.dart';

/// Unified typography scale — ONE source of truth for all text styles.
///
/// Automatically reads font family, weight, scale, and spacing from the
/// active [DaniSkin] via a static [_activeSkinTypo] reference. This means
/// ALL existing call sites (without explicit skin param) get skin-aware fonts.
///
/// Uses [GoogleFonts.getFont] to load non-bundled fonts on demand (web).
/// The skin system calls [updateFromSkin] whenever the active skin changes.
abstract class DaniType {
  DaniType._();

  static const String _defaultFamily = 'Inter';

  /// CJK fallback chain — used by every TextStyle so that Korean / Japanese /
  /// Chinese characters render via system fonts when the active family
  /// (Inter, custom skin fonts, etc.) has no glyph for them.
  ///
  /// Without this, Korean text in an Inter-styled widget renders as tofu
  /// boxes on platforms whose default fallback chain does not include CJK.
  /// See `Blueprint/MULTI_LANGUAGE_DESIGN.md` §8.
  static const List<String> _cjkFallback = <String>[
    'Noto Sans KR',
    'Noto Sans JP',
    'Noto Sans SC',
    'Noto Sans TC',
  ];

  /// The active skin's typography. Set by the skin provider at startup and
  /// on every skin switch. When null, falls back to Inter defaults.
  static SkinTypography? _activeSkinTypo;

  /// Called by the skin system when the active skin changes.
  static void updateFromSkin(DaniSkin skin) {
    _activeSkinTypo = skin.typography;
  }

  // ── Resolved helpers ──

  static SkinTypography? _t([DaniSkin? skin]) => skin?.typography ?? _activeSkinTypo;
  static double _scale([DaniSkin? skin]) => _t(skin)?.scaleFactor ?? 1.0;

  /// Build a TextStyle using GoogleFonts for the given family.
  /// For 'Inter' (bundled locally), we use fontFamily directly.
  /// For all other fonts, we use GoogleFonts.getFont() which loads them on web.
  static TextStyle _styled(String family, {
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    if (family == _defaultFamily) {
      return TextStyle(
        fontFamily: _defaultFamily,
        fontFamilyFallback: _cjkFallback,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      );
    }
    try {
      return GoogleFonts.getFont(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ).copyWith(fontFamilyFallback: _cjkFallback);
    } catch (_) {
      // Font not available — fall back to Inter
      return TextStyle(
        fontFamily: _defaultFamily,
        fontFamilyFallback: _cjkFallback,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      );
    }
  }

  static String _headingFamily([DaniSkin? skin]) => _t(skin)?.headingFamily ?? _defaultFamily;
  static String _bodyFamily([DaniSkin? skin]) => _t(skin)?.bodyFamily ?? _defaultFamily;
  static String _monoFamily([DaniSkin? skin]) => _t(skin)?.monoFamily ?? 'JetBrains Mono';

  // ── Display (hero, page titles) ──

  static TextStyle displayLg(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 24 : ff.isTablet ? 28 : 32) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w700,
      height: t?.headingLineHeight ?? 1.2,
      letterSpacing: t?.headingLetterSpacing ?? -0.5,
    );
  }

  static TextStyle displayMd(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 20 : ff.isTablet ? 24 : 28) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w700,
      height: t?.headingLineHeight ?? 1.25,
      letterSpacing: t?.headingLetterSpacing ?? -0.3,
    );
  }

  // ── Headline (section titles, date headers) ──

  static TextStyle headlineMd(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 17 : ff.isTablet ? 18 : 20) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w600,
      height: t?.headingLineHeight ?? 1.3,
    );
  }

  static TextStyle headlineSm(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 15 : ff.isTablet ? 16 : 17) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w600,
      height: t?.headingLineHeight ?? 1.3,
    );
  }

  // ── Title (event titles, emphasized content) ──

  static TextStyle titleMd(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 14 : 15) * _scale(skin),
      fontWeight: t?.titleWeight ?? FontWeight.w600,
      height: 1.35,
    );
  }

  static TextStyle titleSm(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 13 : 14) * _scale(skin),
      fontWeight: t?.titleWeight ?? FontWeight.w600,
      height: 1.35,
    );
  }

  // ── Body (primary readable content) ──

  static TextStyle bodyLg(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 15 : 16) * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: t?.bodyLineHeight ?? 1.5,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }

  static TextStyle bodyMd(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 14 : ff.isTablet ? 14 : 15) * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: t?.bodyLineHeight ?? 1.5,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }

  static TextStyle bodySm(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 13 : 14) * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: t?.bodyLineHeight ?? 1.45,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }

  // ── Detail (secondary info — addresses, dates, metadata) ──

  static TextStyle detail(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: 12 * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: 1.4,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }

  // ── Caption (timestamps, badges, micro-text — minimum 11px) ──

  static TextStyle caption(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: 11 * _scale(skin),
      fontWeight: t?.labelWeight ?? FontWeight.w500,
      height: 1.3,
    );
  }

  // ── Label (buttons, form labels, chips) ──

  static TextStyle label(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 13 : 14) * _scale(skin),
      fontWeight: t?.labelWeight ?? FontWeight.w500,
      height: 1.3,
    );
  }

  // ── Event Card ──

  static double cardTitleSize(DaniFormFactor ff, [DaniSkin? skin]) {
    final scale = _scale(skin);
    return (ff.isPhone ? 14.0 : 15.0) * scale;
  }

  static double cardDetailSize(DaniFormFactor ff, [DaniSkin? skin]) {
    final scale = _scale(skin);
    return 12.0 * scale;
  }

  static double cardCaptionSize(DaniFormFactor ff, [DaniSkin? skin]) {
    final scale = _scale(skin);
    return 11.0 * scale;
  }

  static double cardCategorySize(DaniFormFactor ff, [DaniSkin? skin]) {
    final scale = _scale(skin);
    return 11.0 * scale;
  }

  // ── Helpers ──

  static TextStyle chatMessage(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 14 : 15) * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: t?.bodyLineHeight ?? 1.5,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }

  static TextStyle chatSender(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 12 : 13) * _scale(skin),
      fontWeight: t?.labelWeight ?? FontWeight.w600,
      height: 1.3,
    );
  }

  static TextStyle timeColumn(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_monoFamily(skin),
      fontSize: (ff.isPhone ? 12 : 14) * _scale(skin),
      fontWeight: t?.labelWeight ?? FontWeight.w500,
      height: 1.2,
    );
  }

  static TextStyle dateHeader(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 15 : ff.isTablet ? 16 : 17) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w600,
      height: 1.3,
    );
  }

  static TextStyle bannerTitle(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_headingFamily(skin),
      fontSize: (ff.isPhone ? 20 : ff.isTablet ? 24 : 28) * _scale(skin),
      fontWeight: t?.headingWeight ?? FontWeight.w700,
      height: 1.2,
      letterSpacing: t?.headingLetterSpacing ?? -0.3,
    );
  }

  static TextStyle bannerSubtitle(DaniFormFactor ff, [DaniSkin? skin]) {
    final t = _t(skin);
    return _styled(_bodyFamily(skin),
      fontSize: (ff.isPhone ? 12 : ff.isTablet ? 13 : 14) * _scale(skin),
      fontWeight: t?.bodyWeight ?? FontWeight.w400,
      height: 1.3,
      letterSpacing: t?.bodyLetterSpacing,
    );
  }
}
