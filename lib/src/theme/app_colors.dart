import 'package:flutter/material.dart';
import '../skin/dani_skin.dart';

/// Dani App - Complete Color System
///
/// Core colors (primary, secondary, text, backgrounds) now delegate to the
/// active [DaniSkin] so switching skins changes these everywhere automatically.
/// Domain-specific colors (event types, transport types) stay as constants.

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  /// Active skin reference — set by [updateFromSkin].
  static DaniSkin? _skin;

  /// Current effective brightness — set by [updateBrightness].
  /// When `true`, getters return the skin's dark-mode variants so text and
  /// surfaces remain readable on dark backgrounds. Defaults to `false` so
  /// first-frame reads before the app root runs still produce valid colors.
  static bool _isDark = false;

  /// Whether AppColors is currently in dark mode.
  static bool get isDark => _isDark;

  /// Called by the skin provider when the active skin changes.
  static void updateFromSkin(DaniSkin skin) {
    _skin = skin;
  }

  /// Currently active skin, or `null` if the skin provider hasn't initialised
  /// yet. Widgets that need raw skin tokens (e.g. the DDS logo reads the
  /// accent colour directly off `colors.primary` / `colors.primaryLight`)
  /// can read this instead of hard-coding hex values.
  static DaniSkin? get activeSkin => _skin;

  /// Called by the app root whenever the effective brightness changes so that
  /// text/background getters resolve to the correct dark/light variant from
  /// the active skin. Widgets that read `AppColors.textPrimary` etc. do NOT
  /// need a BuildContext — they stay in sync with whatever the app root last
  /// pushed in here.
  static void updateBrightness(Brightness brightness) {
    _isDark = brightness == Brightness.dark;
  }

  // ==================== SKIN-AWARE COLORS ====================

  /// Primary accent — reads from active skin
  static Color get primary => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get primaryDark => _skin?.colors.primaryDark ?? const Color(0xFF0891B2);
  static Color get primaryLight => _skin?.colors.primaryLight ?? const Color(0xFF22D3EE);

  /// Secondary accent
  static Color get secondary => _skin?.colors.secondary ?? const Color(0xFF14B8A6);
  static Color get secondaryDark => _skin?.colors.secondaryForeground ?? const Color(0xFF0D9488);
  static Color get secondaryLight => _skin?.colors.secondary ?? const Color(0xFF2DD4BF);

  // ==================== BACKGROUNDS ====================

  /// App backgrounds
  static Color get appBackground => _isDark
      ? (_skin?.colors.backgroundDark ?? const Color(0xFF0B1220))
      : (_skin?.colors.background ?? const Color(0xFFF1F5F9));
  static Color get surfacePrimary => _isDark
      ? (_skin?.colors.surfaceDark ?? const Color(0xFF111827))
      : (_skin?.colors.surface ?? const Color(0xFFFFFFFF));
  static Color get surfaceSecondary => _isDark
      ? (_skin?.colors.surfaceDarkVariant ?? const Color(0xFF1F2937))
      : (_skin?.colors.surfaceVariant ?? const Color(0xFFF8FAFC));
  static Color get surfaceTertiary => _isDark
      ? (_skin?.colors.borderDark ?? const Color(0xFF374151))
      : (_skin?.colors.border ?? const Color(0xFFE2E8F0));

  /// Card backgrounds — skin-aware
  static Color get cardBackground => _isDark
      ? (_skin?.colors.surfaceDark ?? const Color(0xFF111827))
      : (_skin?.colors.surface ?? const Color(0xFFFFFFFF));
  static Color get elevatedSurface => _isDark
      ? (_skin?.colors.surfaceDarkElevated ?? const Color(0xFF1F2937))
      : (_skin?.colors.surfaceElevated ?? const Color(0xFFFFFFFF));

  /// Primary backgrounds — skin-aware
  static Color get primaryBackground => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get primarySurface => _isDark
      ? (_skin?.colors.surfaceDarkVariant ?? const Color(0xFF1F2937))
      : (_skin?.colors.surfaceVariant ?? const Color(0xFFF8FAFC));

  /// Banner backgrounds — skin-aware
  static Color get bannerBackground => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get bannerBackgroundEnd => _skin?.colors.secondary ?? const Color(0xFF14B8A6);

  // ==================== TEXT COLORS ====================

  /// Text colors — skin- and brightness-aware. In dark mode these return the
  /// skin's `textDark*` variants so labels stay readable against dark surfaces.
  static Color get textPrimary => _isDark
      ? (_skin?.colors.textDark ?? const Color(0xFFF9FAFB))
      : (_skin?.colors.text ?? const Color(0xFF0F172A));
  static Color get textSecondary => _isDark
      ? (_skin?.colors.textDarkMuted ?? const Color(0xFFD1D5DB))
      : (_skin?.colors.textMuted ?? const Color(0xFF475569));
  static Color get textTertiary => _isDark
      ? (_skin?.colors.textDarkSubtle ?? const Color(0xFF9CA3AF))
      : (_skin?.colors.textSubtle ?? const Color(0xFF64748B));
  static Color get textDisabled => _isDark
      ? (_skin?.colors.textDarkDisabled ?? const Color(0xFF6B7280))
      : (_skin?.colors.textDisabled ?? const Color(0xFF94A3B8));
  static Color get textPlaceholder => _isDark
      ? (_skin?.colors.textDarkDisabled ?? const Color(0xFF6B7280))
      : (_skin?.colors.textDisabled ?? const Color(0xFF94A3B8));

  /// Text on colored backgrounds — skin-aware
  static Color get textOnPrimary => _skin?.colors.primaryForeground ?? const Color(0xFF0F172A);
  static Color get textOnSecondary => _skin?.colors.secondaryForeground ?? const Color(0xFFFFFFFF);
  static Color get textOnDark => _skin?.colors.textDark ?? const Color(0xFFFFFFFF);
  static Color get textOnLight => _skin?.colors.text ?? const Color(0xFF0F172A);

  // ==================== STATUS COLORS ====================

  /// Status colors — skin-aware
  static Color get success => _skin?.colors.success ?? const Color(0xFF10B981);
  static Color get successDark => _skin?.colors.successDark ?? const Color(0xFF059669);
  static Color get successLight => _skin?.colors.successLight ?? const Color(0xFF34D399);
  static Color get successBackground => _skin?.colors.successLight.withOpacity(0.2) ?? const Color(0xFFD1FAE5);

  static Color get error => _skin?.colors.error ?? const Color(0xFFDC2626);
  static Color get errorDark => _skin?.colors.errorDark ?? const Color(0xFFB91C1C);
  static Color get errorLight => _skin?.colors.errorLight ?? const Color(0xFFF87171);
  static Color get errorBackground => _skin?.colors.errorLight.withOpacity(0.2) ?? const Color(0xFFFEE2E2);

  static Color get warning => _skin?.colors.warning ?? const Color(0xFFF59E0B);
  static Color get warningDark => _skin?.colors.warningDark ?? const Color(0xFFD97706);
  static Color get warningLight => _skin?.colors.warningLight ?? const Color(0xFFFBBF24);
  static Color get warningBackground => _skin?.colors.warningLight.withOpacity(0.2) ?? const Color(0xFFFEF3C7);

  static Color get info => _skin?.colors.info ?? const Color(0xFF06B6D4);
  static Color get infoDark => _skin?.colors.infoDark ?? const Color(0xFF0891B2);
  static Color get infoLight => _skin?.colors.infoLight ?? const Color(0xFF22D3EE);
  static Color get infoBackground => _skin?.colors.infoLight.withOpacity(0.2) ?? const Color(0xFFCFFAFE);

  // ==================== UI COMPONENT COLORS ====================

  /// Loading and progress — skin-aware
  static Color get loading => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get loadingBackground => _skin?.colors.background ?? const Color(0xFFF1F5F9);
  
  /// Avatar colors — skin-aware
  static Color get avatarBackground => _skin?.colors.secondary ?? const Color(0xFF14B8A6);
  static Color get avatarText => _skin?.colors.secondaryForeground ?? const Color(0xFFFFFFFF);

  /// Icon colors — skin- and brightness-aware
  static Color get iconPrimary => _isDark
      ? (_skin?.colors.textDark ?? const Color(0xFFF9FAFB))
      : (_skin?.colors.text ?? const Color(0xFF0F172A));
  static Color get iconSecondary => _isDark
      ? (_skin?.colors.textDarkMuted ?? const Color(0xFFD1D5DB))
      : (_skin?.colors.textMuted ?? const Color(0xFF475569));
  static Color get iconOnPrimary => _skin?.colors.primaryForeground ?? const Color(0xFF0F172A);
  static Color get iconOnSecondary => _skin?.colors.secondaryForeground ?? const Color(0xFFFFFFFF);
  static Color get placeholderIcon => _isDark
      ? (_skin?.colors.textDarkDisabled ?? const Color(0xFF6B7280))
      : (_skin?.colors.textDisabled ?? const Color(0xFF94A3B8));

  /// Shadow colors — skin-aware
  static Color get shadowLight => _skin?.colors.shadow ?? const Color(0x0D1E293B);
  static Color get shadowMedium => (_skin?.colors.shadow ?? const Color(0x331E293B)).withOpacity(0.20);
  static Color get shadowDark => (_skin?.colors.shadow ?? const Color(0x661E293B)).withOpacity(0.40);

  /// Border colors — skin- and brightness-aware
  static Color get borderPrimary => _isDark
      ? (_skin?.colors.borderDarkStrong ?? const Color(0xFF4B5563))
      : (_skin?.colors.borderStrong ?? const Color(0xFFCBD5E1));
  static Color get borderSecondary => _isDark
      ? (_skin?.colors.borderDark ?? const Color(0xFF374151))
      : (_skin?.colors.border ?? const Color(0xFFE2E8F0));
  static Color get borderLight => _isDark
      ? (_skin?.colors.borderDarkSubtle ?? const Color(0xFF1F2937))
      : (_skin?.colors.borderSubtle ?? const Color(0xFFF1F5F9));
  static Color get borderDark => _isDark
      ? (_skin?.colors.borderDarkStrong ?? const Color(0xFF4B5563))
      : (_skin?.colors.borderStrong ?? const Color(0xFF94A3B8));
  static Color get borderMedium => _isDark
      ? (_skin?.colors.borderDarkStrong ?? const Color(0xFF4B5563))
      : (_skin?.colors.borderStrong ?? const Color(0xFFCBD5E1));

  // ==================== TRANSPORTATION COLORS ====================
  
  /// Flight colors
  static const Color flightArrival = Color(0xFF06B6D4);  // cyan-500
  static const Color flightDeparture = Color(0xFF14B8A6); // teal-500
  static const Color flightDefault = Color(0xFF06B6D4);  // cyan-500
  
  /// Train colors
  static const Color trainArrival = Color(0xFF8B5CF6);   // purple-500
  static const Color trainDeparture = Color(0xFF6366F1); // indigo-500
  static const Color trainDefault = Color(0xFF8B5CF6);   // purple-500
  
  /// Car colors
  static const Color carArrival = Color(0xFFF59E0B);     // amber-500
  static const Color carDeparture = Color(0xFFF97316);   // orange-500
  static const Color carDefault = Color(0xFFF59E0B);     // amber-500
  
  /// Bus colors
  static const Color busArrival = Color(0xFF10B981);     // emerald-500
  static const Color busDeparture = Color(0xFF14B8A6);   // teal-500
  static const Color busDefault = Color(0xFF10B981);     // emerald-500
  
  /// Subway colors
  static const Color subwayArrival = Color(0xFF06B6D4); // cyan-500
  static const Color subwayDeparture = Color(0xFF0891B2); // cyan-600
  static const Color subwayDefault = Color(0xFF06B6D4);  // cyan-500
  
  /// Ferry colors
  static const Color ferryArrival = Color(0xFF14B8A6);   // teal-500
  static const Color ferryDeparture = Color(0xFF0D9488); // teal-600
  static const Color ferryDefault = Color(0xFF14B8A6);   // teal-500
  
  /// Cruise colors
  static const Color cruiseArrival = Color(0xFF3B82F6);  // blue-500
  static const Color cruiseDeparture = Color(0xFF2563EB); // blue-600
  static const Color cruiseDefault = Color(0xFF3B82F6);  // blue-500

  // ==================== ACCOMMODATION COLORS ====================
  
  /// Hotel/Resort
  static const Color hotelColor = Color(0xFF14B8A6);     // teal-500
  static const Color resortColor = Color(0xFF0D9488);    // teal-600
  
  /// Hostel/Backpacker
  static const Color hostelColor = Color(0xFF10B981);    // emerald-500
  static const Color backpackerColor = Color(0xFF059669); // emerald-600
  
  /// Apartment/Condo
  static const Color apartmentColor = Color(0xFFF59E0B); // amber-500
  static const Color condoColor = Color(0xFFD97706);     // amber-600
  
  /// Villa/Cabin
  static const Color villaColor = Color(0xFF8B5CF6);     // purple-500
  static const Color cabinColor = Color(0xFF7C3AED);     // purple-600
  
  /// Camping
  static const Color campingColor = Color(0xFF84CC16);   // lime-500

  // ==================== RENTAL COLORS ====================
  
  /// Car/Vehicle rentals
  static const Color carRentalColor = Color(0xFFF59E0B); // amber-500
  static const Color vehicleRentalColor = Color(0xFFD97706); // amber-600
  
  /// Bike/Motorcycle rentals
  static const Color bikeRentalColor = Color(0xFF10B981); // emerald-500
  static const Color motorcycleRentalColor = Color(0xFFF97316); // orange-500
  
  /// Boat/Yacht rentals
  static const Color boatRentalColor = Color(0xFF06B6D4); // cyan-500
  static const Color yachtRentalColor = Color(0xFF0891B2); // cyan-600
  
  /// Scooter/Moped rentals
  static const Color scooterRentalColor = Color(0xFF84CC16); // lime-500
  static const Color mopedRentalColor = Color(0xFF65A30D); // lime-600
  
  /// RV/Camper rentals
  static const Color rvRentalColor = Color(0xFF8B5CF6);  // purple-500
  static const Color camperRentalColor = Color(0xFF7C3AED); // purple-600

  // ==================== EVENT COLORS ====================
  
  /// Music events
  static const Color concertColor = Color(0xFFEC4899);   // pink-500
  static const Color musicColor = Color(0xFFDB2777);     // pink-600
  static const Color festivalColor = Color(0xFFF43F5E); // rose-500
  
  /// Sports events
  static const Color sportColor = Color(0xFF3B82F6);     // blue-500
  static const Color gameColor = Color(0xFF2563EB);      // blue-600
  static const Color matchColor = Color(0xFF1D4ED8);     // blue-700
  
  /// Performance events
  static const Color theaterColor = Color(0xFF8B5CF6);   // purple-500
  static const Color showColor = Color(0xFF7C3AED);      // purple-600
  static const Color performanceColor = Color(0xFF6366F1); // indigo-500
  
  /// Business events
  static const Color conferenceColor = Color(0xFF64748B); // slate-500
  static const Color meetingColor = Color(0xFF475569);   // slate-600
  static const Color workshopColor = Color(0xFF334155);  // slate-700
  
  /// Social events
  static const Color weddingColor = Color(0xFFF472B6);   // pink-400
  static const Color ceremonyColor = Color(0xFFDB2777);  // pink-600
  static const Color partyColor = Color(0xFFF97316);     // orange-500
  static const Color celebrationColor = Color(0xFFFB923C); // orange-400

  // ==================== ATTRACTION COLORS ====================
  
  /// Cultural attractions
  static const Color museumColor = Color(0xFF8B5CF6);    // purple-500
  static const Color galleryColor = Color(0xFF7C3AED);   // purple-600
  
  /// Natural attractions
  static const Color parkColor = Color(0xFF10B981);      // emerald-500
  static const Color gardenColor = Color(0xFF059669);    // emerald-600
  static const Color beachColor = Color(0xFF06B6D4);     // cyan-500
  static const Color coastColor = Color(0xFF0891B2);     // cyan-600
  static const Color mountainColor = Color(0xFF64748B);  // slate-500
  static const Color hikeColor = Color(0xFF475569);      // slate-600
  
  /// Historical attractions
  static const Color castleColor = Color(0xFFF59E0B);    // amber-500
  static const Color palaceColor = Color(0xFFD97706);    // amber-600
  static const Color templeColor = Color(0xFF14B8A6);    // teal-500
  static const Color churchColor = Color(0xFF0D9488);    // teal-600

  // ==================== RESTAURANT COLORS ====================
  
  /// Cuisine types
  static const Color italianColor = Color(0xFF10B981);   // emerald-500
  static const Color pizzaColor = Color(0xFFF97316);     // orange-500
  static const Color pastaColor = Color(0xFFFBBF24);     // amber-400
  static const Color chineseColor = Color(0xFFDC2626);   // red-600
  static const Color asianColor = Color(0xFFEF4444);     // red-500
  static const Color mexicanColor = Color(0xFFF97316);   // orange-500
  static const Color tacoColor = Color(0xFFFB923C);      // orange-400
  static const Color indianColor = Color(0xFFF59E0B);    // amber-500
  static const Color curryColor = Color(0xFFD97706);     // amber-600
  static const Color seafoodColor = Color(0xFF06B6D4);   // cyan-500
  static const Color fishColor = Color(0xFF0891B2);      // cyan-600
  static const Color steakColor = Color(0xFFDC2626);     // red-600
  static const Color bbqColor = Color(0xFFF97316);       // orange-500
  static const Color dessertColor = Color(0xFFEC4899);   // pink-500
  static const Color cakeColor = Color(0xFFF472B6);      // pink-400

  // ==================== OTHER ACTIVITY COLORS ====================
  
  /// Shopping
  static const Color shoppingColor = Color(0xFFEC4899);  // pink-500
  static const Color marketColor = Color(0xFFDB2777);    // pink-600
  
  /// Wellness
  static const Color spaColor = Color(0xFF06B6D4);       // cyan-500
  static const Color wellnessColor = Color(0xFF14B8A6);  // teal-500
  
  /// Tourism
  static const Color tourColor = Color(0xFF06B6D4);      // cyan-500
  static const Color guideColor = Color(0xFF0891B2);     // cyan-600
  
  /// Adventure
  static const Color adventureColor = Color(0xFFF97316); // orange-500
  static const Color extremeColor = Color(0xFFDC2626);   // red-600
  
  /// Leisure
  static const Color relaxColor = Color(0xFF10B981);     // emerald-500
  static const Color leisureColor = Color(0xFF14B8A6);   // teal-500

  // ==================== TIMELINE & UI COLORS ====================
  
  /// Timeline states — skin-aware
  static Color get timelineActive => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get timelineCompleted => _skin?.colors.success ?? const Color(0xFF10B981);
  static Color get timelinePlanned => _skin?.colors.textMuted ?? const Color(0xFF64748B);
  static Color get timelineCancelled => _skin?.colors.error ?? const Color(0xFFDC2626);

  /// Panel colors — skin-aware
  static Color get panelBlue => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get panelRed => _skin?.colors.error ?? const Color(0xFFDC2626);
  static Color get panelGreen => _skin?.colors.success ?? const Color(0xFF10B981);
  static Color get panelOrange => _skin?.colors.warning ?? const Color(0xFFF97316);
  static Color get panelGold => _skin?.colors.warning ?? const Color(0xFFF59E0B);

  /// Map colors — skin-aware
  static Color get mapMarker => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get mapRoute => _skin?.colors.secondary ?? const Color(0xFF14B8A6);
  static Color get mapSelected => _skin?.colors.warning ?? const Color(0xFFF59E0B);

  /// Stats colors — skin-aware
  static Color get statCard1 => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get statCard2 => _skin?.colors.success ?? const Color(0xFF10B981);
  static const Color statCard3 = Color(0xFF8B5CF6);      // purple-500 (decorative)
  static Color get statCard4 => _skin?.colors.warning ?? const Color(0xFFF59E0B);

  // ==================== LEGACY COLOR MAPPINGS ====================
  
  /// Legacy colors — skin-aware where applicable
  static Color get mustardYellow => _skin?.colors.warning ?? const Color(0xFFF59E0B);
  static Color get mutedBlack => _isDark
      ? (_skin?.colors.textDark ?? const Color(0xFFF9FAFB))
      : (_skin?.colors.text ?? const Color(0xFF0F172A));
  static Color get tripCompleted => _skin?.colors.success ?? const Color(0xFF10B981);
  static Color get placeholderBackground => _isDark
      ? (_skin?.colors.surfaceDarkVariant ?? const Color(0xFF1F2937))
      : (_skin?.colors.surfaceVariant ?? const Color(0xFFF1F5F9));
  static Color get textLink => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static const Color lavender = Color(0xFF8B5CF6);       // purple-500 (decorative)
  static Color get tea => _skin?.colors.secondary ?? const Color(0xFF14B8A6);
  static Color get infoBorder => _skin?.colors.primary ?? const Color(0xFF06B6D4);
  static Color get textOnMustardYellow => _skin?.colors.text ?? const Color(0xFF0F172A);
  static const Color textOnTea = Color(0xFFFFFFFF);      // white
  
  /// Old 5-color palette mapped to Gemini colors (for backwards compatibility)
  static const Color lightGreen = Color(0xFF10B981);     // emerald-500 (was #A1C181)
  static const Color yellow = Color(0xFFF59E0B);         // amber-500 (was #FCCA46)
  static const Color orange = Color(0xFFF97316);         // orange-500 (was #FE7F2D)
  static const Color teal = Color(0xFF14B8A6);           // teal-500 (was #619B8A)
  static const Color navy = Color(0xFF0F172A);           // slate-900 (was #253D4D)
  
  /// Pure neutrals
  static const Color pureWhite = Color(0xFFFFFFFF);      // Pure white
  static const Color pureBlack = Color(0xFF0F172A);      // slate-900 (not pure black)

  // ==================== MATERIAL COLORS REPLACEMENTS ====================
  
  /// Common Material Colors mapped to Gemini palette
  static const Color materialRed = Color(0xFFDC2626);     // red-600
  static const Color materialPink = Color(0xFFEC4899);    // pink-500
  static const Color materialPurple = Color(0xFF8B5CF6);  // purple-500
  static const Color materialDeepPurple = Color(0xFF7C3AED); // purple-600
  static const Color materialIndigo = Color(0xFF6366F1);  // indigo-500
  static const Color materialBlue = Color(0xFF3B82F6);    // blue-500
  static const Color materialLightBlue = Color(0xFF06B6D4); // cyan-500
  static const Color materialCyan = Color(0xFF06B6D4);    // cyan-500
  static const Color materialTeal = Color(0xFF14B8A6);    // teal-500
  static const Color materialGreen = Color(0xFF10B981);   // emerald-500
  static const Color materialLightGreen = Color(0xFF84CC16); // lime-500
  static const Color materialLime = Color(0xFF84CC16);    // lime-500
  static const Color materialYellow = Color(0xFFFBBF24);  // amber-400
  static const Color materialAmber = Color(0xFFF59E0B);   // amber-500
  static const Color materialOrange = Color(0xFFF97316);  // orange-500
  static const Color materialDeepOrange = Color(0xFFEA580C); // orange-600
  static const Color materialBrown = Color(0xFF78716C);   // stone-500
  static const Color materialGrey = Color(0xFF64748B);    // slate-500
  static const Color materialBlueGrey = Color(0xFF475569); // slate-600
  static const Color materialBlack = Color(0xFF0F172A);   // slate-900
  static const Color materialWhite = Color(0xFFFFFFFF);   // white
  static const Color transparent = Color(0x00000000);     // transparent

  // ==================== RAINBOW/PAIR COLORS ====================
  
  /// Rainbow colors using Gemini palette
  static const List<Color> rainbowColors = [
    Color(0xFF06B6D4),  // cyan-500
    Color(0xFF14B8A6),  // teal-500
    Color(0xFF10B981),  // emerald-500
    Color(0xFFF59E0B),  // amber-500
    Color(0xFFF97316),  // orange-500
    Color(0xFFEC4899),  // pink-500
    Color(0xFF8B5CF6),  // purple-500
  ];
  
  /// Pair colors for transportation/accommodation matching
  static const List<Color> pairColors = [
    Color(0xFF06B6D4),  // cyan-500
    Color(0xFF14B8A6),  // teal-500
    Color(0xFF10B981),  // emerald-500
    Color(0xFFF59E0B),  // amber-500
    Color(0xFF8B5CF6),  // purple-500
  ];

  // ==================== HELPER METHODS ====================
  
  /// Get color for event types (also handles attraction subcategory display names)
  static Color getEventTypeColor(String? eventType) {
    if (eventType == null) return _skin?.colors.primary ?? const Color(0xFF06B6D4);
    switch (eventType.toLowerCase()) {
      // Accommodation (includes direction variants from _getEventCategoryLabel)
      case 'accommodation':
      case 'check-in':
      case 'check-out':
        return const Color(0xFF14B8A6); // teal-500
      // Transportation
      case 'flight':
      case 'transportation':
        return const Color(0xFF06B6D4); // cyan-500
      // Activity / Attraction
      case 'activity':
      case 'attraction':
        return const Color(0xFF10B981); // emerald-500
      // Restaurant / Dining (includes meal labels from _mealLabelFromTime)
      case 'dining':
      case 'restaurant':
      case 'breakfast':
      case 'brunch':
      case 'lunch':
      case 'dinner':
        return const Color(0xFFF59E0B); // amber-500
      // Rental
      case 'rental':
        return const Color(0xFFF59E0B); // amber-500
      // Attraction subcategory display names — unified Activity color
      case 'landmarks & museums':
      case 'sightseeing':
      case 'entertainment':
      case 'nature & outdoors':
      case 'shopping & lifestyle':
        return const Color(0xFF10B981); // emerald-500 (unified Activity color)
      // Fine-grained attraction types (from AttractionSubcategory.granularLabel)
      case 'winery':
      case 'museum':
      case 'gallery':
      case 'park':
      case 'garden':
      case 'zoo':
      case 'aquarium':
      case 'stadium':
      case 'sports venue':
      case 'temple':
      case 'shrine':
      case 'church':
      case 'castle':
      case 'monument':
      case 'historic site':
      case 'theater':
      case 'theatre':
      case 'cinema':
      case 'theme park':
      case 'amusement park':
      case 'beach':
      case 'viewpoint':
      case 'hot spring':
      case 'onsen':
      case 'shopping mall':
      case 'marketplace':
        return const Color(0xFF10B981); // emerald-500 (unified Activity color)
      case 'poké lids':
        return const Color(0xFFE53935); // Pokéball red
      case 'photo spots':
        return const Color(0xFF8B5CF6); // violet-500
      case 'live event':
      case 'concert':
        return const Color(0xFFEC4899); // Pink-500 (distinct for live events)
      case 'shopping':
      case 'market':
        return const Color(0xFF10B981); // emerald-500 (unified Activity color)
      // Simple Event (lightweight markers on timeline)
      case 'simple':
      case 'simple event':
        return const Color(0xFF64748B); // slate-500
      default:
        return const Color(0xFF06B6D4); // cyan-500
    }
  }
  
  /// Get color for transportation types
  static Color getTransportationTypeColor(String? transportationType) {
    switch (transportationType?.toLowerCase()) {
      case 'flight':
      case 'airplane':
        return const Color(0xFF0EA5E9); // sky-500
      case 'train':
      case 'railway':
        return const Color(0xFF8B5CF6); // purple-500
      case 'bus':
      case 'coach':
        return const Color(0xFFD97706); // amber-600 (warm orange-yellow)
      case 'subway':
      case 'metro':
      case 'underground':
        return const Color(0xFF06B6D4); // cyan-500
      case 'ferry':
        return const Color(0xFF0284C7); // sky-600
      case 'cruise':
        return const Color(0xFF0369A1); // sky-700
      case 'car':
      case 'rental':
        return const Color(0xFFF59E0B); // amber-500
      default:
        return const Color(0xFF06B6D4); // cyan-500
    }
  }
  
  /// Get color for trip status
  static Color getTripStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
        return const Color(0xFF10B981); // emerald-500
      case 'active':
      case 'ongoing':
        return const Color(0xFF06B6D4); // cyan-500
      case 'planned':
      case 'upcoming':
        return const Color(0xFF64748B); // slate-500
      case 'cancelled':
        return const Color(0xFFDC2626); // red-600
      default:
        return const Color(0xFF06B6D4); // cyan-500
    }
  }
  
  /// Get color from rainbow palette by index
  static Color getRainbowColor(int index) {
    return rainbowColors[index % rainbowColors.length];
  }
  
  /// Get pair color by index
  static Color getPairColor(int index) {
    return pairColors[index % pairColors.length];
  }
}
