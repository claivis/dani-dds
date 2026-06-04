import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Pre-loads Google Fonts used by skins so they're available immediately
/// when a skin is activated. Call once at startup.
///
/// On web, GoogleFonts fetches from fonts.googleapis.com.
/// On native, the OS may provide fallbacks, but we still preload for consistency.
void preloadSkinFonts() {
  // Register each font family so Flutter knows about them.
  // We call .fontFamily on a TextStyle to trigger the registration.
  _register('Playfair Display', GoogleFonts.playfairDisplay);
  _register('Merriweather', GoogleFonts.merriweather);
  _register('Source Serif Pro', GoogleFonts.sourceSerif4);
  _register('Space Grotesk', GoogleFonts.spaceGrotesk);
  _register('JetBrains Mono', GoogleFonts.jetBrainsMono);
  _register('DM Sans', GoogleFonts.dmSans);
}

void _register(String name, TextStyle Function({TextStyle? textStyle}) factory) {
  // Calling the factory registers the font with the engine.
  // We don't need the result — just the side effect.
  factory();
}

/// Get a GoogleFonts TextStyle for a font family name.
/// Falls back to Inter if the font isn't recognized.
TextStyle? googleFontStyle(String fontFamily) {
  switch (fontFamily) {
    case 'Playfair Display':
      return GoogleFonts.playfairDisplay();
    case 'Merriweather':
      return GoogleFonts.merriweather();
    case 'Source Serif Pro':
      return GoogleFonts.sourceSerif4();
    case 'Space Grotesk':
      return GoogleFonts.spaceGrotesk();
    case 'JetBrains Mono':
      return GoogleFonts.jetBrainsMono();
    case 'DM Sans':
      return GoogleFonts.dmSans();
    case 'Inter':
      return null; // Bundled locally, no need for GoogleFonts
    default:
      return null;
  }
}
