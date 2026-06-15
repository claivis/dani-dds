/// dani Design System (DDS) — public API barrel.
library dani_dds;

export 'src/design_system/app_theme.dart';
// components.dart re-exports button.dart; hide ButtonVariant to avoid ambiguity
// with the canonical ButtonVariant in skin_component_styles.dart (used by all skins).
export 'src/design_system/components.dart' hide ButtonVariant;
// export 'src/design_system/components/button.dart'; // already via components.dart above
export 'src/design_system/components/card.dart';
export 'src/design_system/components/input.dart';
export 'src/design_system/dani_design_tokens.dart';
export 'src/design_system/dani_dialog_styles.dart';
export 'src/design_system/dani_form_factor.dart';
export 'src/design_system/dani_panel_constraints.dart';
export 'src/design_system/dani_spacing.dart';
export 'src/design_system/dani_type.dart';
export 'src/design_system/design_tokens.dart';
export 'src/design_system/responsive_event_card.dart';
export 'src/skin/dani_skin.dart';
export 'src/skin/editor/editable_skin.dart';
export 'src/skin/editor/element_style.dart';
export 'src/skin/editor/models/skin_profiles.dart';
export 'src/skin/editor/skin_editor_provider.dart';
export 'src/skin/editor/skin_element_tree.dart';
export 'src/skin/editor/skin_prop_accessor.dart';
export 'src/skin/editor/skin_serialization.dart';
export 'src/skin/skin_colors.dart';
export 'src/skin/skin_component_styles.dart';
export 'src/skin/skin_domain_colors.dart';
export 'src/skin/skin_effects.dart';
export 'src/skin/skin_font_loader.dart';
export 'src/skin/skin_meta.dart';
export 'src/skin/skin_provider.dart';
export 'src/skin/skin_registry_init.dart';
export 'src/skin/skin_registry.dart';
export 'src/skin/skin_shape.dart';
export 'src/skin/skin_sizing.dart';
export 'src/skin/skin_spacing.dart';
export 'src/skin/skin_typography.dart';
export 'src/skin/skin.dart';
export 'src/skin/skins/acid_skin.dart';
export 'src/skin/skins/atlas_skin.dart';
export 'src/skin/skins/brutalist_skin.dart';
export 'src/skin/skins/curator_skin.dart';
export 'src/skin/skins/dds_skin.dart';
export 'src/skin/skins/gemini_skin.dart';
export 'src/skin/skins/midnight_skin.dart';
export 'src/skin/skins/neon_skin.dart';
export 'src/skin/skins/paper_skin.dart';
export 'src/skin/skins/scout_skin.dart';
export 'src/skin/skins/skins.dart';
export 'src/skin/skins/tokyo_pop_skin.dart';
export 'src/skin/skins/voyager_skin.dart';
export 'src/theme/app_colors.dart';
export 'src/theme/dani_color_scheme.dart';
export 'src/theme/dani_theme.dart';
export 'src/theme/dialog_styles.dart';
export 'src/theme/gemini_theme.dart';
export 'src/theme/typography.dart';
