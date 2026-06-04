import 'dani_skin.dart';

/// Global registry of available skins.
///
/// Register skins at startup; query them by ID or list all for the picker.
class SkinRegistry {
  SkinRegistry._();

  static final Map<String, DaniSkin> _skins = {};

  /// Register a skin. Overwrites any existing skin with the same ID.
  static void register(DaniSkin skin) {
    _skins[skin.meta.id] = skin;
  }

  /// Get a skin by its unique ID. Returns null if not found.
  static DaniSkin? getById(String id) => _skins[id];

  /// All registered skins.
  static List<DaniSkin> get all => _skins.values.toList();

  /// Only free (non-premium) skins.
  static List<DaniSkin> get free =>
      _skins.values.where((s) => !s.meta.isPremium).toList();

  /// Only premium skins.
  static List<DaniSkin> get premium =>
      _skins.values.where((s) => s.meta.isPremium).toList();

  /// All skin IDs.
  static List<String> get ids => _skins.keys.toList();

  /// Whether the registry is non-empty.
  static bool get isNotEmpty => _skins.isNotEmpty;

  /// Clear all registered skins (for testing).
  static void clear() => _skins.clear();
}
