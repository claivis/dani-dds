import 'skin_registry.dart';
import 'skins/skins.dart';

/// Register all built-in skins. Call once at app startup.
void initializeSkinRegistry() {
  SkinRegistry.register(const DdsSkin());
  SkinRegistry.register(const GeminiSkin());
  SkinRegistry.register(const MidnightSkin());
  SkinRegistry.register(const PaperSkin());
  SkinRegistry.register(const NeonSkin());
  SkinRegistry.register(const BrutalistSkin());
  SkinRegistry.register(const TokyoPopSkin());
  SkinRegistry.register(const VoyagerSkin());
  SkinRegistry.register(const AtlasSkin());
  SkinRegistry.register(const AcidSkin());
  SkinRegistry.register(const CuratorSkin());
  SkinRegistry.register(const ScoutSkin());
}
