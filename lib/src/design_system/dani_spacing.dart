import 'dani_form_factor.dart';

/// Unified spacing scale — 8dp base grid.
///
/// Replaces `AppSpacing`, `DesignTokens.spacing*`, `DaniDesignTokens.space*`,
/// and all inline hardcoded spacing values.
abstract class DaniSpacing {
  DaniSpacing._();

  // ── Core scale (8dp grid, with 4dp for tight inline) ──

  /// 4dp — Tight inline spacing (icon-to-text, badge padding)
  static const double xs = 4;

  /// 8dp — Default inline, minimum between touch targets
  static const double sm = 8;

  /// 12dp — Card internal padding (mobile), section sub-spacing
  static const double md = 12;

  /// 16dp — Standard padding, card internal (desktop)
  static const double lg = 16;

  /// 24dp — Section spacing
  static const double xl = 24;

  /// 32dp — Major section breaks
  static const double xxl = 32;

  /// 48dp — Page-level spacing
  static const double xxxl = 48;

  // ── Responsive helpers ──

  /// Horizontal screen-edge padding.
  static double screenPadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 8,
        DaniFormFactor.phone => 12,
        DaniFormFactor.tabletPortrait => 16,
        DaniFormFactor.tabletLandscape => 20,
        _ => 24,
      };

  /// Internal padding inside event cards.
  static double cardPadding(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 10,
        DaniFormFactor.tabletPortrait => 12,
        _ => 14,
      };

  /// Vertical gap between event cards.
  static double cardGap(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 8,
        _ => 12,
      };

  /// Section spacing (e.g., between date groups).
  static double sectionSpacing(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 16,
        _ => 20,
      };

  /// Horizontal card margin (left/right of event cards).
  static double cardMarginHorizontal(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact => 8,
        DaniFormFactor.phone => 12,
        DaniFormFactor.tabletPortrait => 12,
        _ => 0, // Desktop cards don't need horizontal margin (contained in panel)
      };

  /// Bottom margin for cards.
  static double cardMarginBottom(DaniFormFactor ff) => switch (ff) {
        DaniFormFactor.phoneCompact || DaniFormFactor.phone => 8,
        _ => 12,
      };
}
