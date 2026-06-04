import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom typography system for Dani app following the design specifications
class DaniTypography {
  // Font families
  static const String _headlineFont = 'Poppins';
  static const String _bodyFont = 'Inter';
  static const String _fallbackFont = 'Roboto';

  /// Main App Title - "Feb '25: Parisian & UK Football Frenzy"
  /// Font: Poppins, Weight: Bold (700), Size: 28px - 32px
  static TextStyle get mainAppTitle => GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  /// Section Titles - "Trip Schedule," "Reservation Information," etc.
  /// Font: Poppins, Weight: Semi-Bold (600), Size: 20px
  static TextStyle get sectionTitle => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  /// Itinerary Event Titles - "Flight to London - Depart," etc.
  /// Font: Inter, Weight: Bold (700), Size: 16px - 18px
  static TextStyle get itineraryEventTitle => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        height: 1.4,
      );

  /// Detailed Information - Dates, Times, Prices, etc.
  /// Font: Inter, Weight: Regular (400), Size: 14px
  static TextStyle get detailedInfo => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  /// Buttons & Tabs - "Process Pasted Text," "Upload Files," etc.
  /// Font: Inter, Weight: Semi-Bold (600), Size: 15px - 16px
  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0.01,
      );

  /// City Names - "Liverpool," "London," "Paris"
  /// Font: Poppins, Weight: Bold (700), Size: 16px
  static TextStyle get cityName => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  /// Small text for labels and captions
  /// Font: Inter, Weight: Regular (400), Size: 12px
  static TextStyle get smallText => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
      );

  /// Medium text for secondary information
  /// Font: Inter, Weight: Medium (500), Size: 13px
  static TextStyle get mediumText => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Large text for important secondary information
  /// Font: Inter, Weight: Semi-Bold (600), Size: 15px
  static TextStyle get largeText => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  /// Extra large text for important headings
  /// Font: Poppins, Weight: Bold (700), Size: 18px
  static TextStyle get extraLargeText => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  /// Navigation text for app bars and menus
  /// Font: Inter, Weight: Medium (500), Size: 16px
  static TextStyle get navigationText => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.3,
      );

  /// Card title text
  /// Font: Poppins, Weight: Semi-Bold (600), Size: 16px
  static TextStyle get cardTitle => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  /// Card subtitle text
  /// Font: Inter, Weight: Medium (500), Size: 14px
  static TextStyle get cardSubtitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Error text styling
  /// Font: Inter, Weight: Medium (500), Size: 14px
  static TextStyle get errorText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Success text styling
  /// Font: Inter, Weight: Medium (500), Size: 14px
  static TextStyle get successText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Warning text styling
  /// Font: Inter, Weight: Medium (500), Size: 14px
  static TextStyle get warningText => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  /// Helper method to get font family name for debugging
  static String getFontFamily(TextStyle style) {
    if (style.fontFamily?.contains('Poppins') == true) return 'Poppins';
    if (style.fontFamily?.contains('Inter') == true) return 'Inter';
    return 'Roboto';
  }

  /// Helper method to create custom text style with specific font family
  static TextStyle custom({
    required String fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    Color? color,
    TextDecoration? decoration,
  }) {
    switch (fontFamily.toLowerCase()) {
      case 'poppins':
        return GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          color: color,
          decoration: decoration,
        );
      case 'inter':
        return GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          color: color,
          decoration: decoration,
        );
      default:
        return GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          color: color,
          decoration: decoration,
        );
    }
  }
}
