import 'package:flutter/material.dart';

// ── Color helpers ──────────────────────────────────────────────────────────

String _colorToHex(Color c) {
  final argb = c.toARGB32();
  final a = (argb >> 24) & 0xFF;
  final hex = argb.toRadixString(16).padLeft(8, '0').toUpperCase();
  return a == 0xFF ? '#${hex.substring(2)}' : '#$hex';
}

Color _colorFromHex(String hex) {
  final clean = hex.replaceFirst('#', '');
  final value = int.parse(clean.length == 6 ? 'FF$clean' : clean, radix: 16);
  return Color(value);
}

// ── FontWeight helpers ─────────────────────────────────────────────────────

int _fontWeightToInt(FontWeight w) => w.index * 100 + 100;

FontWeight _fontWeightFromInt(int v) {
  final idx = (v ~/ 100 - 1).clamp(0, FontWeight.values.length - 1);
  return FontWeight.values[idx];
}

// ── ColorProfile ───────────────────────────────────────────────────────────

/// A saved color palette preset for the skin editor.
///
/// Stores the five key brand colors that define a skin's color identity.
/// The editor lets users save, load, and share color profiles independently
/// of a full skin file.
class ColorProfile {
  const ColorProfile({
    required this.id,
    required this.name,
    required this.primary,
    required this.light,
    required this.dark,
    required this.foreground,
  });

  /// Unique identifier (slug, e.g. 'ocean-breeze').
  final String id;

  /// Human-readable display name shown in the editor picker.
  final String name;

  /// Primary brand color.
  final Color primary;

  /// Light variant of the primary color (used for light mode accents).
  final Color light;

  /// Dark variant of the primary color (used for dark mode accents).
  final Color dark;

  /// Foreground color that contrasts with [primary] (text on primary button).
  final Color foreground;

  ColorProfile copyWith({
    String? id,
    String? name,
    Color? primary,
    Color? light,
    Color? dark,
    Color? foreground,
  }) =>
      ColorProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        primary: primary ?? this.primary,
        light: light ?? this.light,
        dark: dark ?? this.dark,
        foreground: foreground ?? this.foreground,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'primary': _colorToHex(primary),
        'light': _colorToHex(light),
        'dark': _colorToHex(dark),
        'foreground': _colorToHex(foreground),
      };

  static ColorProfile fromJson(Map<String, dynamic> json) => ColorProfile(
        id: json['id'] as String,
        name: json['name'] as String,
        primary: _colorFromHex(json['primary'] as String),
        light: _colorFromHex(json['light'] as String),
        dark: _colorFromHex(json['dark'] as String),
        foreground: _colorFromHex(json['foreground'] as String),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorProfile &&
          id == other.id &&
          name == other.name &&
          primary == other.primary &&
          light == other.light &&
          dark == other.dark &&
          foreground == other.foreground;

  @override
  int get hashCode => Object.hash(id, name, primary, light, dark, foreground);
}

// ── FontProfile ────────────────────────────────────────────────────────────

/// A saved typography preset for the skin editor.
///
/// Captures a font family plus the key typographic properties that give it
/// character. The editor lets users preview and apply font profiles without
/// touching the full skin configuration.
class FontProfile {
  const FontProfile({
    required this.id,
    required this.name,
    required this.family,
    this.weight = FontWeight.w400,
    this.size = 16,
    this.letterSpacing = 0,
    this.lineHeight = 1.5,
    this.style = FontStyle.normal,
  });

  /// Unique identifier (slug, e.g. 'inter-tight').
  final String id;

  /// Human-readable display name shown in the editor picker.
  final String name;

  /// Google Font family name (must be available via google_fonts package).
  final String family;

  /// Default font weight for this profile.
  final FontWeight weight;

  /// Reference body font size in logical pixels.
  final double size;

  /// Letter spacing in logical pixels. 0 = default.
  final double letterSpacing;

  /// Line height multiplier. 1.0 = tight, 1.5 = normal, 2.0 = loose.
  final double lineHeight;

  /// Font style (normal or italic).
  final FontStyle style;

  FontProfile copyWith({
    String? id,
    String? name,
    String? family,
    FontWeight? weight,
    double? size,
    double? letterSpacing,
    double? lineHeight,
    FontStyle? style,
  }) =>
      FontProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        family: family ?? this.family,
        weight: weight ?? this.weight,
        size: size ?? this.size,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        lineHeight: lineHeight ?? this.lineHeight,
        style: style ?? this.style,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'family': family,
        'weight': _fontWeightToInt(weight),
        'size': size,
        'letterSpacing': letterSpacing,
        'lineHeight': lineHeight,
        'style': style == FontStyle.italic ? 'italic' : 'normal',
      };

  static FontProfile fromJson(Map<String, dynamic> json) => FontProfile(
        id: json['id'] as String,
        name: json['name'] as String,
        family: json['family'] as String,
        weight: _fontWeightFromInt((json['weight'] as num).toInt()),
        size: (json['size'] as num).toDouble(),
        letterSpacing: (json['letterSpacing'] as num).toDouble(),
        lineHeight: (json['lineHeight'] as num).toDouble(),
        style: json['style'] == 'italic' ? FontStyle.italic : FontStyle.normal,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FontProfile &&
          id == other.id &&
          name == other.name &&
          family == other.family &&
          weight == other.weight &&
          size == other.size &&
          letterSpacing == other.letterSpacing &&
          lineHeight == other.lineHeight &&
          style == other.style;

  @override
  int get hashCode =>
      Object.hash(id, name, family, weight, size, letterSpacing, lineHeight, style);
}

// ── ShapeProfile ───────────────────────────────────────────────────────────

/// A saved shape/radius preset for the skin editor.
///
/// A single radius value is enough to communicate the full "roundness
/// personality" of a skin — the editor scales all element radii relative
/// to this primary value.
class ShapeProfile {
  const ShapeProfile({
    required this.id,
    required this.name,
    required this.radius,
  });

  /// Unique identifier (slug, e.g. 'rounded-xl').
  final String id;

  /// Human-readable display name shown in the editor picker.
  final String name;

  /// Primary corner radius in logical pixels.
  /// 0 = fully square/brutalist, 9999 = fully circular/pill.
  final double radius;

  ShapeProfile copyWith({
    String? id,
    String? name,
    double? radius,
  }) =>
      ShapeProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        radius: radius ?? this.radius,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'radius': radius,
      };

  static ShapeProfile fromJson(Map<String, dynamic> json) => ShapeProfile(
        id: json['id'] as String,
        name: json['name'] as String,
        radius: (json['radius'] as num).toDouble(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShapeProfile &&
          id == other.id &&
          name == other.name &&
          radius == other.radius;

  @override
  int get hashCode => Object.hash(id, name, radius);
}
