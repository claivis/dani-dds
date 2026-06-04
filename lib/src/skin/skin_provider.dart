import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../design_system/dani_design_tokens.dart';
import '../design_system/dani_type.dart';
import '../theme/app_colors.dart';
import 'dani_skin.dart';
import 'skin_registry.dart';
import 'skins/dds_skin.dart';

const _prefKey = 'active_skin_id';

/// Push the skin into the static bridges so ALL existing code sees the change.
void _pushSkinToStatics(DaniSkin skin) {
  DaniDesignTokens.updateFromSkin(skin);
  DaniType.updateFromSkin(skin);
  AppColors.updateFromSkin(skin);
}

/// Provides the active [DaniSkin], persisted in SharedPreferences.
///
/// Usage:
/// ```dart
/// final skin = ref.watch(activeSkinProvider);
/// ref.read(activeSkinProvider.notifier).setSkin('midnight');
/// ```
final activeSkinProvider =
    StateNotifierProvider<ActiveSkinNotifier, DaniSkin>((ref) {
  final notifier = ActiveSkinNotifier();
  // Load saved preference asynchronously
  SharedPreferences.getInstance().then((prefs) {
    var savedId = prefs.getString(_prefKey);
    // Migrate renamed skin id: 'dot' → 'dds'
    if (savedId == 'dot') {
      savedId = 'dds';
      prefs.setString(_prefKey, 'dds');
    }
    if (savedId != null) {
      final skin = SkinRegistry.getById(savedId);
      if (skin != null) {
        notifier.setSkin(savedId, persist: false);
      }
    }
  });
  return notifier;
});

class ActiveSkinNotifier extends StateNotifier<DaniSkin> {
  ActiveSkinNotifier() : super(const DdsSkin()) {
    // Push default skin on creation
    _pushSkinToStatics(state);
  }

  /// Switch to a different skin by ID.
  ///
  /// Pass [force] to always notify listeners even if the same skin ID is
  /// already active (used by the skin editor when tokens change in-place).
  void setSkin(String skinId, {bool persist = true, bool force = false}) {
    final skin = SkinRegistry.getById(skinId);
    if (skin == null) return;

    if (force && identical(state, skin)) {
      // Temporarily clear so StateNotifier sees a change.
      state = const DdsSkin();
    }
    state = skin;
    _pushSkinToStatics(skin);
    if (persist) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(_prefKey, skinId);
      });
    }
  }

  /// Get the current skin ID.
  String get currentId => state.meta.id;
}
