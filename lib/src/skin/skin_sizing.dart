/// Element sizing configuration for a skin.
///
/// Controls the dimensions of UI elements — heights, widths, icon sizes,
/// border thicknesses. A "dense" skin uses smaller elements; a "touch-friendly"
/// skin uses larger tap targets. These are visual proportions, not layout
/// structure.
class SkinSizing {
  const SkinSizing({
    // App bar
    this.appBarHeight = 56.0,
    this.appBarElevation = 0.0,
    this.appBarCenterTitle = false,
    // Navigation
    this.bottomNavHeight = 64.0,
    this.tabBarHeight = 48.0,
    // Button
    this.buttonHeight = 48.0,
    this.buttonHeightSm = 36.0,
    this.buttonHeightLg = 56.0,
    this.buttonMinWidth = 64.0,
    this.buttonIconSize = 20.0,
    // Input
    this.inputHeight = 48.0,
    this.inputHeightSm = 36.0,
    // Icon
    this.iconSize = 24.0,
    this.iconSizeSm = 18.0,
    this.iconSizeLg = 32.0,
    this.iconSizeXl = 48.0,
    // Avatar
    this.avatarSize = 40.0,
    this.avatarSizeSm = 28.0,
    this.avatarSizeLg = 56.0,
    // Badge / Chip
    this.badgeHeight = 20.0,
    this.badgeDotSize = 8.0,
    this.chipHeight = 32.0,
    // FAB
    this.fabSize = 56.0,
    this.fabSizeSm = 40.0,
    // Divider
    this.dividerThickness = 1.0,
    // Border
    this.borderWidth = 1.0,
    this.borderWidthThick = 2.0,
    this.borderWidthFocus = 2.0,
    // Photo
    this.photoAspectRatio = 1.78, // 16:9
    this.photoThumbnailSize = 48.0,
    this.photoCarouselHeight = 200.0,
    // Card
    this.cardMinHeight = 0.0,
    this.cardMaxWidth = double.infinity,
    this.cardElevation = 0.0,
    this.cardBorderWidth = 1.0,
    // Dialog
    this.dialogMaxWidth = 560.0,
    this.dialogMinWidth = 280.0,
    this.dialogElevation = 8.0,
    // Tooltip
    this.tooltipMaxWidth = 200.0,
    // Snackbar
    this.snackbarMaxWidth = 560.0,
    // Progress / Loading
    this.progressIndicatorSize = 24.0,
    this.progressIndicatorStrokeWidth = 3.0,
    // Switch / Checkbox
    this.switchWidth = 52.0,
    this.switchHeight = 32.0,
    this.checkboxSize = 20.0,
    this.radioSize = 20.0,
    // Scroll
    this.scrollbarThickness = 6.0,
    this.scrollbarRadius = 3.0,
    // Star rating
    this.starSize = 16.0,
    this.starSpacing = 2.0,
  });

  // ── App Bar ──

  /// Height of the main app bar. Screens: all screens with app bars.
  final double appBarHeight;

  /// Elevation/shadow depth of the app bar.
  final double appBarElevation;

  /// Whether to center the app bar title. false = start-aligned (Material),
  /// true = centered (iOS style).
  final bool appBarCenterTitle;

  // ── Navigation ──

  /// Height of the bottom navigation bar. Screen: home (bottom tabs).
  final double bottomNavHeight;

  /// Height of tab bars. Screen: trip management dialog (5-tab sharing).
  final double tabBarHeight;

  // ── Button ──

  /// Default button height. Used by: ShadcnButton default variant.
  final double buttonHeight;

  /// Small button height. Used by: ShadcnButton sm variant.
  final double buttonHeightSm;

  /// Large button height. Used by: ShadcnButton lg variant.
  final double buttonHeightLg;

  /// Minimum button width (prevents tiny buttons).
  final double buttonMinWidth;

  /// Icon size inside buttons.
  final double buttonIconSize;

  // ── Input ──

  /// Default text input height. Used by: all form inputs, search bars.
  final double inputHeight;

  /// Small input height (compact forms).
  final double inputHeightSm;

  // ── Icon ──

  /// Default icon size. Used by: event card icons, action icons.
  final double iconSize;

  /// Small icon size. Used by: inline indicators, status dots.
  final double iconSizeSm;

  /// Large icon size. Used by: empty state illustrations, feature icons.
  final double iconSizeLg;

  /// Extra-large icon size. Used by: hero illustrations, onboarding.
  final double iconSizeXl;

  // ── Avatar ──

  /// Default avatar size. Used by: user avatars in sharing, comments.
  final double avatarSize;

  /// Small avatar size. Used by: inline mentions, compact lists.
  final double avatarSizeSm;

  /// Large avatar size. Used by: profile screen, user settings.
  final double avatarSizeLg;

  // ── Badge / Chip ──

  /// Badge pill height. Used by: shared trip badge, notification count.
  final double badgeHeight;

  /// Badge dot indicator size (unread dot).
  final double badgeDotSize;

  /// Chip/tag height. Used by: filter chips, category tags.
  final double chipHeight;

  // ── FAB ──

  /// Floating action button size. Used by: home screen add trip FAB.
  final double fabSize;

  /// Small FAB size.
  final double fabSizeSm;

  // ── Divider ──

  /// Divider line thickness. Used by: list dividers, section separators.
  final double dividerThickness;

  // ── Border ──

  /// Default border width for cards, inputs, containers.
  final double borderWidth;

  /// Thick border width (emphasized elements, selected states).
  final double borderWidthThick;

  /// Focus ring border width (focused inputs, selected cards).
  final double borderWidthFocus;

  // ── Photo ──

  /// Default aspect ratio for photo containers (16:9 = 1.78).
  final double photoAspectRatio;

  /// Size of photo thumbnails in lists and compact views.
  final double photoThumbnailSize;

  /// Height of photo carousels. Used by: event card expanded photo view.
  final double photoCarouselHeight;

  // ── Card ──

  /// Minimum card height (0 = auto-size to content).
  final double cardMinHeight;

  /// Maximum card width (double.infinity = no limit).
  final double cardMaxWidth;

  /// Card elevation/shadow depth (0 = flat).
  final double cardElevation;

  /// Card border width. Used by: event cards, trip cards.
  final double cardBorderWidth;

  // ── Dialog ──

  /// Maximum dialog width. Used by: all modal dialogs.
  final double dialogMaxWidth;

  /// Minimum dialog width.
  final double dialogMinWidth;

  /// Dialog elevation/shadow depth.
  final double dialogElevation;

  // ── Tooltip ──

  /// Maximum tooltip width before wrapping.
  final double tooltipMaxWidth;

  // ── Snackbar ──

  /// Maximum snackbar width.
  final double snackbarMaxWidth;

  // ── Progress / Loading ──

  /// Circular progress indicator diameter.
  final double progressIndicatorSize;

  /// Progress indicator stroke width.
  final double progressIndicatorStrokeWidth;

  // ── Switch / Checkbox / Radio ──

  /// Switch track width.
  final double switchWidth;

  /// Switch track height.
  final double switchHeight;

  /// Checkbox size.
  final double checkboxSize;

  /// Radio button size.
  final double radioSize;

  // ── Scroll ──

  /// Scrollbar track thickness.
  final double scrollbarThickness;

  /// Scrollbar thumb corner radius.
  final double scrollbarRadius;

  // ── Star Rating ──

  /// Size of individual stars in rating widgets. Used by: place cards.
  final double starSize;

  /// Spacing between stars.
  final double starSpacing;
}
