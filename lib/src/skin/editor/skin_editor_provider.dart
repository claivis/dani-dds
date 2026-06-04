import 'dart:convert';
import 'dart:ui' show Color, FontWeight;

import 'package:flutter/foundation.dart' show debugPrint;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dani_skin.dart';
import '../skin_registry.dart';
import '../skin_provider.dart';
import 'editable_skin.dart';

/// Which section of the editor is active.
enum EditorSection { elements, quickEdit, colors, typography, shapes, effects, screens }

/// State for the skin editor.
class SkinEditorState {
  const SkinEditorState({
    required this.skin,
    this.section = EditorSection.elements,
    this.isDirty = false,
    this.livePreview = true,
    this.undoStack = const [],
    this.undoIndex = -1,
    this.selectedScreenPath,
    this.highlightedPropPath,
  });

  final EditableSkin skin;
  final EditorSection section;
  final bool isDirty;
  final bool livePreview;
  final List<String> undoStack; // JSON snapshots
  final int undoIndex;
  final String? selectedScreenPath; // e.g., "trip.timeline.dayHeaders"

  /// Skin param path to highlight in the element tree (e.g. "colors.primary").
  /// Set by the inspector when EDIT is tapped. Consumed and cleared by the tree.
  final String? highlightedPropPath;

  bool get canUndo => undoIndex > 0;
  bool get canRedo => undoIndex < undoStack.length - 1;

  SkinEditorState copyWith({
    EditableSkin? skin,
    EditorSection? section,
    bool? isDirty,
    bool? livePreview,
    List<String>? undoStack,
    int? undoIndex,
    String? selectedScreenPath,
    bool clearSelectedScreenPath = false,
    String? highlightedPropPath,
    bool clearHighlightedPropPath = false,
  }) =>
      SkinEditorState(
        skin: skin ?? this.skin,
        section: section ?? this.section,
        isDirty: isDirty ?? this.isDirty,
        livePreview: livePreview ?? this.livePreview,
        undoStack: undoStack ?? this.undoStack,
        undoIndex: undoIndex ?? this.undoIndex,
        selectedScreenPath: clearSelectedScreenPath
            ? null
            : selectedScreenPath ?? this.selectedScreenPath,
        highlightedPropPath: clearHighlightedPropPath
            ? null
            : highlightedPropPath ?? this.highlightedPropPath,
      );
}

class SkinEditorNotifier extends StateNotifier<SkinEditorState> {
  SkinEditorNotifier(this._ref)
      : super(SkinEditorState(
          skin: EditableSkin.fromSkin(
            SkinRegistry.getById('gemini') ?? SkinRegistry.all.first,
          ),
        )) {
    _pushSnapshot();
  }

  final Ref _ref;

  /// Load a skin into the editor and apply it to the app immediately.
  void loadSkin(DaniSkin skin) {
    final editable = EditableSkin.fromSkin(skin);
    state = SkinEditorState(
      skin: editable,
      section: state.section,
      livePreview: state.livePreview,
      undoStack: const [],
      undoIndex: -1,
    );
    _pushSnapshot();
    _applyLive();
  }

  /// Load from JSON string and apply to the app immediately.
  void loadFromJson(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final editable = EditableSkin.fromJson(json);
    state = SkinEditorState(
      skin: editable,
      section: state.section,
      livePreview: state.livePreview,
      undoStack: const [],
      undoIndex: -1,
    );
    _pushSnapshot();
    _applyLive();
  }

  /// Update the skin via a transform function and push an undo snapshot.
  void updateSkin(EditableSkin Function(EditableSkin current) updater) {
    final updated = updater(state.skin);
    state = state.copyWith(skin: updated, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update colors.
  void updateColors(SkinColors colors) {
    final skin = state.skin.copy();
    skin.colors = colors;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update typography.
  void updateTypography(SkinTypography typography) {
    final skin = state.skin.copy();
    skin.typography = typography;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update shape.
  void updateShape(SkinShape shape) {
    final skin = state.skin.copy();
    skin.shape = shape;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update effects.
  void updateEffects(SkinEffects effects) {
    final skin = state.skin.copy();
    skin.effects = effects;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update spacing.
  void updateSpacing(SkinSpacing spacing) {
    final skin = state.skin.copy();
    skin.spacing = spacing;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update sizing.
  void updateSizing(SkinSizing sizing) {
    final skin = state.skin.copy();
    skin.sizing = sizing;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update component styles.
  void updateComponentStyles(SkinComponentStyles styles) {
    final skin = state.skin.copy();
    skin.componentStyles = styles;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update domain colors.
  void updateDomainColors(SkinDomainColors domainColors) {
    final skin = state.skin.copy();
    skin.domainColors = domainColors;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update per-element style overrides.
  void updateElementOverrides(Map<String, ElementStyle> overrides) {
    final skin = state.skin.copy();
    skin.elementOverrides = overrides;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Set or update a single element override.
  void setElementOverride(String elementPath, String property, dynamic value) {
    debugPrint('🎨 SET ELEMENT OVERRIDE: path=$elementPath, prop=$property, val=$value');
    final skin = state.skin.copy();
    final overrides = Map<String, ElementStyle>.of(skin.elementOverrides);
    final existing = overrides[elementPath] ?? const ElementStyle();

    final updated = switch (property) {
      'backgroundColor' => existing.copyWith(backgroundColor: value as Color),
      'textColor' => existing.copyWith(textColor: value as Color),
      'borderColor' => existing.copyWith(borderColor: value as Color),
      'fontFamily' => existing.copyWith(fontFamily: value as String),
      'fontSize' => existing.copyWith(fontSize: (value as num).toDouble()),
      'fontWeight' => existing.copyWith(fontWeight: value as FontWeight),
      'borderRadius' => existing.copyWith(borderRadius: (value as num).toDouble()),
      'borderWidth' => existing.copyWith(borderWidth: (value as num).toDouble()),
      'padding' => existing.copyWith(padding: (value as num).toDouble()),
      'opacity' => existing.copyWith(opacity: (value as num).toDouble()),
      _ => existing,
    };

    if (updated.isEmpty) {
      overrides.remove(elementPath);
    } else {
      overrides[elementPath] = updated;
    }
    skin.elementOverrides = overrides;
    debugPrint('🎨 OVERRIDES AFTER SET: ${overrides.keys.toList()} — fontFamily for $elementPath = ${overrides[elementPath]?.fontFamily}');
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Remove a single property override for an element, reverting to inherited.
  void clearElementOverride(String elementPath, String property) {
    final skin = state.skin.copy();
    final overrides = Map<String, ElementStyle>.of(skin.elementOverrides);
    final existing = overrides[elementPath];
    if (existing == null) return;

    final updated = switch (property) {
      'backgroundColor' => existing.copyWith(clearBackgroundColor: true),
      'textColor' => existing.copyWith(clearTextColor: true),
      'borderColor' => existing.copyWith(clearBorderColor: true),
      'fontFamily' => existing.copyWith(clearFontFamily: true),
      'fontSize' => existing.copyWith(clearFontSize: true),
      'fontWeight' => existing.copyWith(clearFontWeight: true),
      'borderRadius' => existing.copyWith(clearBorderRadius: true),
      'borderWidth' => existing.copyWith(clearBorderWidth: true),
      'padding' => existing.copyWith(clearPadding: true),
      'opacity' => existing.copyWith(clearOpacity: true),
      _ => existing,
    };

    if (updated.isEmpty) {
      overrides.remove(elementPath);
    } else {
      overrides[elementPath] = updated;
    }
    skin.elementOverrides = overrides;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Update meta.
  void updateMeta(SkinMeta meta) {
    final skin = state.skin.copy();
    skin.meta = meta;
    state = state.copyWith(skin: skin, isDirty: true);
    _pushSnapshot();
    _applyLive();
  }

  /// Toggle live preview mode.
  void toggleLivePreview() {
    final newValue = !state.livePreview;
    state = state.copyWith(livePreview: newValue);
    if (newValue) _applyLive();
  }

  /// Push skin to app if live preview is on.
  void _applyLive() {
    if (!state.livePreview) return;
    debugPrint('🎨 APPLY LIVE: skinId=${state.skin.meta.id}, overrides=${state.skin.elementOverrides.keys.toList()}');
    SkinRegistry.register(state.skin);
    _ref.read(activeSkinProvider.notifier).setSkin(
      state.skin.meta.id,
      force: true,
    );
  }

  /// Switch editor section.
  void setSection(EditorSection section) {
    state = state.copyWith(section: section);
  }

  /// Navigate to Elements section and highlight a specific property.
  /// The tree section will auto-expand and scroll to the matching prop.
  void highlightProp(String skinFieldPath) {
    state = state.copyWith(
      section: EditorSection.elements,
      highlightedPropPath: skinFieldPath,
    );
  }

  /// Clear the highlighted prop (after the tree has consumed it).
  void clearHighlightedProp() {
    state = state.copyWith(clearHighlightedPropPath: true);
  }

  /// Set selected screen path for the Screens section.
  void setSelectedScreenPath(String? path) {
    if (path == null) {
      state = state.copyWith(clearSelectedScreenPath: true);
    } else {
      state = state.copyWith(selectedScreenPath: path);
    }
  }

  /// Undo to the previous snapshot.
  void undo() {
    if (!state.canUndo) return;
    final newIndex = state.undoIndex - 1;
    final snapshot = state.undoStack[newIndex];
    final skin =
        EditableSkin.fromJson(jsonDecode(snapshot) as Map<String, dynamic>);
    state = state.copyWith(skin: skin, undoIndex: newIndex, isDirty: true);
  }

  /// Redo to the next snapshot.
  void redo() {
    if (!state.canRedo) return;
    final newIndex = state.undoIndex + 1;
    final snapshot = state.undoStack[newIndex];
    final skin =
        EditableSkin.fromJson(jsonDecode(snapshot) as Map<String, dynamic>);
    state = state.copyWith(skin: skin, undoIndex: newIndex, isDirty: true);
  }

  /// Apply the current editor skin as the active app skin (live preview).
  ///
  /// Registers the editable skin in [SkinRegistry] under its ID so
  /// [activeSkinProvider] can resolve it, then switches the active skin.
  void applyToApp() {
    SkinRegistry.register(state.skin);
    _ref.read(activeSkinProvider.notifier).setSkin(
      state.skin.meta.id,
      force: true,
    );
  }

  /// Save the current editor skin as a new named skin.
  ///
  /// Registers it in [SkinRegistry], persists the JSON to SharedPreferences,
  /// switches the active skin, and marks the editor as clean.
  Future<void> saveAsNewSkin(String id, String name) async {
    final skin = state.skin.copy();
    skin.meta = SkinMeta(
      id: id,
      name: name,
      description: state.skin.meta.description,
      previewColor: state.skin.colors.primary,
      previewColorSecondary: state.skin.colors.secondary,
      isPremium: false,
      author: 'custom',
      version: '1.0.0',
      tags: const ['custom'],
      category: state.skin.meta.category,
    );
    // Register in memory
    SkinRegistry.register(skin);
    // Persist to SharedPreferences
    await _persistCustomSkin(skin);
    // Switch the app to the new skin
    _ref.read(activeSkinProvider.notifier).setSkin(id);
    // Update editor state
    state = state.copyWith(skin: skin, isDirty: false);
    _pushSnapshot();
  }

  /// Clone the currently loaded skin into the editor with a new id/name,
  /// ready for editing. Does NOT save yet — just sets up the editor.
  void cloneCurrentSkin(String newId, String newName) {
    final cloned = state.skin.copy();
    cloned.meta = SkinMeta(
      id: newId,
      name: newName,
      description: '${state.skin.meta.description} (clone)',
      previewColor: state.skin.colors.primary,
      previewColorSecondary: state.skin.meta.previewColorSecondary,
      isPremium: false,
      author: 'custom',
      version: '1.0.0',
      tags: [...state.skin.meta.tags, 'custom'],
      category: state.skin.meta.category,
    );
    state = SkinEditorState(
      skin: cloned,
      section: state.section,
      isDirty: true,
      undoStack: const [],
      undoIndex: -1,
    );
    _pushSnapshot();
  }

  /// Export the current skin as a pretty-printed JSON string.
  String exportJson() =>
      const JsonEncoder.withIndent('  ').convert(state.skin.toJson());

  // ── Persistence ─────────────────────────────────────────────────────────

  static const _customSkinsKey = 'custom_skins';

  Future<void> _persistCustomSkin(EditableSkin skin) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getStringList(_customSkinsKey) ?? [];
    final json = jsonEncode(skin.toJson());
    // Replace if same id exists, otherwise add
    final updated = <String>[];
    var replaced = false;
    for (final entry in existing) {
      try {
        final map = jsonDecode(entry) as Map<String, dynamic>;
        final meta = map['meta'] as Map<String, dynamic>?;
        if (meta?['id'] == skin.meta.id) {
          updated.add(json);
          replaced = true;
        } else {
          updated.add(entry);
        }
      } catch (_) {
        updated.add(entry);
      }
    }
    if (!replaced) updated.add(json);
    await prefs.setStringList(_customSkinsKey, updated);
  }

  /// Load all custom skins from SharedPreferences into [SkinRegistry].
  /// Call once at app startup (after [initializeSkinRegistry]).
  static Future<void> loadCustomSkins() async {
    final prefs = await SharedPreferences.getInstance();
    final entries = prefs.getStringList(_customSkinsKey) ?? [];
    for (final entry in entries) {
      try {
        final map = jsonDecode(entry) as Map<String, dynamic>;
        final skin = EditableSkin.fromJson(map);
        SkinRegistry.register(skin);
      } catch (_) {
        // Skip malformed entries
      }
    }
  }

  // ── Private helpers ─────────────────────────────────────────────────────

  void _pushSnapshot() {
    final json = jsonEncode(state.skin.toJson());

    // Discard any redo history above the current index before appending.
    final baseStack = state.undoIndex < state.undoStack.length - 1
        ? state.undoStack.sublist(0, state.undoIndex + 1)
        : List<String>.from(state.undoStack);

    baseStack.add(json);

    // Keep the undo stack bounded to 50 entries.
    if (baseStack.length > 50) baseStack.removeAt(0);

    state = state.copyWith(
      undoStack: baseStack,
      undoIndex: baseStack.length - 1,
    );
  }
}

/// Provider for the skin editor.
final skinEditorProvider =
    StateNotifierProvider<SkinEditorNotifier, SkinEditorState>(
  (ref) => SkinEditorNotifier(ref),
);
