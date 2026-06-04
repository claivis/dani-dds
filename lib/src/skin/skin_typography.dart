import 'package:flutter/material.dart';

/// Typography configuration for a skin.
///
/// Controls font families, weight overrides, letter spacing, line height,
/// text decoration, and a global scale factor. The responsive size logic
/// stays in [DaniType] — this class defines the *character* of the text
/// (serif vs sans, tight vs airy, decorated vs plain).
class SkinTypography {
  const SkinTypography({
    required this.headingFamily,
    required this.bodyFamily,
    this.monoFamily = 'JetBrains Mono',
    this.accentFamily,
    this.fontFallbacks = const [],
    this.scaleFactor = 1.0,
    this.headingScaleFactor,
    this.bodyScaleFactor,
    this.headingWeight,
    this.titleWeight,
    this.bodyWeight,
    this.labelWeight,
    this.captionWeight,
    this.headingLetterSpacing,
    this.bodyLetterSpacing,
    this.labelLetterSpacing,
    this.captionLetterSpacing,
    this.headingLineHeight,
    this.bodyLineHeight,
    this.captionLineHeight,
    this.headingWordSpacing,
    this.bodyWordSpacing,
    this.headingFontStyle,
    this.bodyFontStyle,
    this.headingTextBaseline,
    this.bodyTextBaseline,
  });

  /// Font for display and headline text (hero, section titles, banners).
  /// Screen: everywhere — trip titles, date headers, dialog titles, section
  /// headings, onboarding hero text, landing page banners.
  final String headingFamily;

  /// Font for body, detail, caption, label text.
  /// Screen: everywhere — event descriptions, place details, form labels,
  /// settings text, chat messages, list items.
  final String bodyFamily;

  /// Font for monospace contexts (timestamps with fixed width, code blocks).
  /// Screen: timeline time column, debug output, code snippets.
  final String monoFamily;

  /// Optional accent font for special UI elements (badges, decorative text).
  /// Falls back to [headingFamily] if null.
  /// Screen: premium badges, special labels, decorative pull quotes.
  final String? accentFamily;

  /// CJK + multilingual fallbacks (web only — native OS handles this).
  final List<String> fontFallbacks;

  /// Global multiplier applied to ALL font sizes. 1.0 = default sizes.
  /// A skin with larger text uses 1.05–1.1; a compact skin uses 0.9–0.95.
  /// Screen: affects every text element in the entire app.
  final double scaleFactor;

  /// Optional separate scale factor for headings only. Null = use [scaleFactor].
  /// Allows skins to make headings dramatically larger/smaller than body.
  final double? headingScaleFactor;

  /// Optional separate scale factor for body text only. Null = use [scaleFactor].
  final double? bodyScaleFactor;

  /// Weight overrides — null means use DaniType defaults.
  /// Screen: headingWeight affects all display/headline/title text;
  /// bodyWeight affects all body/detail text.
  final FontWeight? headingWeight;
  final FontWeight? titleWeight;
  final FontWeight? bodyWeight;
  final FontWeight? labelWeight;

  /// Caption text weight. Used by: photo captions, timestamps, metadata.
  final FontWeight? captionWeight;

  /// Letter spacing overrides — null means use DaniType defaults.
  /// Positive = wider spacing, negative = tighter. In logical pixels.
  final double? headingLetterSpacing;
  final double? bodyLetterSpacing;

  /// Letter spacing for label text (buttons, badges, chips, tabs).
  final double? labelLetterSpacing;

  /// Letter spacing for caption text (timestamps, metadata, fine print).
  final double? captionLetterSpacing;

  /// Line height overrides — null means use DaniType defaults.
  /// Expressed as a multiplier of font size (1.0 = tight, 1.5 = normal, 2.0 = double).
  final double? headingLineHeight;
  final double? bodyLineHeight;

  /// Line height for caption text.
  final double? captionLineHeight;

  /// Word spacing overrides — null means default (0.0).
  /// Positive = wider word gaps, negative = tighter.
  final double? headingWordSpacing;
  final double? bodyWordSpacing;

  /// Font style overrides — null means normal (upright).
  /// Set to FontStyle.italic to make all headings italic.
  final FontStyle? headingFontStyle;
  final FontStyle? bodyFontStyle;

  /// Text baseline — null means alphabetic (default for Latin scripts).
  /// Set to TextBaseline.ideographic for CJK-primary skins.
  final TextBaseline? headingTextBaseline;
  final TextBaseline? bodyTextBaseline;
}
