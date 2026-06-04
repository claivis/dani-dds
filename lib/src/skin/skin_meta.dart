import 'package:flutter/material.dart';

/// Metadata for a skin — used in the skin picker UI and skin browser.
class SkinMeta {
  const SkinMeta({
    required this.id,
    required this.name,
    required this.description,
    required this.previewColor,
    this.isPremium = false,
    this.author = 'dani.go',
    this.version = '1.0.0',
    this.tags = const [],
    this.category = SkinCategory.general,
    this.previewColorSecondary,
    this.supportsDarkMode = true,
  });

  /// Unique identifier (e.g. 'gemini', 'midnight', 'paper').
  final String id;

  /// Display name for the picker UI.
  final String name;

  /// One-line tagline describing the visual vibe.
  final String description;

  /// Primary accent color used in the picker thumbnail.
  final Color previewColor;

  /// Secondary preview color for gradient thumbnails. Null = single color.
  final Color? previewColorSecondary;

  /// Whether this skin requires a premium subscription.
  final bool isPremium;

  /// Skin author name.
  final String author;

  /// Skin version string.
  final String version;

  /// Searchable tags for the skin browser (e.g. ['dark', 'minimal', 'serif']).
  final List<String> tags;

  /// Category for organizing skins in the picker.
  final SkinCategory category;

  /// Whether this skin has a dark mode variant. If false, only light mode
  /// colors are meaningful and dark mode will use a generic fallback.
  final bool supportsDarkMode;
}

/// Skin categories for organizing the skin picker.
enum SkinCategory {
  /// General-purpose skins suitable for any use.
  general,
  /// Minimal, clean, modern designs.
  minimal,
  /// Bold, expressive, high-contrast designs.
  bold,
  /// Classic, editorial, refined designs.
  classic,
  /// Playful, colorful, fun designs.
  playful,
  /// Professional, corporate designs.
  professional,
  /// Nature-inspired, organic designs.
  nature,
  /// Tech, developer, futuristic designs.
  tech,
}
