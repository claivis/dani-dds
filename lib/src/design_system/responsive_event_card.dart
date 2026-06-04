import 'package:flutter/material.dart';

import 'dani_form_factor.dart';

/// Card-specific responsive sizing — photo, padding, border radius.
///
/// Centralises all per-form-factor decisions for [GeminiTimelineCard]
/// so the card code can simply call `ResponsiveEventCard.photoSize(ff)`
/// instead of maintaining 8+ local constants.
abstract class ResponsiveEventCard {
  ResponsiveEventCard._();

  // ── Photo ──

  /// Square photo thumbnail size inside event cards.
  static double photoSize(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 48,
        DaniFormFactor.phone => 56,
        DaniFormFactor.tabletPortrait => 64,
        DaniFormFactor.tabletLandscape => 72,
        _ => 80,
      };

  /// Border radius for the photo thumbnail.
  static double photoBorderRadius(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 8,
        _ => 10,
      };

  // ── Card Chrome ──

  /// Outer border radius of the event card container.
  static double cardBorderRadius(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 10,
        _ => 12,
      };

  /// Internal content padding (inside the card, around text + photo).
  static EdgeInsets contentPadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone =>
          const EdgeInsets.all(8),
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape =>
          const EdgeInsets.all(10),
        _ => const EdgeInsets.all(12),
      };

  /// Right padding reserved for the expand/chevron button.
  /// Only applied when the card has expandable optional fields.
  static double expandButtonPadding(DaniFormFactor ff) => 24;

  // ── Rating Pill ──

  /// Fixed height for rating/price pills.
  static double ratingPillHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 20,
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape => 22,
        _ => 24,
      };

  // ── +1 Day Badge ──

  /// Font size for the "+1 Day" next-day arrival badge on transportation cards.
  /// Minimum 10px for accessibility (was 9px before).
  static double dayBadgeFontSize(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 10,
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape => 10,
        _ => 11,
      };

  // ── Stash Carousel ──

  /// Stash card size inside the saved-places carousel (PlaceSearchDialog).
  static double stashCarouselCardSize(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 64,
        DaniFormFactor.tabletPortrait || DaniFormFactor.tabletLandscape => 72,
        _ => 80,
      };

  // ── Search Result Row ──

  /// Height of a single search result list item.
  static double searchResultHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 56,
        _ => 64,
      };

  // ── Grid Timeline ──

  /// Width of a single event card in the grid timeline [Wrap].
  /// Tuned so 3 cards fit per row on phones (with 12 px wrap spacing) and
  /// 3+ on tablets without any horizontal overflow. Fonts are unchanged —
  /// content just reflows within a tighter card.
  static double gridCardWidth(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 95,
        DaniFormFactor.phone => 112,
        DaniFormFactor.tabletPortrait => 160,
        DaniFormFactor.tabletLandscape => 168,
        _ => 170,
      };

  /// Photo area height inside a grid timeline card (4:3 aspect on photo).
  static double gridCardPhotoHeight(DaniFormFactor ff) =>
      gridCardWidth(ff) / (4 / 3);

  /// Internal padding of the card body (time / title / subtitle area).
  static EdgeInsets gridCardContentPadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact =>
          const EdgeInsets.fromLTRB(6, 4, 6, 5),
        DaniFormFactor.phone => const EdgeInsets.fromLTRB(8, 4, 8, 5),
        _ => const EdgeInsets.fromLTRB(10, 6, 10, 6),
      };

  /// Outer padding around the day-scoped [Wrap] of cards. Narrower on
  /// compact phones so 2 cards still fit side-by-side at 320 px.
  static EdgeInsets gridOuterPadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact =>
          const EdgeInsets.fromLTRB(8, 0, 8, 8),
        DaniFormFactor.phone => const EdgeInsets.fromLTRB(12, 0, 12, 8),
        _ => const EdgeInsets.fromLTRB(16, 0, 16, 8),
      };

  /// Height reserved for the grid card's 2-line title SizedBox, respecting
  /// the ambient text scaler so accessibility scaling doesn't clip
  /// descenders. Clamped so comically large scalers can't blow the layout.
  static double gridCardTitleBlockHeight(
    DaniFormFactor ff,
    TextScaler scaler,
  ) {
    const base = 34.0;
    final scaled = scaler.scale(base);
    return scaled.clamp(base, base * 1.8);
  }

  // ── Explore ──

  /// Width of a single explore template card inside the main explore grid.
  /// On phones the card fills the viewport; on tablets/desktop it returns a
  /// fixed width so multiple cards flow into a [Wrap].
  static double exploreCardWidth(
    DaniFormFactor ff,
    double viewportWidth,
  ) {
    if (ff.isPhone) {
      final max = viewportWidth - 32;
      return max.clamp(260.0, 420.0);
    }
    if (ff == DaniFormFactor.tabletPortrait) return 340;
    if (ff == DaniFormFactor.tabletLandscape) return 360;
    return 380;
  }

  /// Height of a single explore template card. Sized to fit the card's
  /// intrinsic content (hero + optional mosaic + title/meta/tags) without
  /// leaving dead vertical space below the tags. Phone cards are shorter
  /// because the mosaic row is hidden (see `exploreTemplateMosaicRowHeight`).
  static double exploreCardHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 320,
        DaniFormFactor.tabletPortrait => 380,
        DaniFormFactor.tabletLandscape => 385,
        _ => 380,
      };

  /// Height of the explore hero carousel (`ExploreHeroCarousel`).
  static double exploreHeroCarouselHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 140,
        DaniFormFactor.phone => 180,
        DaniFormFactor.tabletPortrait => 240,
        DaniFormFactor.tabletLandscape => 260,
        _ => 280,
      };

  /// Width of the mosaic hero photo block on the explore detail screen.
  /// Phones use the viewport (minus padding); tablets + desktop use fixed
  /// widths tuned to the stacked layout.
  static double exploreMosaicWidth(
    DaniFormFactor ff,
    double viewportWidth,
  ) {
    if (ff.isPhone) return (viewportWidth - 32).clamp(260.0, 520.0);
    if (ff == DaniFormFactor.tabletPortrait) {
      return ((viewportWidth - 48) * 0.55).clamp(420.0, 560.0);
    }
    if (ff == DaniFormFactor.tabletLandscape) return 560;
    return 480;
  }

  /// Top row (hero + stacked-right) height inside the explore mosaic.
  static double exploreMosaicTopHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 180,
        DaniFormFactor.phone => 220,
        DaniFormFactor.tabletPortrait => 380,
        DaniFormFactor.tabletLandscape => 440,
        _ => 480,
      };

  /// Bottom row (two-photo strip) height inside the explore mosaic.
  static double exploreMosaicBottomHeight(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 70,
        DaniFormFactor.phone => 80,
        DaniFormFactor.tabletPortrait => 130,
        DaniFormFactor.tabletLandscape => 150,
        _ => 160,
      };

  /// Title font size in the explore detail hero header.
  static double exploreHeroTitleSize(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 22,
        DaniFormFactor.phone => 24,
        DaniFormFactor.tabletPortrait => 26,
        DaniFormFactor.tabletLandscape => 28,
        _ => 30,
      };

  /// Height of the mosaic-row of small photos below the hero on an
  /// explore template card. Returns zero to signal "hide entirely" on
  /// small phones where the row would be too cramped to read.
  static double exploreTemplateMosaicRowHeight(DaniFormFactor ff) =>
      switch (ff) {
        DaniFormFactor.phoneCompact => 0,
        DaniFormFactor.phone => 0,
        DaniFormFactor.tabletPortrait => 52,
        DaniFormFactor.tabletLandscape => 56,
        _ => 48,
      };
}
