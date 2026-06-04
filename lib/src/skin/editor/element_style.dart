import 'package:flutter/material.dart';

/// Per-element style overrides. All fields are nullable — `null` means
/// "inherit from parent element or global skin default".
///
/// Stored in a `Map<String, ElementStyle>` keyed by element path
/// (e.g. `"tripDetails.timeline.eventCard"`).
class ElementStyle {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? borderWidth;
  final double? padding;
  final double? opacity;

  const ElementStyle({
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.opacity,
  });

  /// True if no fields are set (all null).
  bool get isEmpty =>
      backgroundColor == null &&
      textColor == null &&
      borderColor == null &&
      fontFamily == null &&
      fontSize == null &&
      fontWeight == null &&
      borderRadius == null &&
      borderWidth == null &&
      padding == null &&
      opacity == null;

  /// Create a copy with the given fields replaced.
  ElementStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    double? borderRadius,
    double? borderWidth,
    double? padding,
    double? opacity,
    bool clearBackgroundColor = false,
    bool clearTextColor = false,
    bool clearBorderColor = false,
    bool clearFontFamily = false,
    bool clearFontSize = false,
    bool clearFontWeight = false,
    bool clearBorderRadius = false,
    bool clearBorderWidth = false,
    bool clearPadding = false,
    bool clearOpacity = false,
  }) {
    return ElementStyle(
      backgroundColor: clearBackgroundColor ? null : (backgroundColor ?? this.backgroundColor),
      textColor: clearTextColor ? null : (textColor ?? this.textColor),
      borderColor: clearBorderColor ? null : (borderColor ?? this.borderColor),
      fontFamily: clearFontFamily ? null : (fontFamily ?? this.fontFamily),
      fontSize: clearFontSize ? null : (fontSize ?? this.fontSize),
      fontWeight: clearFontWeight ? null : (fontWeight ?? this.fontWeight),
      borderRadius: clearBorderRadius ? null : (borderRadius ?? this.borderRadius),
      borderWidth: clearBorderWidth ? null : (borderWidth ?? this.borderWidth),
      padding: clearPadding ? null : (padding ?? this.padding),
      opacity: clearOpacity ? null : (opacity ?? this.opacity),
    );
  }

  // ── Serialization ─────────────────────────────────────────────────────

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (backgroundColor != null) map['backgroundColor'] = _colorToHex(backgroundColor!);
    if (textColor != null) map['textColor'] = _colorToHex(textColor!);
    if (borderColor != null) map['borderColor'] = _colorToHex(borderColor!);
    if (fontFamily != null) map['fontFamily'] = fontFamily;
    if (fontSize != null) map['fontSize'] = fontSize;
    if (fontWeight != null) map['fontWeight'] = _fontWeightToInt(fontWeight!);
    if (borderRadius != null) map['borderRadius'] = borderRadius;
    if (borderWidth != null) map['borderWidth'] = borderWidth;
    if (padding != null) map['padding'] = padding;
    if (opacity != null) map['opacity'] = opacity;
    return map;
  }

  factory ElementStyle.fromJson(Map<String, dynamic> json) {
    return ElementStyle(
      backgroundColor: _colorFromHex(json['backgroundColor'] as String?),
      textColor: _colorFromHex(json['textColor'] as String?),
      borderColor: _colorFromHex(json['borderColor'] as String?),
      fontFamily: json['fontFamily'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: _fontWeightFromInt(json['fontWeight'] as int?),
      borderRadius: (json['borderRadius'] as num?)?.toDouble(),
      borderWidth: (json['borderWidth'] as num?)?.toDouble(),
      padding: (json['padding'] as num?)?.toDouble(),
      opacity: (json['opacity'] as num?)?.toDouble(),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  static String _colorToHex(Color c) {
    final argb = c.toARGB32();
    return '#${argb.toRadixString(16).padLeft(8, '0')}';
  }

  static Color? _colorFromHex(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    var h = hex.replaceFirst('#', '');
    if (h.length == 6) h = 'FF$h';
    return Color(int.parse(h, radix: 16));
  }

  static int _fontWeightToInt(FontWeight w) => w.index * 100 + 100;

  static FontWeight? _fontWeightFromInt(int? v) {
    if (v == null) return null;
    final index = ((v / 100).round() - 1).clamp(0, 8);
    return FontWeight.values[index];
  }
}

/// Serializes an element overrides map to JSON.
Map<String, dynamic> elementOverridesToJson(Map<String, ElementStyle> overrides) {
  final map = <String, dynamic>{};
  for (final entry in overrides.entries) {
    final json = entry.value.toJson();
    if (json.isNotEmpty) {
      map[entry.key] = json;
    }
  }
  return map;
}

/// Deserializes an element overrides map from JSON.
Map<String, ElementStyle> elementOverridesFromJson(Map<String, dynamic>? json) {
  if (json == null) return {};
  final map = <String, ElementStyle>{};
  for (final entry in json.entries) {
    if (entry.value is Map<String, dynamic>) {
      final style = ElementStyle.fromJson(entry.value as Map<String, dynamic>);
      if (!style.isEmpty) {
        map[entry.key] = style;
      }
    }
  }
  return map;
}
