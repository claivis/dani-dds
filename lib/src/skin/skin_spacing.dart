/// Spacing and padding configuration for a skin.
///
/// Controls the visual density of the UI — how much breathing room elements
/// have. A "compact" skin tightens everything; a "luxurious" skin adds
/// generous whitespace. Layout structure (which widgets appear where) is
/// NOT controlled here — only the gaps/padding between them.
class SkinSpacing {
  const SkinSpacing({
    // Card
    this.cardContentPadding = 12.0,
    this.cardContentPaddingCompact = 8.0,
    this.cardGap = 8.0,
    this.cardHeaderGap = 6.0,
    this.cardFooterGap = 8.0,
    this.cardPhotoGap = 8.0,
    // Screen
    this.screenPaddingHorizontal = 16.0,
    this.screenPaddingTop = 16.0,
    this.screenPaddingBottom = 16.0,
    // Section
    this.sectionSpacing = 24.0,
    this.sectionHeaderBottomSpacing = 8.0,
    this.sectionDividerSpacing = 16.0,
    // Dialog
    this.dialogContentPadding = 24.0,
    this.dialogTitleBottomSpacing = 16.0,
    this.dialogActionSpacing = 8.0,
    this.dialogActionTopSpacing = 24.0,
    // Button
    this.buttonPaddingHorizontal = 32.0,
    this.buttonPaddingVertical = 16.0,
    this.buttonPaddingHorizontalSm = 16.0,
    this.buttonPaddingVerticalSm = 8.0,
    this.buttonGap = 8.0,
    this.buttonIconGap = 8.0,
    // Input
    this.inputContentPadding = 16.0,
    this.inputLabelSpacing = 6.0,
    this.inputHelperSpacing = 4.0,
    this.inputGroupSpacing = 16.0,
    // List
    this.listItemPaddingVertical = 12.0,
    this.listItemPaddingHorizontal = 16.0,
    this.listDividerIndent = 0.0,
    this.listDividerEndIndent = 0.0,
    // Chip / Badge
    this.chipPaddingHorizontal = 12.0,
    this.chipPaddingVertical = 4.0,
    this.chipSpacing = 6.0,
    this.badgePaddingHorizontal = 8.0,
    this.badgePaddingVertical = 2.0,
    // Icon + text
    this.iconTextGap = 8.0,
    this.iconPadding = 4.0,
    // Timeline
    this.timelineConnectorWidth = 2.0,
    this.timelineDotDiameter = 12.0,
    this.timelineLeftMargin = 40.0,
    this.timelineDateHeaderSpacing = 12.0,
    // Photo
    this.photoCarouselGap = 4.0,
    this.photoGridGap = 4.0,
    // App bar
    this.appBarTitleSpacing = 16.0,
    this.appBarActionSpacing = 4.0,
    // Tab bar
    this.tabBarLabelPadding = 16.0,
    this.tabBarIndicatorWeight = 2.0,
    // FAB
    this.fabMargin = 16.0,
    this.fabExtendedPadding = 20.0,
    // Toast / Snackbar
    this.snackbarMargin = 8.0,
    this.snackbarContentPadding = 16.0,
    // Tooltip
    this.tooltipPadding = 8.0,
    this.tooltipMargin = 8.0,
  });

  // ── Card ──

  /// Internal padding inside event cards and generic cards (phone default).
  final double cardContentPadding;

  /// Internal padding for compact card variants.
  final double cardContentPaddingCompact;

  /// Vertical gap between adjacent event cards in a list.
  final double cardGap;

  /// Gap between card header text and subtext (e.g., title → subtitle).
  final double cardHeaderGap;

  /// Gap between card body and footer actions.
  final double cardFooterGap;

  /// Gap between card photo/icon and card text content.
  final double cardPhotoGap;

  // ── Screen ──

  /// Horizontal padding at screen edges (left/right margins).
  final double screenPaddingHorizontal;

  /// Top padding below app bar or safe area.
  final double screenPaddingTop;

  /// Bottom padding above bottom nav or safe area.
  final double screenPaddingBottom;

  // ── Section ──

  /// Vertical spacing between major sections (date groups, setting groups).
  final double sectionSpacing;

  /// Gap between a section header and its first child.
  final double sectionHeaderBottomSpacing;

  /// Vertical spacing around section dividers.
  final double sectionDividerSpacing;

  // ── Dialog ──

  /// Internal padding inside dialogs.
  final double dialogContentPadding;

  /// Gap between dialog title and body content.
  final double dialogTitleBottomSpacing;

  /// Gap between dialog action buttons (OK, Cancel).
  final double dialogActionSpacing;

  /// Gap between dialog body and action buttons.
  final double dialogActionTopSpacing;

  // ── Button ──

  /// Horizontal padding inside default-sized buttons.
  final double buttonPaddingHorizontal;

  /// Vertical padding inside default-sized buttons.
  final double buttonPaddingVertical;

  /// Horizontal padding inside small buttons.
  final double buttonPaddingHorizontalSm;

  /// Vertical padding inside small buttons.
  final double buttonPaddingVerticalSm;

  /// Gap between adjacent buttons in a button group.
  final double buttonGap;

  /// Gap between a button's icon and its label text.
  final double buttonIconGap;

  // ── Input ──

  /// Content padding inside text input fields.
  final double inputContentPadding;

  /// Gap between input label and the input field.
  final double inputLabelSpacing;

  /// Gap between input field and helper/error text below.
  final double inputHelperSpacing;

  /// Vertical gap between consecutive form input groups.
  final double inputGroupSpacing;

  // ── List ──

  /// Vertical padding inside list items (top + bottom).
  final double listItemPaddingVertical;

  /// Horizontal padding inside list items (left + right).
  final double listItemPaddingHorizontal;

  /// Start indent for list dividers (0 = full-bleed).
  final double listDividerIndent;

  /// End indent for list dividers.
  final double listDividerEndIndent;

  // ── Chip / Badge ──

  /// Horizontal padding inside chips/tags.
  final double chipPaddingHorizontal;

  /// Vertical padding inside chips/tags.
  final double chipPaddingVertical;

  /// Gap between adjacent chips in a wrap.
  final double chipSpacing;

  /// Horizontal padding inside badges/status pills.
  final double badgePaddingHorizontal;

  /// Vertical padding inside badges/status pills.
  final double badgePaddingVertical;

  // ── Icon + Text ──

  /// Gap between an icon and adjacent text (e.g., leading icon → label).
  final double iconTextGap;

  /// Padding around standalone icons.
  final double iconPadding;

  // ── Timeline ──

  /// Width of the vertical connector line between timeline events.
  final double timelineConnectorWidth;

  /// Diameter of the timeline dot/circle beside each event.
  final double timelineDotDiameter;

  /// Left margin for the timeline content area (space for time column).
  final double timelineLeftMargin;

  /// Spacing around date header dividers in the timeline.
  final double timelineDateHeaderSpacing;

  // ── Photo ──

  /// Gap between photos in a horizontal carousel.
  final double photoCarouselGap;

  /// Gap between photos in a grid layout.
  final double photoGridGap;

  // ── App Bar ──

  /// Spacing between app bar title and other elements.
  final double appBarTitleSpacing;

  /// Spacing between action icons in the app bar.
  final double appBarActionSpacing;

  // ── Tab Bar ──

  /// Horizontal padding around each tab label.
  final double tabBarLabelPadding;

  /// Thickness of the active tab indicator.
  final double tabBarIndicatorWeight;

  // ── FAB ──

  /// Margin around the floating action button from screen edges.
  final double fabMargin;

  /// Extra horizontal padding inside an extended (text) FAB.
  final double fabExtendedPadding;

  // ── Toast / Snackbar ──

  /// Margin around snackbar/toast from screen edges.
  final double snackbarMargin;

  /// Content padding inside snackbar/toast.
  final double snackbarContentPadding;

  // ── Tooltip ──

  /// Padding inside tooltips.
  final double tooltipPadding;

  /// Margin around tooltips from trigger element.
  final double tooltipMargin;
}
