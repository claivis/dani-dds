import 'package:flutter/material.dart';

import '../dani_skin.dart';

/// Tokyo Pop — kawaii-inspired, hyper-rounded, pastel & bold.
///
/// 100% different from Gemini default:
/// - Gemini: sans-serif Inter → Tokyo Pop: rounded Nunito headings + Quicksand body
/// - Gemini: cyan primary → Tokyo Pop: coral/salmon primary
/// - Gemini: 12px card radius → Tokyo Pop: 24px card radius (bubbly)
/// - Gemini: glass enabled → Tokyo Pop: glass disabled (solid pastel fills)
/// - Gemini: subtle shadows → Tokyo Pop: colorful playful shadows
/// - Gemini: compact spacing → Tokyo Pop: generous airy spacing
/// - Gemini: normal scale → Tokyo Pop: 1.08 scale (bigger, friendlier text)
/// - Gemini: outlined icons → Tokyo Pop: filled rounded icons
/// - Gemini: bordered cards → Tokyo Pop: elevated cards with color shadows
/// - Gemini: uppercase none → Tokyo Pop: capitalize buttons
/// - Gemini: underline tabs → Tokyo Pop: pill tabs
/// - Gemini: shimmer loading → Tokyo Pop: animated dots
/// - Gemini: standard dialogs → Tokyo Pop: bottom sheet style
/// - Gemini: material switches → Tokyo Pop: cupertino switches
/// - Gemini: thin dividers → Tokyo Pop: no dividers (spacing only)
/// - Gemini: bouncing scroll → Tokyo Pop: bouncing (iOS feel throughout)
class TokyoPopSkin extends DaniSkin {
  const TokyoPopSkin();

  @override
  SkinMeta get meta => const SkinMeta(
        id: 'tokyo_pop',
        name: 'Tokyo Pop',
        description: 'Kawaii, pastel, playful & bubbly',
        previewColor: Color(0xFFFF6B6B),
        previewColorSecondary: Color(0xFFFFB347),
        isPremium: false,
        author: 'dani.go',
        version: '1.0.0',
        category: SkinCategory.playful,
        tags: ['kawaii', 'pastel', 'rounded', 'playful', 'colorful', 'bubbly'],
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // COLORS — warm pastels with coral/salmon primary, mint secondary
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinColors get colors => const SkinColors(
        // ── Core palette ──
        // Coral/salmon primary (vs Gemini's cyan)
        primary: Color(0xFFFF6B6B),          // coral
        primaryLight: Color(0xFFFF9A9A),     // light coral
        primaryDark: Color(0xFFE84545),      // dark coral
        primaryForeground: Color(0xFFFFFFFF), // white on coral
        secondary: Color(0xFF4ECDC4),        // mint/teal
        secondaryForeground: Color(0xFF1A1A2E),

        // Tertiary / Accent
        tertiary: Color(0xFFFFB347),         // warm orange
        tertiaryForeground: Color(0xFF1A1A2E),
        accent: Color(0xFFA78BFA),           // soft purple
        accentForeground: Color(0xFFFFFFFF),

        // ── Backgrounds (light) ── warm cream/pink tint
        background: Color(0xFFFFF5F5),       // very light pink (vs slate-100)
        surface: Color(0xFFFFFFFF),
        surfaceElevated: Color(0xFFFFF0F0),  // pink-tinted elevated
        surfaceVariant: Color(0xFFFFF8F0),   // peachy variant

        // ── Backgrounds (dark) ── warm dark purple (vs cold navy)
        backgroundDark: Color(0xFF1A1A2E),   // deep purple-navy
        surfaceDark: Color(0xFF252540),
        surfaceDarkElevated: Color(0xFF2D2D4A),
        surfaceDarkVariant: Color(0xFF353555),

        // ── Text (light) ── warm near-black
        text: Color(0xFF2D1B36),             // warm dark purple (vs slate-900)
        textMuted: Color(0xFF6B5B7B),        // muted purple
        textSubtle: Color(0xFF8B7B9B),       // subtle purple
        textDisabled: Color(0xFFB8A8C8),     // light purple

        // ── Text (dark) ──
        textDark: Color(0xFFFFF0F5),         // pink-tinted white
        textDarkMuted: Color(0xFFCBB8D8),
        textDarkSubtle: Color(0xFF9B88A8),
        textDarkDisabled: Color(0xFF6B5878),

        // Text special
        textLink: Color(0xFFFF6B6B),         // coral links
        textLinkDark: Color(0xFFFF9A9A),
        textOnPhoto: Color(0xFFFFFFFF),
        textOnPhotoDark: Color(0xFFFFFFFF),

        // ── Borders (light) ── soft pink borders (vs sharp slate)
        border: Color(0xFFFFD6D6),           // pink border
        borderSubtle: Color(0xFFFFE8E8),     // very subtle pink
        borderStrong: Color(0xFFFFB0B0),     // stronger pink

        // ── Borders (dark) ──
        borderDark: Color(0xFF3D3D5C),
        borderDarkSubtle: Color(0xFF2D2D4A),
        borderDarkStrong: Color(0xFF5A5A7A),

        // ── Status ──
        success: Color(0xFF4ECDC4),          // mint success (vs green)
        successLight: Color(0xFF7EDDD6),
        successDark: Color(0xFF36B5AD),
        warning: Color(0xFFFFB347),          // warm orange warning
        warningLight: Color(0xFFFFCC77),
        warningDark: Color(0xFFE89B2F),
        error: Color(0xFFFF6B6B),            // coral error
        errorLight: Color(0xFFFF9A9A),
        errorDark: Color(0xFFE84545),
        info: Color(0xFFA78BFA),             // purple info (vs blue)
        infoLight: Color(0xFFC4B5FD),
        infoDark: Color(0xFF8B5CF6),

        // ── Components (light) ──
        inputBackground: Color(0xFFFFF8F8),  // pink-tinted input bg
        inputBorder: Color(0xFFFFD6D6),
        inputBorderFocused: Color(0xFFFF6B6B),
        buttonPrimary: Color(0xFFFF6B6B),    // coral button
        buttonPrimaryText: Color(0xFFFFFFFF),
        buttonSecondary: Color(0xFFFFF0F0),  // light pink button
        buttonSecondaryText: Color(0xFFFF6B6B),

        // ── Components (dark) ──
        inputBackgroundDark: Color(0xFF252540),
        inputBorderDark: Color(0xFF3D3D5C),
        inputBorderFocusedDark: Color(0xFFFF9A9A),
        buttonPrimaryDark: Color(0xFFFF6B6B),
        buttonPrimaryTextDark: Color(0xFFFFFFFF),
        buttonSecondaryDark: Color(0xFF353555),
        buttonSecondaryTextDark: Color(0xFFFF9A9A),

        // Button danger
        buttonDanger: Color(0xFFE84545),
        buttonDangerText: Color(0xFFFFFFFF),
        buttonDangerDark: Color(0xFFFF6B6B),
        buttonDangerTextDark: Color(0xFFFFFFFF),

        // ── Special ──
        shadow: Color(0x1AFF6B6B),           // pink-tinted shadow (vs neutral)
        shadowDark: Color(0x4D000000),
        scrim: Color(0x661A1A2E),
        scrimDark: Color(0x991A1A2E),
        selection: Color(0x33FF6B6B),
        selectionDark: Color(0x33FF9A9A),

        // ── Navigation ──
        navBarBackground: Color(0xFFFFFFFF),
        navBarBackgroundDark: Color(0xFF1A1A2E),
        navBarSelectedItem: Color(0xFFFF6B6B),
        navBarSelectedItemDark: Color(0xFFFF9A9A),
        navBarUnselectedItem: Color(0xFFB8A8C8),
        navBarUnselectedItemDark: Color(0xFF6B5878),

        // ── Tab bar ──
        tabBarIndicator: Color(0xFFFF6B6B),
        tabBarIndicatorDark: Color(0xFFFF9A9A),
        tabBarSelectedLabel: Color(0xFFFF6B6B),
        tabBarSelectedLabelDark: Color(0xFFFF9A9A),
        tabBarUnselectedLabel: Color(0xFF8B7B9B),
        tabBarUnselectedLabelDark: Color(0xFF6B5878),

        // ── Chat / AI ──
        chatBubbleUser: Color(0xFFFF6B6B),
        chatBubbleUserDark: Color(0xFFE84545),
        chatBubbleUserText: Color(0xFFFFFFFF),
        chatBubbleUserTextDark: Color(0xFFFFFFFF),
        chatBubbleAssistant: Color(0xFFF0E6FF),  // light purple
        chatBubbleAssistantDark: Color(0xFF353555),
        chatBubbleAssistantText: Color(0xFF2D1B36),
        chatBubbleAssistantTextDark: Color(0xFFFFF0F5),

        // ── Timeline ──
        timelineConnector: Color(0xFFFFD6D6),
        timelineConnectorDark: Color(0xFF3D3D5C),
        timelineDot: Color(0xFFFF6B6B),
        timelineDotDark: Color(0xFFFF9A9A),
        timelineDateHeader: Color(0xFF8B7B9B),
        timelineDateHeaderDark: Color(0xFF9B88A8),

        // ── Shimmer ──
        shimmerBase: Color(0xFFFFF0F0),
        shimmerBaseDark: Color(0xFF2D2D4A),
        shimmerHighlight: Color(0xFFFFFFFF),
        shimmerHighlightDark: Color(0xFF353555),

        // ── Trip card ──
        tripCardOverlay: Color(0xFF1A1A2E),  // purple overlay
        tripCardOverlayDark: Color(0xFF1A1A2E),
        tripCardTitle: Color(0xFFFFFFFF),
        tripCardTitleDark: Color(0xFFFFFFFF),
        tripCardSubtitle: Color(0xFFFFF0F5),
        tripCardSubtitleDark: Color(0xFFCBB8D8),

        // ── Toggle ──
        switchActiveTrack: Color(0xFFFF6B6B),
        switchActiveTrackDark: Color(0xFFFF9A9A),
        switchInactiveTrack: Color(0xFFFFD6D6),
        switchInactiveTrackDark: Color(0xFF3D3D5C),
        switchThumb: Color(0xFFFFFFFF),
        switchThumbDark: Color(0xFFFFFFFF),

        // ── Tooltip ──
        tooltipBackground: Color(0xFF2D1B36),
        tooltipBackgroundDark: Color(0xFFFFF0F5),
        tooltipText: Color(0xFFFFFFFF),
        tooltipTextDark: Color(0xFF2D1B36),

        // ── Snackbar ──
        snackbarBackground: Color(0xFF2D1B36),
        snackbarBackgroundDark: Color(0xFF353555),
        snackbarText: Color(0xFFFFFFFF),
        snackbarTextDark: Color(0xFFFFF0F5),

        // ── Divider ──
        divider: Color(0xFFFFE8E8),
        dividerDark: Color(0xFF2D2D4A),

        // ── Premium ──
        premiumGold: Color(0xFFFFB347),
        premiumGoldDark: Color(0xFFFFCC77),

        // ── Highlight ──
        highlight: Color(0x33FFB347),
        highlightDark: Color(0x33FFCC77),
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // TYPOGRAPHY — rounded sans-serif, larger scale, airy line heights
  // (vs Gemini: Inter, 1.0 scale, tighter)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinTypography get typography => const SkinTypography(
        headingFamily: 'Nunito',            // rounded, friendly (vs Inter)
        bodyFamily: 'Quicksand',            // rounded geometric (vs Inter)
        monoFamily: 'Fira Code',            // ligature mono (vs JetBrains Mono)
        accentFamily: 'Pacifico',           // script/handwritten for accents
        scaleFactor: 1.08,                  // bigger text (vs 1.0)
        headingScaleFactor: 1.12,           // even bigger headings
        bodyScaleFactor: 1.05,              // slightly bigger body
        headingWeight: FontWeight.w800,     // extra bold headings
        titleWeight: FontWeight.w700,
        bodyWeight: FontWeight.w500,        // medium body (vs 400)
        labelWeight: FontWeight.w600,
        captionWeight: FontWeight.w500,
        headingLetterSpacing: -0.3,         // slightly tighter than Gemini's -0.5
        bodyLetterSpacing: 0.2,             // wider body (vs 0.0)
        labelLetterSpacing: 0.5,            // wider labels
        captionLetterSpacing: 0.3,
        headingLineHeight: 1.3,             // airier headings (vs 1.1-1.2)
        bodyLineHeight: 1.7,               // very airy body (vs 1.5)
        captionLineHeight: 1.4,
        headingWordSpacing: 1.0,            // wider word spacing
        bodyWordSpacing: 0.5,
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // SHAPE — super rounded everything (vs Gemini: moderate 8-12px)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinShape get shape => const SkinShape(
        cardRadius: 24,                     // very round (vs 12)
        buttonRadius: 9999,                 // pill buttons (vs 8)
        inputRadius: 16,                    // round inputs (vs 8)
        dialogRadius: 28,                   // round dialogs (vs 16)
        glassRadius: 28,                    // round glass (vs 20)
        glassPillRadius: 20,                // round pills (vs 12)
        badgeRadius: 9999,                  // pill badges (same)
        photoRadius: 20,                    // round photos (vs 10)
        chipRadius: 9999,                   // pill chips (same)
        avatarRadius: 9999,                 // circle avatars
        tooltipRadius: 12,                  // round tooltips (vs 8)
        snackbarRadius: 20,                 // round snackbar (vs 8)
        fabRadius: 9999,                    // circle FAB (vs 16)
        switchRadius: 9999,
        checkboxRadius: 8,                  // round checkbox (vs 4)
        menuRadius: 20,                     // round menus (vs 12)
        popupRadius: 20,
        bannerRadius: 24,                   // round banners (vs 12)
        searchBarRadius: 9999,              // pill search bar
        tabIndicatorRadius: 9999,           // pill tab indicator
        progressRadius: 9999,
        shimmerRadius: 16,                  // round shimmer (vs 8)
        bottomSheetRadius: 32,              // very round sheet (vs 20)
        navigationBarRadius: 24,            // round nav bar (vs 0)
        cardInnerRadius: 16,                // inner elements rounded too
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // EFFECTS — colorful soft shadows, no glass, playful animations
  // (vs Gemini: glass enabled, subtle shadows, standard animations)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinEffects get effects => SkinEffects(
        // Glass DISABLED — solid pastel fills instead (vs Gemini: enabled)
        glassFillOpacityDark: 0.0,
        glassFillOpacityLight: 0.0,
        glassBorderOpacityDark: 0.0,
        glassBorderOpacityLight: 0.0,
        glassBorderWidth: 0,
        glassBlurSigma: 0,
        glassDialogFillOpacityDark: 0.0,
        glassDialogFillOpacityLight: 0.0,
        glassDialogBorderOpacityDark: 0.0,
        glassDialogBorderOpacityLight: 0.0,
        enableGlass: false,
        enableBlur: false,

        // Glow — warm coral glow (vs cyan glow)
        enableGlow: true,
        glowPrimary: [
          BoxShadow(color: const Color(0xFFFF6B6B).withOpacity(0.3), blurRadius: 24, spreadRadius: -2),
        ],
        glowSecondary: [
          BoxShadow(color: const Color(0xFFFFB347).withOpacity(0.2), blurRadius: 32, spreadRadius: -6),
        ],

        // Shadows — colorful, soft, warm (vs neutral gray shadows)
        shadowSm: const [
          BoxShadow(color: Color(0x15FF6B6B), blurRadius: 8, offset: Offset(0, 2)),
          BoxShadow(color: Color(0x08000000), blurRadius: 4, offset: Offset(0, 1)),
        ],
        shadowMd: const [
          BoxShadow(color: Color(0x20FF6B6B), blurRadius: 16, offset: Offset(0, 4)),
          BoxShadow(color: Color(0x0C000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
        shadowLg: const [
          BoxShadow(color: Color(0x28FF6B6B), blurRadius: 28, offset: Offset(0, 8)),
          BoxShadow(color: Color(0x10000000), blurRadius: 16, offset: Offset(0, 4)),
        ],
        shadowSmDark: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 2)),
        ],
        shadowMdDark: [
          BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 16, offset: const Offset(0, 4)),
        ],
        shadowLgDark: [
          BoxShadow(color: Colors.black.withOpacity(0.45), blurRadius: 28, offset: const Offset(0, 8)),
        ],

        // Animation — bouncier, more playful (vs Gemini: standard easing)
        durationFast: const Duration(milliseconds: 120),
        durationNormal: const Duration(milliseconds: 350),
        durationSlow: const Duration(milliseconds: 600),
        curveDefault: Curves.easeOutCubic,
        curveSpring: Curves.elasticOut,            // bouncy
        curveSmooth: Curves.easeOutBack,           // overshoot
        pageTransitionDuration: const Duration(milliseconds: 400),
        pageTransitionCurve: Curves.easeOutBack,

        // Hover/press — more dramatic feedback (vs subtle)
        hoverScaleFactor: 1.05,                    // bigger zoom (vs 1.02)
        pressScaleFactor: 0.95,                    // bigger shrink (vs 0.98)
        hoverElevationBoost: 8.0,                  // more lift (vs 4.0)

        // Shimmer — pink-tinted
        shimmerBaseColor: const Color(0xFFFFF0F0),
        shimmerHighlightColor: const Color(0xFFFFFFFF),
        shimmerDuration: const Duration(milliseconds: 1200),

        // Ripple — coral splash
        rippleColor: const Color(0xFFFF6B6B),
        rippleOpacity: 0.15,

        // Overlay — purple-tinted scrim
        overlayColor: const Color(0xFF1A1A2E),
        overlayOpacity: 0.4,

        // Focus ring — coral
        focusRingColor: const Color(0xFFFF9A9A),
        focusRingWidth: 3.0,
        focusRingOffset: 3.0,
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // SPACING — generous, airy (vs Gemini: compact)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinSpacing get spacing => const SkinSpacing(
        // Card — roomy internal padding
        cardContentPadding: 16,              // bigger (vs 12)
        cardContentPaddingCompact: 12,       // bigger (vs 8)
        cardGap: 12,                         // wider gaps (vs 8)
        cardHeaderGap: 8,                    // wider (vs 6)
        cardFooterGap: 12,                   // wider (vs 8)
        cardPhotoGap: 12,                    // wider (vs 8)

        // Screen — generous margins
        screenPaddingHorizontal: 20,         // wider (vs 16)
        screenPaddingTop: 20,
        screenPaddingBottom: 24,

        // Section — airy spacing
        sectionSpacing: 32,                  // wider (vs 24)
        sectionHeaderBottomSpacing: 12,      // wider (vs 8)
        sectionDividerSpacing: 20,           // wider (vs 16)

        // Dialog — spacious
        dialogContentPadding: 28,            // bigger (vs 24)
        dialogTitleBottomSpacing: 20,        // bigger (vs 16)
        dialogActionSpacing: 12,             // bigger (vs 8)
        dialogActionTopSpacing: 28,

        // Button — padded
        buttonPaddingHorizontal: 36,         // bigger (vs 32)
        buttonPaddingVertical: 18,           // bigger (vs 16)
        buttonPaddingHorizontalSm: 20,       // bigger (vs 16)
        buttonPaddingVerticalSm: 10,         // bigger (vs 8)
        buttonGap: 12,                       // wider (vs 8)
        buttonIconGap: 10,                   // wider (vs 8)

        // Input — spacious
        inputContentPadding: 18,             // bigger (vs 16)
        inputLabelSpacing: 8,
        inputGroupSpacing: 20,

        // List — roomy
        listItemPaddingVertical: 14,         // bigger (vs 12)
        listItemPaddingHorizontal: 20,

        // Chip / Badge — padded
        chipPaddingHorizontal: 16,           // bigger (vs 12)
        chipPaddingVertical: 8,              // bigger (vs 4)
        chipSpacing: 8,
        badgePaddingHorizontal: 10,
        badgePaddingVertical: 4,

        // Icon + text
        iconTextGap: 10,                     // wider (vs 8)
        iconPadding: 6,

        // Timeline — airy
        timelineConnectorWidth: 3,           // thicker (vs 2)
        timelineDotDiameter: 16,             // bigger (vs 12)
        timelineLeftMargin: 48,              // wider (vs 40)
        timelineDateHeaderSpacing: 16,       // wider (vs 12)

        // Photo
        photoCarouselGap: 8,                 // wider (vs 4)
        photoGridGap: 8,

        // Tab bar
        tabBarLabelPadding: 20,              // wider (vs 16)
        tabBarIndicatorWeight: 3,            // thicker (vs 2)

        // FAB
        fabMargin: 20,                       // bigger (vs 16)
        fabExtendedPadding: 24,

        // Snackbar
        snackbarMargin: 12,
        snackbarContentPadding: 20,

        // Tooltip
        tooltipPadding: 10,
        tooltipMargin: 10,
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // SIZING — bigger, friendlier elements (vs Gemini: compact)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinSizing get sizing => const SkinSizing(
        // App bar — taller, centered
        appBarHeight: 64,                    // taller (vs 56)
        appBarElevation: 0,
        appBarCenterTitle: true,             // centered (vs start-aligned)

        // Navigation — taller
        bottomNavHeight: 72,                 // taller (vs 64)
        tabBarHeight: 52,                    // taller (vs 48)

        // Button — bigger
        buttonHeight: 52,                    // bigger (vs 48)
        buttonHeightSm: 40,                  // bigger (vs 36)
        buttonHeightLg: 60,                  // bigger (vs 56)
        buttonMinWidth: 80,                  // wider minimum (vs 64)
        buttonIconSize: 22,                  // bigger (vs 20)

        // Input — bigger
        inputHeight: 52,                     // bigger (vs 48)
        inputHeightSm: 40,

        // Icon — bigger
        iconSize: 26,                        // bigger (vs 24)
        iconSizeSm: 20,                      // bigger (vs 18)
        iconSizeLg: 36,                      // bigger (vs 32)
        iconSizeXl: 56,                      // bigger (vs 48)

        // Avatar — bigger
        avatarSize: 48,                      // bigger (vs 40)
        avatarSizeSm: 32,
        avatarSizeLg: 64,                    // bigger (vs 56)

        // Badge / Chip — bigger
        badgeHeight: 24,                     // bigger (vs 20)
        badgeDotSize: 10,                    // bigger (vs 8)
        chipHeight: 36,                      // bigger (vs 32)

        // FAB — bigger
        fabSize: 64,                         // bigger (vs 56)
        fabSizeSm: 48,                       // bigger (vs 40)

        // Divider — thinner (barely visible)
        dividerThickness: 0.5,               // thinner (vs 1)

        // Border — thinner
        borderWidth: 1.5,
        borderWidthThick: 2.5,
        borderWidthFocus: 2.5,

        // Photo — wider aspect, bigger thumbnails
        photoAspectRatio: 1.5,               // 3:2 (vs 16:9)
        photoThumbnailSize: 56,              // bigger (vs 48)
        photoCarouselHeight: 240,            // taller (vs 200)

        // Card — elevated with generous min height
        cardMinHeight: 0,
        cardMaxWidth: 520,                   // narrower max (vs infinity)
        cardElevation: 2,                    // elevated (vs 0)
        cardBorderWidth: 0,                  // no border (vs 1) — shadows instead

        // Dialog — narrower
        dialogMaxWidth: 480,                 // narrower (vs 560)
        dialogMinWidth: 300,
        dialogElevation: 12,                 // higher (vs 8)

        // Progress
        progressIndicatorSize: 28,           // bigger (vs 24)
        progressIndicatorStrokeWidth: 3.5,

        // Switch
        switchWidth: 56,                     // bigger (vs 52)
        switchHeight: 34,
        checkboxSize: 22,                    // bigger (vs 20)
        radioSize: 22,

        // Scrollbar — thin and round
        scrollbarThickness: 4,              // thinner (vs 6)
        scrollbarRadius: 9999,               // fully round

        // Star rating
        starSize: 18,                        // bigger (vs 16)
        starSpacing: 3,
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // COMPONENT STYLES — rounded, filled, playful variants
  // (vs Gemini: bordered, outlined, standard)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinComponentStyles get componentStyles => const SkinComponentStyles(
        // App bar — transparent/airy (vs solid)
        appBarStyle: AppBarVariant.transparent,

        // Cards — elevated with shadows (vs bordered)
        cardStyle: CardVariant.elevated,

        // Buttons — filled with pill shape, capitalize text
        buttonVariant: ButtonVariant.filled,
        buttonTextTransform: TextTransform.capitalize, // (vs none)

        // Inputs — filled background (vs outlined)
        inputVariant: InputVariant.filled,

        // Dialogs — bottom sheet style (vs standard)
        dialogVariant: DialogVariant.bottomSheet,

        // Chips — filled (vs outlined)
        chipVariant: ChipVariant.filled,

        // Badges — filled
        badgeVariant: BadgeVariant.filled,

        // Dividers — none/spacing only (vs solid)
        dividerVariant: DividerVariant.none,

        // Photos — rounded (with larger radius)
        photoShape: PhotoShape.rounded,

        // Icons — filled rounded (vs outlined)
        iconVariant: IconVariant.rounded,

        // Loading — animated dots (vs shimmer)
        loadingVariant: LoadingVariant.dots,

        // Scroll — bouncing everywhere (vs platform default)
        scrollPhysicsVariant: ScrollPhysicsVariant.bouncing,

        // Snackbar — top (vs bottom)
        snackbarPosition: SnackbarPosition.top,

        // Tooltip — standard
        tooltipVariant: TooltipVariant.standard,

        // Lists — spacing between items (vs divider lines)
        listSeparator: ListSeparatorVariant.spacing,

        // Tab indicator — pill (vs underline)
        tabIndicatorVariant: TabIndicatorVariant.pill,

        // Switches — cupertino style (vs material)
        switchVariant: SwitchVariant.cupertino,

        // Navigation — standard
        navRailVariant: NavRailVariant.standard,

        // Cursor — bar
        cursorVariant: CursorVariant.bar,

        // Feature flags
        showCardBorder: false,               // no border (vs true) — shadows instead
        showCardShadow: true,                // shadows (vs true)
        showInputBorder: false,              // no border (vs true) — filled bg instead
        showInputFill: true,
        showButtonShadow: true,              // button shadows (vs false)
        showPhotoOverlayGradient: true,
        useRippleEffect: true,
        showScrollbar: false,                // hide scrollbar (vs true) — cleaner look
        showDividers: false,                 // no dividers (vs true) — spacing instead
        showTimelineConnectors: true,
        animatePageTransitions: true,
        animateCardHover: true,

        // Text decoration
        headingTextDecoration: TextDecoration.none,
        linkTextDecoration: TextDecoration.none, // no underline links (vs underline)

        // Overlay
        tripCardOverlayOpacity: 0.35,        // lighter overlay (vs 0.4)
        photoOverlayGradientStops: [0.0, 0.6, 1.0],
        photoOverlayGradientOpacities: [0.0, 0.05, 0.5],
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // DOMAIN COLORS — pastel/playful event type colors
  // (vs Gemini: none / default system colors)
  // ═══════════════════════════════════════════════════════════════════════════

  @override
  SkinDomainColors get domainColors => const SkinDomainColors(
        flight: Color(0xFFA78BFA),           // soft purple
        train: Color(0xFF4ECDC4),            // mint
        car: Color(0xFFFFB347),              // orange
        bus: Color(0xFF7BC8F6),              // sky blue
        ferry: Color(0xFF6BB5FF),            // ocean blue
        cruise: Color(0xFF4ECDC4),           // mint
        subway: Color(0xFFFF9A9A),           // light coral
        hotel: Color(0xFFC4B5FD),            // lavender
        restaurant: Color(0xFFFF6B6B),       // coral
        activity: Color(0xFFFFB347),         // orange
        attraction: Color(0xFFA78BFA),       // purple
        rental: Color(0xFF7BC8F6),           // sky blue
      );
}
