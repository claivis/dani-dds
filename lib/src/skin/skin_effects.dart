import 'package:flutter/material.dart';

/// Visual effects configuration for a skin.
///
/// Controls glassmorphism, shadows, glow, and animation parameters.
/// A "Paper" skin disables glass and glow entirely; a "Neon" skin adds
/// multi-color glow with high blur.
class SkinEffects {
  const SkinEffects({
    // Glass
    required this.glassFillOpacityDark,
    required this.glassFillOpacityLight,
    required this.glassBorderOpacityDark,
    required this.glassBorderOpacityLight,
    required this.glassBorderWidth,
    required this.glassBlurSigma,
    required this.glassDialogFillOpacityDark,
    required this.glassDialogFillOpacityLight,
    required this.glassDialogBorderOpacityDark,
    required this.glassDialogBorderOpacityLight,
    // Shadows (light)
    required this.shadowSm,
    required this.shadowMd,
    required this.shadowLg,
    // Shadows (dark)
    required this.shadowSmDark,
    required this.shadowMdDark,
    required this.shadowLgDark,
    // Glow
    this.glowPrimary,
    this.glowSecondary,
    // Animation
    this.durationFast = const Duration(milliseconds: 150),
    this.durationNormal = const Duration(milliseconds: 300),
    this.durationSlow = const Duration(milliseconds: 500),
    this.curveDefault = Curves.easeInOut,
    this.curveSpring = Curves.elasticOut,
    this.curveSmooth = Curves.fastOutSlowIn,
    this.pageTransitionDuration = const Duration(milliseconds: 300),
    this.pageTransitionCurve = Curves.easeInOut,
    this.hoverScaleFactor = 1.02,
    this.pressScaleFactor = 0.98,
    this.hoverElevationBoost = 4.0,
    // Shimmer / Loading
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    // Ripple
    this.rippleColor,
    this.rippleOpacity = 0.12,
    // Overlay
    this.overlayColor,
    this.overlayOpacity = 0.5,
    this.scrimBlurSigma = 0.0,
    // Focus ring
    this.focusRingColor,
    this.focusRingWidth = 2.0,
    this.focusRingOffset = 2.0,
    // Feature flags
    this.enableGlass = true,
    this.enableGlow = true,
    this.enableShadows = true,
    this.enableAnimations = true,
    this.enableBlur = true,
  });

  // ── Glass morphism ──

  final double glassFillOpacityDark;
  final double glassFillOpacityLight;
  final double glassBorderOpacityDark;
  final double glassBorderOpacityLight;
  final double glassBorderWidth;
  final double glassBlurSigma;
  final double glassDialogFillOpacityDark;
  final double glassDialogFillOpacityLight;
  final double glassDialogBorderOpacityDark;
  final double glassDialogBorderOpacityLight;

  /// Glass fill color for inline elements.
  Color glassFill(bool isDark) => isDark
      ? Colors.white.withOpacity(glassFillOpacityDark)
      : Colors.white.withOpacity(glassFillOpacityLight);

  /// Glass border color for inline elements.
  Color glassBorder(bool isDark) => isDark
      ? Colors.white.withOpacity(glassBorderOpacityDark)
      : Colors.white.withOpacity(glassBorderOpacityLight);

  /// Glass fill color for dialogs (more opaque for readability).
  Color glassDialogFill(bool isDark) => isDark
      ? Colors.white.withOpacity(glassDialogFillOpacityDark)
      : Colors.white.withOpacity(glassDialogFillOpacityLight);

  /// Glass dialog border color.
  Color glassDialogBorder(bool isDark) => isDark
      ? Colors.white.withOpacity(glassDialogBorderOpacityDark)
      : Colors.white.withOpacity(glassDialogBorderOpacityLight);

  // ── Shadows (light) ──

  final List<BoxShadow> shadowSm;
  final List<BoxShadow> shadowMd;
  final List<BoxShadow> shadowLg;

  // ── Shadows (dark) ──

  final List<BoxShadow> shadowSmDark;
  final List<BoxShadow> shadowMdDark;
  final List<BoxShadow> shadowLgDark;

  /// Convenience: pick shadow set by brightness.
  List<BoxShadow> shadow(bool isDark, {ShadowSize size = ShadowSize.md}) {
    switch (size) {
      case ShadowSize.sm:
        return isDark ? shadowSmDark : shadowSm;
      case ShadowSize.md:
        return isDark ? shadowMdDark : shadowMd;
      case ShadowSize.lg:
        return isDark ? shadowLgDark : shadowLg;
    }
  }

  // ── Glow ──

  /// Primary accent glow (buttons, highlights). Null = no glow effect.
  /// Screen: primary buttons, focused cards, active elements.
  final List<BoxShadow>? glowPrimary;

  /// Secondary glow (used for multi-color glow effects). Null = no secondary glow.
  /// Screen: Neon skin uses this for cyan accent glow alongside pink primary glow.
  final List<BoxShadow>? glowSecondary;

  // ── Animation ──

  /// Fast animation (micro-interactions: button press, toggle).
  final Duration durationFast;

  /// Normal animation (component transitions: dialog open, card expand).
  final Duration durationNormal;

  /// Slow animation (page transitions, hero animations).
  final Duration durationSlow;

  /// Default easing curve.
  final Curve curveDefault;

  /// Spring/bounce curve for playful animations.
  final Curve curveSpring;

  /// Smooth deceleration curve.
  final Curve curveSmooth;

  /// Duration for page/route transitions.
  final Duration pageTransitionDuration;

  /// Curve for page/route transitions.
  final Curve pageTransitionCurve;

  /// Scale factor when hovering over interactive elements (desktop).
  /// 1.0 = no scale, 1.02 = subtle zoom, 1.05 = prominent zoom.
  final double hoverScaleFactor;

  /// Scale factor when pressing interactive elements (feedback).
  /// 1.0 = no scale, 0.98 = subtle shrink, 0.95 = prominent shrink.
  final double pressScaleFactor;

  /// Additional elevation added to cards on hover (desktop).
  final double hoverElevationBoost;

  // ── Shimmer / Loading ──

  /// Base color for shimmer loading skeletons. Null = derive from surface color.
  /// Screen: trip loading, search results loading, any skeleton placeholder.
  final Color? shimmerBaseColor;

  /// Highlight color for shimmer sweep. Null = derive from surfaceElevated.
  final Color? shimmerHighlightColor;

  /// Duration of one shimmer sweep cycle.
  final Duration shimmerDuration;

  // ── Ripple ──

  /// Color of the Material ripple/splash effect. Null = use primary color.
  /// Screen: all tappable elements (buttons, cards, list items).
  final Color? rippleColor;

  /// Opacity of the ripple effect (0.0–1.0).
  final double rippleOpacity;

  // ── Overlay ──

  /// Color for modal overlays/scrims. Null = use Colors.black.
  /// Screen: behind dialogs, bottom sheets, drawers.
  final Color? overlayColor;

  /// Opacity for modal overlays (0.0 = transparent, 1.0 = opaque).
  final double overlayOpacity;

  /// Blur sigma for scrim/overlay (0 = no blur behind overlay).
  /// Screen: behind dialogs. Non-zero creates a frosted glass scrim.
  final double scrimBlurSigma;

  // ── Focus Ring ──

  /// Color of keyboard focus ring. Null = use primary color.
  /// Screen: any focusable element when navigating by keyboard.
  final Color? focusRingColor;

  /// Width of the focus ring border.
  final double focusRingWidth;

  /// Offset/gap between element and focus ring.
  final double focusRingOffset;

  // ── Feature flags ──

  /// Whether glass morphism is enabled. When false, glass panels use opaque backgrounds.
  final bool enableGlass;

  /// Whether glow effects are rendered. When false, [glowPrimary] is ignored.
  final bool enableGlow;

  /// Whether shadows are rendered. When false, all shadows return empty lists.
  final bool enableShadows;

  /// Whether animations are enabled. When false, all durations become zero.
  final bool enableAnimations;

  /// Whether blur effects are enabled (backdrop filter). When false, no blur
  /// is applied even if [enableGlass] is true — useful for performance.
  final bool enableBlur;
}

enum ShadowSize { sm, md, lg }
