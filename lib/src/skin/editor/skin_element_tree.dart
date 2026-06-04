/// Hierarchical UI element tree for the skin editor.
///
/// Maps named UI elements to their skin parameter paths, organized as a
/// browsable tree. Each element can have child elements and editable
/// properties. Properties reference existing skin fields by path.

/// The type of value a property holds.
enum PropType { color, font, number, toggle, variant }

/// A single editable property on a UI element.
class SkinProp {
  final String label;
  final PropType type;

  /// Dot-separated path into the skin, e.g. "colors.chatBubbleUser"
  /// or "typography.bodyFamily". Used to read/write the value.
  final String path;

  /// When this property is null / not set, the runtime falls back to this
  /// other skin path. Shown in the UI as "inherited from …".
  final String? fallbackPath;

  /// Human-readable label for the fallback source, e.g. "Brand Colors > Primary".
  /// If null, derived automatically from [fallbackPath].
  final String? fallbackLabel;

  const SkinProp(this.label, this.type, this.path,
      {this.fallbackPath, this.fallbackLabel});
}

/// A node in the UI element hierarchy.
class SkinNode {
  final String name;
  final String? icon; // Material icon name hint (not used in code, just docs)
  final List<SkinNode> children;
  final List<SkinProp> props;

  const SkinNode(
    this.name, {
    this.icon,
    this.children = const [],
    this.props = const [],
  });
}

/// Convert a UI tree path (e.g. "App/Trip Details/Timeline/Event Card")
/// to a dot-path override key (e.g. "tripDetails.timeline.eventCard").
///
/// Strips the "App/" prefix, converts each segment to camelCase.
String treePathToElementPath(String treePath) {
  var path = treePath;
  if (path.startsWith('App/')) path = path.substring(4);
  if (path == 'App') return '';

  return path
      .split('/')
      .where((s) => s.isNotEmpty)
      .map(_toCamelCase)
      .join('.');
}

String _toCamelCase(String s) {
  final words = s.split(RegExp(r'[\s&]+'));
  if (words.isEmpty) return s;
  final buffer = StringBuffer(words[0].toLowerCase());
  for (int i = 1; i < words.length; i++) {
    final w = words[i];
    if (w.isEmpty) continue;
    buffer.write(w[0].toUpperCase());
    if (w.length > 1) buffer.write(w.substring(1).toLowerCase());
  }
  return buffer.toString();
}

/// Maps an [ElementStyle] property name to the closest [PropType].
PropType? elementStylePropertyType(String property) {
  return switch (property) {
    'backgroundColor' || 'textColor' || 'borderColor' => PropType.color,
    'fontFamily' => PropType.font,
    'fontSize' || 'borderRadius' || 'borderWidth' || 'padding' || 'opacity' =>
      PropType.number,
    'fontWeight' => PropType.variant,
    _ => null,
  };
}

// ─────────────────────────────────────────────────────────────────────────────
// The complete UI element tree — maps every visible element to skin params.
// ─────────────────────────────────────────────────────────────────────────────

const skinElementTree = SkinNode('App', children: [
  // ── Global ──────────────────────────────────────────────────────────────
  SkinNode('Global', children: [
    SkinNode('Brand Colors', props: [
      SkinProp('Primary', PropType.color, 'colors.primary'),
      SkinProp('Primary Light', PropType.color, 'colors.primaryLight'),
      SkinProp('Primary Dark', PropType.color, 'colors.primaryDark'),
      SkinProp('Primary Foreground', PropType.color, 'colors.primaryForeground'),
      SkinProp('Secondary', PropType.color, 'colors.secondary'),
      SkinProp('Secondary Foreground', PropType.color, 'colors.secondaryForeground'),
    ]),
    SkinNode('Backgrounds', props: [
      SkinProp('Background', PropType.color, 'colors.background'),
      SkinProp('Surface', PropType.color, 'colors.surface'),
      SkinProp('Surface Elevated', PropType.color, 'colors.surfaceElevated'),
      SkinProp('Surface Variant', PropType.color, 'colors.surfaceVariant'),
    ]),
    SkinNode('Text', props: [
      SkinProp('Default', PropType.color, 'colors.text'),
      SkinProp('Muted', PropType.color, 'colors.textMuted'),
      SkinProp('Subtle', PropType.color, 'colors.textSubtle'),
      SkinProp('Disabled', PropType.color, 'colors.textDisabled'),
      SkinProp('Link', PropType.color, 'colors.textLink'),
    ]),
    SkinNode('Borders', props: [
      SkinProp('Default', PropType.color, 'colors.border'),
      SkinProp('Subtle', PropType.color, 'colors.borderSubtle'),
      SkinProp('Strong', PropType.color, 'colors.borderStrong'),
      SkinProp('Width', PropType.number, 'sizing.borderWidth'),
      SkinProp('Width Thick', PropType.number, 'sizing.borderWidthThick'),
    ]),
    SkinNode('Status Colors', props: [
      SkinProp('Success', PropType.color, 'colors.success'),
      SkinProp('Warning', PropType.color, 'colors.warning'),
      SkinProp('Error', PropType.color, 'colors.error'),
      SkinProp('Info', PropType.color, 'colors.info'),
    ]),
    SkinNode('Typography Defaults', props: [
      SkinProp('Heading Font', PropType.font, 'typography.headingFamily'),
      SkinProp('Body Font', PropType.font, 'typography.bodyFamily'),
      SkinProp('Mono Font', PropType.font, 'typography.monoFamily'),
      SkinProp('Accent Font', PropType.font, 'typography.accentFamily'),
      SkinProp('Scale Factor', PropType.number, 'typography.scaleFactor'),
    ]),
  ]),

  // ── Home Screen ─────────────────────────────────────────────────────────
  SkinNode('Home Screen', children: [
    SkinNode('Trip Card', props: [
      SkinProp('Overlay Color', PropType.color, 'colors.tripCardOverlay',
          fallbackPath: 'colors.shadow',
          fallbackLabel: 'Global > Shadow'),
      SkinProp('Overlay Opacity', PropType.number, 'componentStyles.tripCardOverlayOpacity'),
      SkinProp('Title Color', PropType.color, 'colors.tripCardTitle',
          fallbackLabel: 'Hardcoded white'),
      SkinProp('Subtitle Color', PropType.color, 'colors.tripCardSubtitle',
          fallbackLabel: 'Hardcoded white (70%)'),
      SkinProp('Border Radius', PropType.number, 'shape.cardRadius'),
      SkinProp('Photo Shape', PropType.variant, 'componentStyles.photoShape'),
      SkinProp('Font', PropType.font, 'override.homeScreen.tripCard.fontFamily',
          fallbackPath: 'typography.headingFamily',
          fallbackLabel: 'Typography > Heading Font'),
    ]),
    SkinNode('App Bar', props: [
      SkinProp('Style', PropType.variant, 'componentStyles.appBarStyle'),
      SkinProp('Height', PropType.number, 'sizing.appBarHeight'),
    ]),
    SkinNode('Navigation Bar', props: [
      SkinProp('Background', PropType.color, 'colors.navBarBackground',
          fallbackPath: 'colors.surface',
          fallbackLabel: 'Backgrounds > Surface'),
      SkinProp('Selected Item', PropType.color, 'colors.navBarSelectedItem',
          fallbackPath: 'colors.primary',
          fallbackLabel: 'Brand Colors > Primary'),
      SkinProp('Unselected Item', PropType.color, 'colors.navBarUnselectedItem',
          fallbackPath: 'colors.textMuted',
          fallbackLabel: 'Text > Muted'),
      SkinProp('Height', PropType.number, 'sizing.bottomNavHeight'),
    ]),
  ]),

  // ── Trip Details ────────────────────────────────────────────────────────
  SkinNode('Trip Details', children: [
    SkinNode('Timeline', children: [
      SkinNode('Event Card', props: [
        SkinProp('Background', PropType.color, 'colors.surfaceElevated',
            fallbackPath: 'colors.surface',
            fallbackLabel: 'Backgrounds > Surface'),
        SkinProp('Border Color', PropType.color, 'colors.border'),
        SkinProp('Border Radius', PropType.number, 'shape.cardRadius'),
        SkinProp('Show Border', PropType.toggle, 'componentStyles.showCardBorder'),
        SkinProp('Show Shadow', PropType.toggle, 'componentStyles.showCardShadow'),
        SkinProp('Card Style', PropType.variant, 'componentStyles.cardStyle'),
        SkinProp('Content Padding', PropType.number, 'spacing.cardContentPadding'),
        SkinProp('Photo Radius', PropType.number, 'shape.photoRadius'),
        SkinProp('Font', PropType.font, 'override.tripDetails.timeline.eventCard.fontFamily',
            fallbackPath: 'typography.bodyFamily',
            fallbackLabel: 'Typography > Body Font'),
        SkinProp('Font Size', PropType.number, 'override.tripDetails.timeline.eventCard.fontSize',
            fallbackPath: null,
            fallbackLabel: 'System default (14)'),
      ]),
      SkinNode('Day Header', props: [
        SkinProp('Color', PropType.color, 'colors.timelineDateHeader',
            fallbackPath: 'colors.textMuted',
            fallbackLabel: 'Text > Muted'),
        SkinProp('Spacing', PropType.number, 'spacing.timelineDateHeaderSpacing'),
        SkinProp('Font', PropType.font, 'override.tripDetails.timeline.dayHeader.fontFamily',
            fallbackPath: 'typography.headingFamily',
            fallbackLabel: 'Typography > Heading Font'),
      ]),
      SkinNode('Connector', props: [
        SkinProp('Color', PropType.color, 'colors.timelineConnector',
            fallbackPath: 'colors.borderSubtle',
            fallbackLabel: 'Borders > Subtle'),
        SkinProp('Dot Color', PropType.color, 'colors.timelineDot',
            fallbackPath: 'colors.primary',
            fallbackLabel: 'Brand Colors > Primary'),
        SkinProp('Width', PropType.number, 'spacing.timelineConnectorWidth'),
        SkinProp('Dot Diameter', PropType.number, 'spacing.timelineDotDiameter'),
        SkinProp('Show', PropType.toggle, 'componentStyles.showTimelineConnectors'),
      ]),
    ]),
    SkinNode('Chat Panel', children: [
      SkinNode('User Bubble', props: [
        SkinProp('Background', PropType.color, 'colors.chatBubbleUser',
            fallbackPath: 'colors.primary',
            fallbackLabel: 'Brand Colors > Primary'),
        SkinProp('Text Color', PropType.color, 'colors.chatBubbleUserText',
            fallbackPath: 'colors.primaryForeground',
            fallbackLabel: 'Brand Colors > Primary Foreground'),
        SkinProp('Font', PropType.font, 'override.tripDetails.chatPanel.userBubble.fontFamily',
            fallbackPath: 'typography.bodyFamily',
            fallbackLabel: 'Typography > Body Font'),
        SkinProp('Font Size', PropType.number, 'override.tripDetails.chatPanel.userBubble.fontSize',
            fallbackPath: null,
            fallbackLabel: 'System default (14)'),
        SkinProp('Font Weight', PropType.variant, 'override.tripDetails.chatPanel.userBubble.fontWeight',
            fallbackPath: 'typography.bodyWeight',
            fallbackLabel: 'Typography > Body Weight'),
      ]),
      SkinNode('AI Bubble', props: [
        SkinProp('Background', PropType.color, 'colors.chatBubbleAssistant',
            fallbackPath: 'colors.surfaceVariant',
            fallbackLabel: 'Backgrounds > Surface Variant'),
        SkinProp('Text Color', PropType.color, 'colors.chatBubbleAssistantText',
            fallbackPath: 'colors.text',
            fallbackLabel: 'Text > Default'),
        SkinProp('Font', PropType.font, 'override.tripDetails.chatPanel.aiBubble.fontFamily',
            fallbackPath: 'typography.bodyFamily',
            fallbackLabel: 'Typography > Body Font'),
        SkinProp('Font Size', PropType.number, 'override.tripDetails.chatPanel.aiBubble.fontSize',
            fallbackPath: null,
            fallbackLabel: 'System default (14)'),
        SkinProp('Font Weight', PropType.variant, 'override.tripDetails.chatPanel.aiBubble.fontWeight',
            fallbackPath: 'typography.bodyWeight',
            fallbackLabel: 'Typography > Body Weight'),
      ]),
    ]),
  ]),

  // ── Domain Colors (event type icons) ────────────────────────────────────
  SkinNode('Event Type Colors', props: [
    SkinProp('Flight', PropType.color, 'domainColors.flight'),
    SkinProp('Train', PropType.color, 'domainColors.train'),
    SkinProp('Car', PropType.color, 'domainColors.car'),
    SkinProp('Bus', PropType.color, 'domainColors.bus'),
    SkinProp('Ferry', PropType.color, 'domainColors.ferry'),
    SkinProp('Hotel', PropType.color, 'domainColors.hotel'),
    SkinProp('Restaurant', PropType.color, 'domainColors.restaurant'),
    SkinProp('Activity', PropType.color, 'domainColors.activity'),
    SkinProp('Attraction', PropType.color, 'domainColors.attraction'),
    SkinProp('Rental', PropType.color, 'domainColors.rental'),
  ]),

  // ── Buttons ─────────────────────────────────────────────────────────────
  SkinNode('Buttons', props: [
    SkinProp('Primary Background', PropType.color, 'colors.buttonPrimary',
        fallbackPath: 'colors.primary',
        fallbackLabel: 'Brand Colors > Primary'),
    SkinProp('Primary Text', PropType.color, 'colors.buttonPrimaryText',
        fallbackPath: 'colors.primaryForeground',
        fallbackLabel: 'Brand Colors > Primary Foreground'),
    SkinProp('Secondary Background', PropType.color, 'colors.buttonSecondary',
        fallbackPath: 'colors.surfaceVariant',
        fallbackLabel: 'Backgrounds > Surface Variant'),
    SkinProp('Secondary Text', PropType.color, 'colors.buttonSecondaryText',
        fallbackPath: 'colors.text',
        fallbackLabel: 'Text > Default'),
    SkinProp('Danger Background', PropType.color, 'colors.buttonDanger',
        fallbackPath: 'colors.error',
        fallbackLabel: 'Status Colors > Error'),
    SkinProp('Danger Text', PropType.color, 'colors.buttonDangerText',
        fallbackLabel: 'Hardcoded white'),
    SkinProp('Border Radius', PropType.number, 'shape.buttonRadius'),
    SkinProp('Height', PropType.number, 'sizing.buttonHeight'),
    SkinProp('Variant', PropType.variant, 'componentStyles.buttonVariant'),
    SkinProp('Show Shadow', PropType.toggle, 'componentStyles.showButtonShadow'),
  ]),

  // ── Inputs ──────────────────────────────────────────────────────────────
  SkinNode('Inputs', props: [
    SkinProp('Background', PropType.color, 'colors.inputBackground',
        fallbackPath: 'colors.surface',
        fallbackLabel: 'Backgrounds > Surface'),
    SkinProp('Border', PropType.color, 'colors.inputBorder',
        fallbackPath: 'colors.border',
        fallbackLabel: 'Borders > Default'),
    SkinProp('Border Focused', PropType.color, 'colors.inputBorderFocused',
        fallbackPath: 'colors.primary',
        fallbackLabel: 'Brand Colors > Primary'),
    SkinProp('Border Radius', PropType.number, 'shape.inputRadius'),
    SkinProp('Height', PropType.number, 'sizing.inputHeight'),
    SkinProp('Variant', PropType.variant, 'componentStyles.inputVariant'),
  ]),

  // ── Dialogs ─────────────────────────────────────────────────────────────
  SkinNode('Dialogs', props: [
    SkinProp('Border Radius', PropType.number, 'shape.dialogRadius'),
    SkinProp('Max Width', PropType.number, 'sizing.dialogMaxWidth'),
    SkinProp('Variant', PropType.variant, 'componentStyles.dialogVariant'),
    SkinProp('Content Padding', PropType.number, 'spacing.dialogContentPadding'),
  ]),

  // ── Tab Bar ─────────────────────────────────────────────────────────────
  SkinNode('Tab Bar', props: [
    SkinProp('Indicator Color', PropType.color, 'colors.tabBarIndicator',
        fallbackPath: 'colors.primary',
        fallbackLabel: 'Brand Colors > Primary'),
    SkinProp('Selected Label', PropType.color, 'colors.tabBarSelectedLabel',
        fallbackPath: 'colors.primary',
        fallbackLabel: 'Brand Colors > Primary'),
    SkinProp('Unselected Label', PropType.color, 'colors.tabBarUnselectedLabel',
        fallbackPath: 'colors.textMuted',
        fallbackLabel: 'Text > Muted'),
    SkinProp('Indicator Style', PropType.variant, 'componentStyles.tabIndicatorVariant'),
    SkinProp('Height', PropType.number, 'sizing.tabBarHeight'),
  ]),

  // ── Tooltips & Snackbars ────────────────────────────────────────────────
  SkinNode('Tooltips', props: [
    SkinProp('Background', PropType.color, 'colors.tooltipBackground',
        fallbackPath: 'colors.surfaceVariant',
        fallbackLabel: 'Backgrounds > Surface Variant'),
    SkinProp('Text', PropType.color, 'colors.tooltipText',
        fallbackPath: 'colors.text',
        fallbackLabel: 'Text > Default'),
    SkinProp('Border Radius', PropType.number, 'shape.tooltipRadius'),
  ]),
  SkinNode('Snackbars', props: [
    SkinProp('Background', PropType.color, 'colors.snackbarBackground',
        fallbackPath: 'colors.surfaceElevated',
        fallbackLabel: 'Backgrounds > Surface Elevated'),
    SkinProp('Text', PropType.color, 'colors.snackbarText',
        fallbackPath: 'colors.text',
        fallbackLabel: 'Text > Default'),
    SkinProp('Border Radius', PropType.number, 'shape.snackbarRadius'),
    SkinProp('Position', PropType.variant, 'componentStyles.snackbarPosition'),
  ]),

  // ── Glass Effects ───────────────────────────────────────────────────────
  SkinNode('Glass Effects', props: [
    SkinProp('Enabled', PropType.toggle, 'effects.enableGlass'),
    SkinProp('Blur Sigma', PropType.number, 'effects.glassBlurSigma'),
    SkinProp('Fill Opacity (Dark)', PropType.number, 'effects.glassFillOpacityDark'),
    SkinProp('Fill Opacity (Light)', PropType.number, 'effects.glassFillOpacityLight'),
    SkinProp('Border Width', PropType.number, 'effects.glassBorderWidth'),
    SkinProp('Glass Radius', PropType.number, 'shape.glassRadius'),
    SkinProp('Enable Blur', PropType.toggle, 'effects.enableBlur'),
    SkinProp('Enable Glow', PropType.toggle, 'effects.enableGlow'),
    SkinProp('Enable Shadows', PropType.toggle, 'effects.enableShadows'),
  ]),

  // ── Loading & Shimmer ──────────────────────────────────────────────────
  SkinNode('Loading', props: [
    SkinProp('Shimmer Base', PropType.color, 'colors.shimmerBase',
        fallbackPath: 'colors.surfaceVariant',
        fallbackLabel: 'Backgrounds > Surface Variant'),
    SkinProp('Shimmer Highlight', PropType.color, 'colors.shimmerHighlight',
        fallbackPath: 'colors.surface',
        fallbackLabel: 'Backgrounds > Surface'),
    SkinProp('Shimmer Radius', PropType.number, 'shape.shimmerRadius'),
    SkinProp('Loading Style', PropType.variant, 'componentStyles.loadingVariant'),
  ]),

  // ── Switches & Toggles ─────────────────────────────────────────────────
  SkinNode('Switches', props: [
    SkinProp('Active Track', PropType.color, 'colors.switchActiveTrack',
        fallbackPath: 'colors.primary',
        fallbackLabel: 'Brand Colors > Primary'),
    SkinProp('Inactive Track', PropType.color, 'colors.switchInactiveTrack',
        fallbackPath: 'colors.surfaceVariant',
        fallbackLabel: 'Backgrounds > Surface Variant'),
    SkinProp('Thumb', PropType.color, 'colors.switchThumb',
        fallbackPath: 'colors.primaryForeground',
        fallbackLabel: 'Brand Colors > Primary Foreground'),
    SkinProp('Variant', PropType.variant, 'componentStyles.switchVariant'),
  ]),
]);
