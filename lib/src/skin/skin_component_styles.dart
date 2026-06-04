import 'package:flutter/material.dart';

/// High-level style variants for UI components.
///
/// Instead of tweaking individual properties, skins can switch entire
/// component rendering strategies. For example, setting [cardStyle] to
/// [CardStyle.glass] makes all cards use glassmorphism, while
/// [CardStyle.bordered] uses flat cards with visible borders.
///
/// These enums are consumed by the design system components (ShadcnButton,
/// ShadcnCard, LiquidGlassContainer, etc.) to select their rendering path.
class SkinComponentStyles {
  const SkinComponentStyles({
    this.appBarStyle = AppBarVariant.solid,
    this.cardStyle = CardVariant.bordered,
    this.buttonVariant = ButtonVariant.filled,
    this.buttonTextTransform = TextTransform.none,
    this.inputVariant = InputVariant.outlined,
    this.dialogVariant = DialogVariant.standard,
    this.chipVariant = ChipVariant.filled,
    this.badgeVariant = BadgeVariant.filled,
    this.dividerVariant = DividerVariant.solid,
    this.photoShape = PhotoShape.rounded,
    this.iconVariant = IconVariant.outlined,
    this.loadingVariant = LoadingVariant.shimmer,
    this.scrollPhysicsVariant = ScrollPhysicsVariant.platform,
    this.snackbarPosition = SnackbarPosition.bottom,
    this.tooltipVariant = TooltipVariant.standard,
    this.listSeparator = ListSeparatorVariant.divider,
    this.tabIndicatorVariant = TabIndicatorVariant.underline,
    this.switchVariant = SwitchVariant.material,
    this.navRailVariant = NavRailVariant.standard,
    this.cursorVariant = CursorVariant.bar,
    // Component-level feature flags
    this.showCardBorder = true,
    this.showCardShadow = true,
    this.showInputBorder = true,
    this.showInputFill = true,
    this.showButtonShadow = false,
    this.showPhotoOverlayGradient = true,
    this.useRippleEffect = true,
    this.showScrollbar = true,
    this.showDividers = true,
    this.showTimelineConnectors = true,
    this.animatePageTransitions = true,
    this.animateCardHover = true,
    // Text decoration
    this.headingTextDecoration = TextDecoration.none,
    this.linkTextDecoration = TextDecoration.underline,
    // Overlay
    this.tripCardOverlayOpacity = 0.4,
    this.photoOverlayGradientStops = const [0.0, 0.5, 1.0],
    this.photoOverlayGradientOpacities = const [0.0, 0.1, 0.6],
  });

  // ── Component Variants ──

  /// App bar rendering style. Screens: all screens with app bars.
  /// - solid: opaque background with skin background color
  /// - transparent: no background, content shows through
  /// - glass: glassmorphism effect (blur + transparency)
  /// - gradient: gradient from primary to primaryDark
  final AppBarVariant appBarStyle;

  /// Card rendering style. Used by: event cards, trip cards, settings cards.
  /// - flat: no elevation, no border, just background color
  /// - elevated: Material elevation with shadow
  /// - bordered: flat with visible border (default)
  /// - glass: glassmorphism with blur and transparency
  /// - outlined: transparent background with prominent border
  final CardVariant cardStyle;

  /// Primary button rendering variant. Used by: ShadcnButton.
  /// - filled: solid background color (default)
  /// - outlined: transparent with border
  /// - tonal: tinted background (primary at low opacity)
  /// - glass: glassmorphism button
  final ButtonVariant buttonVariant;

  /// Text transform for button labels.
  /// - none: as-is
  /// - uppercase: ALL CAPS
  /// - capitalize: Title Case
  final TextTransform buttonTextTransform;

  /// Input field rendering variant. Used by: all form inputs.
  /// - outlined: border around the field (default)
  /// - filled: solid background fill, no border
  /// - underline: only bottom border (Material classic)
  final InputVariant inputVariant;

  /// Dialog rendering style. Used by: all modal dialogs.
  /// - standard: opaque with elevation (default)
  /// - glass: glassmorphism dialog
  /// - bottomSheet: always present as bottom sheet
  final DialogVariant dialogVariant;

  /// Chip rendering variant. Used by: filter chips, category tags.
  /// - filled: solid background
  /// - outlined: transparent with border
  final ChipVariant chipVariant;

  /// Badge rendering variant. Used by: notification badges, status indicators.
  /// - filled: solid background
  /// - outlined: border only
  /// - dot: small colored dot (no text)
  final BadgeVariant badgeVariant;

  /// Divider rendering variant. Used by: list dividers, section separators.
  /// - solid: continuous line
  /// - dashed: dashed line
  /// - dotted: dotted line
  /// - none: invisible (spacing only)
  final DividerVariant dividerVariant;

  /// Photo container shape. Used by: place photos, user avatars.
  /// - rounded: rounded rectangle (uses skin's photoRadius)
  /// - circle: circular crop
  /// - square: sharp rectangle (radius = 0)
  final PhotoShape photoShape;

  /// Icon style variant. Used by: all icons throughout the app.
  /// - outlined: line-weight icons (default Material)
  /// - filled: solid/filled icons
  /// - rounded: rounded line-weight icons
  /// - sharp: sharp-cornered icons
  final IconVariant iconVariant;

  /// Loading indicator style. Used by: trip loading, data fetching.
  /// - shimmer: skeleton shimmer effect (default)
  /// - circular: circular progress indicator
  /// - linear: linear progress bar
  /// - dots: animated dots
  final LoadingVariant loadingVariant;

  /// Scroll physics variant. Used by: all scrollable views.
  /// - platform: follow platform default (iOS = bouncing, Android = glow)
  /// - bouncing: always use iOS-style bouncing
  /// - clamping: always use Android-style clamping
  final ScrollPhysicsVariant scrollPhysicsVariant;

  /// Snackbar/toast position. Used by: confirmation messages, errors.
  /// - top: appear from top
  /// - bottom: appear from bottom (default)
  final SnackbarPosition snackbarPosition;

  /// Tooltip rendering variant.
  /// - standard: opaque Material tooltip
  /// - glass: glassmorphism tooltip
  final TooltipVariant tooltipVariant;

  /// How list items are separated. Used by: settings lists, search results.
  /// - divider: thin line between items
  /// - spacing: gap between items (no line)
  /// - none: items are flush against each other
  final ListSeparatorVariant listSeparator;

  /// Tab bar active indicator style.
  /// - underline: line under active tab (default)
  /// - pill: rounded pill behind active tab
  /// - dot: small dot under active tab
  /// - filled: fully filled/highlighted background
  final TabIndicatorVariant tabIndicatorVariant;

  /// Toggle switch rendering variant.
  /// - material: Material Design switch
  /// - cupertino: iOS-style switch
  /// - minimal: small custom toggle
  final SwitchVariant switchVariant;

  /// Navigation rail variant (desktop side nav).
  /// - standard: icons + optional labels
  /// - compact: icons only
  /// - extended: icons + always-visible labels
  final NavRailVariant navRailVariant;

  /// Text cursor variant for input fields.
  /// - bar: thin vertical line (default)
  /// - block: full character block
  /// - underline: underline below next character position
  final CursorVariant cursorVariant;

  // ── Component-level feature flags ──

  /// Whether cards show a border. Used by: event cards, trip cards.
  final bool showCardBorder;

  /// Whether cards show a shadow. Used by: event cards, trip cards.
  final bool showCardShadow;

  /// Whether input fields show a border. Used by: form inputs.
  final bool showInputBorder;

  /// Whether input fields have a background fill. Used by: form inputs.
  final bool showInputFill;

  /// Whether buttons have a shadow/elevation. Used by: primary buttons.
  final bool showButtonShadow;

  /// Whether photos show a gradient overlay (for text readability).
  /// Used by: trip cards, place cards with overlaid text.
  final bool showPhotoOverlayGradient;

  /// Whether tap feedback uses Material ripple effect.
  /// false = simple opacity change on tap.
  final bool useRippleEffect;

  /// Whether scrollbars are visible. Used by: all scrollable views.
  final bool showScrollbar;

  /// Whether to show divider lines between list items.
  final bool showDividers;

  /// Whether to show vertical connector lines in the timeline view.
  final bool showTimelineConnectors;

  /// Whether page transitions are animated. false = instant transitions.
  final bool animatePageTransitions;

  /// Whether cards animate on hover (desktop). false = no hover effect.
  final bool animateCardHover;

  // ── Text Decoration ──

  /// Decoration applied to heading text (underline, strikethrough, etc.).
  final TextDecoration headingTextDecoration;

  /// Decoration applied to link/URL text.
  final TextDecoration linkTextDecoration;

  // ── Overlay ──

  /// Opacity of the dark overlay on trip card background images.
  /// 0.0 = fully transparent, 1.0 = fully opaque. Used by: home screen trip cards.
  final double tripCardOverlayOpacity;

  /// Gradient stop positions for photo overlays (bottom-to-top).
  /// Must have same length as [photoOverlayGradientOpacities].
  final List<double> photoOverlayGradientStops;

  /// Opacity values at each gradient stop for photo overlays.
  /// Must have same length as [photoOverlayGradientStops].
  final List<double> photoOverlayGradientOpacities;
}

// ── Enums ──

/// App bar rendering styles.
enum AppBarVariant {
  /// Opaque background with skin background color.
  solid,
  /// No background — content shows through.
  transparent,
  /// Glassmorphism effect (blur + transparency).
  glass,
  /// Gradient from primary to primaryDark.
  gradient,
}

/// Card rendering styles.
enum CardVariant {
  /// No elevation or border, just background color.
  flat,
  /// Material elevation with shadow.
  elevated,
  /// Flat with visible border (default Gemini).
  bordered,
  /// Glassmorphism with blur and transparency.
  glass,
  /// Transparent background with prominent border only.
  outlined,
}

/// Primary button rendering variants.
enum ButtonVariant {
  /// Solid background color (default).
  filled,
  /// Transparent with border.
  outlined,
  /// Tinted background (primary at low opacity).
  tonal,
  /// Glassmorphism button.
  glass,
}

/// Text transform options.
enum TextTransform {
  /// No transformation — text as-is.
  none,
  /// ALL CAPS.
  uppercase,
  /// Title Case (first letter of each word).
  capitalize,
}

/// Input field rendering variants.
enum InputVariant {
  /// Border around the field (default).
  outlined,
  /// Solid background fill, no visible border.
  filled,
  /// Only bottom border (Material classic style).
  underline,
}

/// Dialog rendering styles.
enum DialogVariant {
  /// Opaque with elevation (default).
  standard,
  /// Glassmorphism dialog.
  glass,
  /// Always present as bottom sheet.
  bottomSheet,
}

/// Chip rendering variants.
enum ChipVariant {
  /// Solid background.
  filled,
  /// Transparent with border.
  outlined,
}

/// Badge rendering variants.
enum BadgeVariant {
  /// Solid background.
  filled,
  /// Border only.
  outlined,
  /// Small colored dot (no text).
  dot,
}

/// Divider rendering variants.
enum DividerVariant {
  /// Continuous line.
  solid,
  /// Dashed line segments.
  dashed,
  /// Dotted line.
  dotted,
  /// Invisible — spacing only.
  none,
}

/// Photo container shapes.
enum PhotoShape {
  /// Rounded rectangle (uses skin's photoRadius).
  rounded,
  /// Circular crop.
  circle,
  /// Sharp rectangle (radius = 0).
  square,
}

/// Icon style variants.
enum IconVariant {
  /// Line-weight icons (default Material Outlined).
  outlined,
  /// Solid/filled icons.
  filled,
  /// Rounded line-weight icons.
  rounded,
  /// Sharp-cornered icons.
  sharp,
}

/// Loading indicator styles.
enum LoadingVariant {
  /// Skeleton shimmer effect.
  shimmer,
  /// Circular progress indicator.
  circular,
  /// Linear progress bar.
  linear,
  /// Animated dots.
  dots,
}

/// Scroll physics variants.
enum ScrollPhysicsVariant {
  /// Follow platform default.
  platform,
  /// Always iOS-style bouncing.
  bouncing,
  /// Always Android-style clamping.
  clamping,
}

/// Snackbar/toast position.
enum SnackbarPosition {
  /// Appear from top of screen.
  top,
  /// Appear from bottom of screen.
  bottom,
}

/// Tooltip rendering variants.
enum TooltipVariant {
  /// Opaque Material tooltip.
  standard,
  /// Glassmorphism tooltip.
  glass,
}

/// List item separation styles.
enum ListSeparatorVariant {
  /// Thin line between items.
  divider,
  /// Gap between items (no line).
  spacing,
  /// Items flush against each other.
  none,
}

/// Tab bar indicator styles.
enum TabIndicatorVariant {
  /// Line under active tab.
  underline,
  /// Rounded pill behind active tab.
  pill,
  /// Small dot under active tab.
  dot,
  /// Fully filled/highlighted background.
  filled,
}

/// Toggle switch variants.
enum SwitchVariant {
  /// Material Design switch.
  material,
  /// iOS-style switch.
  cupertino,
  /// Small custom toggle.
  minimal,
}

/// Navigation rail variants (desktop side nav).
enum NavRailVariant {
  /// Icons + optional labels.
  standard,
  /// Icons only.
  compact,
  /// Icons + always-visible labels.
  extended,
}

/// Text cursor variants.
enum CursorVariant {
  /// Thin vertical line.
  bar,
  /// Full character block.
  block,
  /// Underline below next character position.
  underline,
}
