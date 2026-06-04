/// Border radius and shape configuration for a skin.
///
/// Controls the roundness of every UI element category plus additional
/// shape-related properties like border widths and container shapes.
/// A "Brutalist" skin sets everything to 0; a "Bubbly" skin uses 20+.
class SkinShape {
  const SkinShape({
    required this.cardRadius,
    required this.buttonRadius,
    required this.inputRadius,
    required this.dialogRadius,
    required this.glassRadius,
    required this.glassPillRadius,
    required this.badgeRadius,
    required this.photoRadius,
    this.chipRadius = 9999.0,
    this.avatarRadius = 9999.0,
    this.tooltipRadius = 8.0,
    this.snackbarRadius = 8.0,
    this.fabRadius = 16.0,
    this.switchRadius = 9999.0,
    this.checkboxRadius = 4.0,
    this.menuRadius = 12.0,
    this.popupRadius = 12.0,
    this.bannerRadius = 12.0,
    this.searchBarRadius = 9999.0,
    this.tabIndicatorRadius = 2.0,
    this.progressRadius = 9999.0,
    this.shimmerRadius = 8.0,
    this.bottomSheetRadius = 20.0,
    this.navigationBarRadius = 0.0,
    this.cardInnerRadius,
  });

  /// Outer border radius of event cards and generic cards.
  /// Screen: timeline event cards, home screen trip cards, settings cards,
  /// place detail cards, search result cards.
  final double cardRadius;

  /// Button corner radius (default size — sm/lg scale proportionally).
  /// Screen: all buttons — dialog actions, form submissions, FAB, toolbar buttons.
  final double buttonRadius;

  /// Input field corner radius.
  /// Screen: all form inputs — search bars, text fields, dropdowns, date pickers.
  final double inputRadius;

  /// Dialog/bottom-sheet corner radius (top corners only for bottom sheets).
  /// Screen: all modal dialogs — event creation, place search, settings, sharing.
  final double dialogRadius;

  /// Glass panel corner radius (trip details floating panels, overlay panels).
  /// Screen: trip details sidebar, floating controls, glass overlays.
  final double glassRadius;

  /// Glass pill / toolbar corner radius.
  /// Screen: floating toolbar buttons, compact glass elements.
  final double glassPillRadius;

  /// Badge / status pill corner radius (often 9999 = fully round).
  /// Screen: shared trip badge, notification count, status indicators.
  final double badgeRadius;

  /// Photo thumbnail corner radius.
  /// Screen: event card photos, place photos, user-uploaded images.
  final double photoRadius;

  /// Chip / tag corner radius.
  /// Screen: filter chips, category tags, AI suggestion chips.
  final double chipRadius;

  /// Avatar corner radius (9999 = circle).
  /// Screen: user avatars in sharing, profile, comments.
  final double avatarRadius;

  /// Tooltip corner radius.
  /// Screen: hover tooltips, info popups, help text overlays.
  final double tooltipRadius;

  /// Snackbar/toast corner radius.
  /// Screen: confirmation messages, error notifications at bottom/top.
  final double snackbarRadius;

  /// Floating action button corner radius.
  /// Screen: home screen "add trip" FAB, quick-action FABs.
  final double fabRadius;

  /// Switch/toggle track corner radius.
  /// Screen: settings toggles, preference switches.
  final double switchRadius;

  /// Checkbox corner radius.
  /// Screen: checklist items, multi-select options, wish list checkboxes.
  final double checkboxRadius;

  /// Menu/dropdown corner radius.
  /// Screen: context menus, dropdown selectors, popup menus.
  final double menuRadius;

  /// Generic popup corner radius (popover panels, floating menus).
  final double popupRadius;

  /// Banner/hero section corner radius.
  /// Screen: home screen carousel banners, onboarding hero cards.
  final double bannerRadius;

  /// Search bar corner radius (often 9999 = pill-shaped).
  /// Screen: home search bar, place search input, global search.
  final double searchBarRadius;

  /// Tab indicator corner radius (for pill-style indicators).
  /// Screen: trip management tab bar, preferences tab bar.
  final double tabIndicatorRadius;

  /// Progress bar corner radius.
  /// Screen: upload progress, loading bars, step indicators.
  final double progressRadius;

  /// Shimmer/skeleton placeholder corner radius.
  /// Screen: loading states across all screens.
  final double shimmerRadius;

  /// Bottom sheet top corner radius.
  /// Screen: all bottom sheets — event actions, sharing, photo picker.
  final double bottomSheetRadius;

  /// Navigation bar corner radius (0 = square edges).
  /// Screen: bottom navigation bar.
  final double navigationBarRadius;

  /// Inner element radius inside cards (e.g., photo inside a card).
  /// Null = auto-calculate from [cardRadius] minus padding.
  /// Screen: nested elements within cards.
  final double? cardInnerRadius;
}
