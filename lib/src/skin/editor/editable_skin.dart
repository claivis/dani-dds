import '../dani_skin.dart';
import 'models/skin_profiles.dart';
import 'skin_serialization.dart';

/// A mutable, fully-concrete implementation of [DaniSkin].
///
/// The skin editor creates an [EditableSkin] from any existing skin via
/// [EditableSkin.fromSkin], mutates its fields through the editor UI, and
/// serializes the result to a JSON skin file via [toJson].
///
/// Unlike the immutable built-in skins, [EditableSkin] exposes public setters
/// on every skin group so the editor can update individual sections without
/// reconstructing the entire object.
///
/// Usage:
/// ```dart
/// final editable = EditableSkin.fromSkin(DaniSkin.of(context));
/// editable.colors = editable.colors.copyWith(primary: Colors.teal);
/// skinNotifier.value = editable;
/// ```
class EditableSkin extends DaniSkin {
  EditableSkin({
    required SkinMeta meta,
    required SkinColors colors,
    required SkinTypography typography,
    required SkinShape shape,
    required SkinEffects effects,
    SkinSpacing? spacing,
    SkinSizing? sizing,
    SkinComponentStyles? componentStyles,
    SkinDomainColors? domainColors,
    Map<String, ElementStyle>? elementOverrides,
    this.colorProfiles = const [],
    this.fontProfiles = const [],
    this.shapeProfiles = const [],
  })  : _meta = meta,
        _colors = colors,
        _typography = typography,
        _shape = shape,
        _effects = effects,
        _spacing = spacing ?? const SkinSpacing(),
        _sizing = sizing ?? const SkinSizing(),
        _componentStyles = componentStyles ?? const SkinComponentStyles(),
        _domainColors = domainColors,
        _elementOverrides = elementOverrides ?? {};

  // ── Private backing fields ──────────────────────────────────────────────

  SkinMeta _meta;
  SkinColors _colors;
  SkinTypography _typography;
  SkinShape _shape;
  SkinEffects _effects;
  SkinSpacing _spacing;
  SkinSizing _sizing;
  SkinComponentStyles _componentStyles;
  SkinDomainColors? _domainColors;
  Map<String, ElementStyle> _elementOverrides;

  // ── Editor-specific profile lists ───────────────────────────────────────

  /// Saved color presets embedded in this skin file.
  List<ColorProfile> colorProfiles;

  /// Saved font presets embedded in this skin file.
  List<FontProfile> fontProfiles;

  /// Saved shape/radius presets embedded in this skin file.
  List<ShapeProfile> shapeProfiles;

  // ── DaniSkin getters ────────────────────────────────────────────────────

  @override
  SkinMeta get meta => _meta;

  @override
  SkinColors get colors => _colors;

  @override
  SkinTypography get typography => _typography;

  @override
  SkinShape get shape => _shape;

  @override
  SkinEffects get effects => _effects;

  @override
  SkinSpacing get spacing => _spacing;

  @override
  SkinSizing get sizing => _sizing;

  @override
  SkinComponentStyles get componentStyles => _componentStyles;

  @override
  SkinDomainColors? get domainColors => _domainColors;

  @override
  Map<String, ElementStyle> get elementOverrides => _elementOverrides;

  // ── Mutable setters for editor use ──────────────────────────────────────

  set meta(SkinMeta v) => _meta = v;
  set colors(SkinColors v) => _colors = v;
  set typography(SkinTypography v) => _typography = v;
  set shape(SkinShape v) => _shape = v;
  set effects(SkinEffects v) => _effects = v;
  set spacing(SkinSpacing v) => _spacing = v;
  set sizing(SkinSizing v) => _sizing = v;
  set componentStyles(SkinComponentStyles v) => _componentStyles = v;
  set domainColors(SkinDomainColors? v) => _domainColors = v;
  set elementOverrides(Map<String, ElementStyle> v) => _elementOverrides = v;

  // ── Factories ───────────────────────────────────────────────────────────

  /// Create an [EditableSkin] from any existing [DaniSkin].
  ///
  /// All current values are copied; the resulting skin is fully independent
  /// of the source. Profile lists start empty — they are populated only when
  /// loading from a skin JSON file that includes a `profiles` section.
  factory EditableSkin.fromSkin(DaniSkin skin) => EditableSkin(
        meta: skin.meta,
        colors: skin.colors,
        typography: skin.typography,
        shape: skin.shape,
        effects: skin.effects,
        spacing: skin.spacing,
        sizing: skin.sizing,
        componentStyles: skin.componentStyles,
        domainColors: skin.domainColors,
        elementOverrides: Map.of(skin.elementOverrides),
      );

  /// Deep copy of this [EditableSkin].
  ///
  /// Profile lists are shallow-copied (profiles are immutable data classes).
  EditableSkin copy() => EditableSkin(
        meta: _meta,
        colors: _colors,
        typography: _typography,
        shape: _shape,
        effects: _effects,
        spacing: _spacing,
        sizing: _sizing,
        componentStyles: _componentStyles,
        domainColors: _domainColors,
        elementOverrides: Map.of(_elementOverrides),
        colorProfiles: List.of(colorProfiles),
        fontProfiles: List.of(fontProfiles),
        shapeProfiles: List.of(shapeProfiles),
      );

  // ── Serialization ────────────────────────────────────────────────────────

  /// Serialize this skin to the canonical dani.go skin JSON format.
  ///
  /// The output can be saved as a `.json` file and loaded back via
  /// [EditableSkin.fromJson].
  Map<String, dynamic> toJson() => {
        'version': '1.0.0',
        'meta': _meta.toJson(),
        'colors': _colors.toJson(),
        'typography': _typography.toJson(),
        'shape': _shape.toJson(),
        'effects': _effects.toJson(),
        'spacing': _spacing.toJson(),
        'sizing': _sizing.toJson(),
        'componentStyles': _componentStyles.toJson(),
        if (_domainColors != null) 'domainColors': _domainColors!.toJson(),
        if (_elementOverrides.isNotEmpty)
          'elementOverrides': elementOverridesToJson(_elementOverrides),
        if (colorProfiles.isNotEmpty ||
            fontProfiles.isNotEmpty ||
            shapeProfiles.isNotEmpty)
          'profiles': {
            if (colorProfiles.isNotEmpty)
              'colors': colorProfiles.map((p) => p.toJson()).toList(),
            if (fontProfiles.isNotEmpty)
              'fonts': fontProfiles.map((p) => p.toJson()).toList(),
            if (shapeProfiles.isNotEmpty)
              'shapes': shapeProfiles.map((p) => p.toJson()).toList(),
          },
      };

  /// Deserialize an [EditableSkin] from the canonical dani.go skin JSON format.
  ///
  /// Supports files produced by [toJson]. Unknown keys are silently ignored
  /// for forward-compatibility.
  factory EditableSkin.fromJson(Map<String, dynamic> json) {
    final profiles = json['profiles'] as Map<String, dynamic>?;
    return EditableSkin(
      meta: skinMetaFromJson(json['meta'] as Map<String, dynamic>),
      colors: skinColorsFromJson(json['colors'] as Map<String, dynamic>),
      typography:
          skinTypographyFromJson(json['typography'] as Map<String, dynamic>),
      shape: skinShapeFromJson(json['shape'] as Map<String, dynamic>),
      effects: skinEffectsFromJson(json['effects'] as Map<String, dynamic>),
      spacing: json.containsKey('spacing')
          ? skinSpacingFromJson(json['spacing'] as Map<String, dynamic>)
          : null,
      sizing: json.containsKey('sizing')
          ? skinSizingFromJson(json['sizing'] as Map<String, dynamic>)
          : null,
      componentStyles: json.containsKey('componentStyles')
          ? skinComponentStylesFromJson(
              json['componentStyles'] as Map<String, dynamic>)
          : null,
      domainColors: json.containsKey('domainColors')
          ? skinDomainColorsFromJson(
              json['domainColors'] as Map<String, dynamic>)
          : null,
      elementOverrides: json.containsKey('elementOverrides')
          ? elementOverridesFromJson(
              json['elementOverrides'] as Map<String, dynamic>?)
          : null,
      colorProfiles: (profiles?['colors'] as List<dynamic>?)
              ?.map((e) => ColorProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fontProfiles: (profiles?['fonts'] as List<dynamic>?)
              ?.map((e) => FontProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      shapeProfiles: (profiles?['shapes'] as List<dynamic>?)
              ?.map((e) => ShapeProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
