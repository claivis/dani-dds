import 'package:flutter/widgets.dart';

import 'dani_form_factor.dart';

/// Flexible panel sizing — replaces hardcoded sidebar and right panel widths.
///
/// All panels use min/max constraints with [Flexible], never fixed widths.
abstract class DaniPanelConstraints {
  DaniPanelConstraints._();

  // ── Left Sidebar ──

  /// Collapsed icon-bar width (default state on desktop).
  static const double sidebarCollapsedWidth = 48;

  /// Minimum width when sidebar is expanded.
  static double sidebarExpandedMin(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.desktop => 180,
        DaniFormFactor.desktopLarge => 200,
        DaniFormFactor.desktopUltra => 220,
        _ => 200,
      };

  /// Maximum width when sidebar is expanded.
  static double sidebarExpandedMax(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.desktop => 240,
        DaniFormFactor.desktopLarge => 260,
        DaniFormFactor.desktopUltra => 280,
        _ => 240,
      };

  /// Mobile overlay sidebar width (percentage of screen, capped).
  static const double mobileSidebarWidthFraction = 0.80;
  static const double mobileSidebarMaxWidth = 320;

  // ── Right Panel (Chat + Map) ──

  /// Minimum width for the right (chat/map) panel.
  static double rightPanelMin(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.tabletLandscape => 280,
        DaniFormFactor.desktop => 300,
        _ => 340,
      };

  /// Maximum width for the right (chat/map) panel.
  static double rightPanelMax(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.tabletLandscape => 380,
        DaniFormFactor.desktop => 400,
        _ => 440,
      };

  // ── Timeline Content ──

  /// Minimum width for the two-column timeline (spine + cards on both sides).
  /// Ensures cards are never clipped. Phones use single-column so no minimum.
  /// Calculated from: 2 × card min (200) + center section (62) + outer padding (24) = 486 → rounded to 500.
  static double timelineContentMin(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 0,
        _ => 500,
      };

  /// Maximum width for timeline content area (cards + time column).
  /// On phones the timeline is full-width (infinity).
  static double timelineContentMax(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => double.infinity,
        DaniFormFactor.tabletPortrait => 600,
        DaniFormFactor.tabletLandscape => 680,
        DaniFormFactor.desktop => 760,
        _ => 900, // desktopLarge, desktopUltra
      };

  // ── Time Column ──

  /// Width of the time column to the left of event cards.
  /// Removed on phones (time moves into card body).
  static double timeColumnWidth(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 0,
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape => 48,
        _ => 56,
      };

  /// Gap between time column and event card.
  static double timeCardGap(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 0,
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape => 8,
        _ => 16,
      };

  // ── Banner ──

  /// Expanded banner height.
  static double bannerExpandedHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 100,
        DaniFormFactor.phone => 120,
        DaniFormFactor.tabletPortrait => 200,
        DaniFormFactor.tabletLandscape => 120,
        DaniFormFactor.desktop => 200,
        DaniFormFactor.desktopLarge => 220,
        DaniFormFactor.desktopUltra => 240,
      };

  /// Collapsed banner height (after scrolling).
  static const double bannerCollapsedHeight = 48;

  // ── Date Header ──

  /// Sticky date header height.
  static double dateHeaderHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 40,
        _ => 48,
      };

  // ── View Toggle Bar ──

  /// Height of the view toggle bar (Timeline/Journal/Map tabs).
  static double viewToggleHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 36,
        _ => 40,
      };

  /// View toggle bar padding per form factor.
  static EdgeInsets viewTogglePadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone =>
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape =>
          const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        _ => const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      };

  // ── Chat Panel ──

  /// Chat toolbar height (the "Ask Dani" header).
  static const double chatToolbarHeight = 32;

  /// Default chat input height.
  static const double chatInputDefaultHeight = 44;

  /// Maximum height the chat input can grow to as user types.
  static const double chatInputMaxHeight = 120;

  // ── Dialog Constraints ──

  /// Edit event dialog sizing per form factor.
  static BoxConstraints editDialogConstraints(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone =>
          const BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape =>
          const BoxConstraints(maxWidth: 600, maxHeight: double.infinity),
        DaniFormFactor.desktop =>
          const BoxConstraints(maxWidth: 720, maxHeight: double.infinity),
        _ => const BoxConstraints(maxWidth: 720, maxHeight: double.infinity),
      };

  /// Place search dialog sizing per form factor.
  static BoxConstraints placeSearchDialogConstraints(DaniFormFactor ff) =>
      switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone =>
          const BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape =>
          const BoxConstraints(maxWidth: 550, maxHeight: double.infinity),
        _ => const BoxConstraints(maxWidth: 650, maxHeight: double.infinity),
      };
}
