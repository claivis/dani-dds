import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Unified form factor enum — SINGLE source of truth for responsive breakpoints.
///
/// Replaces the conflicting `DeviceTypeUtils` (shortestSide-based) and
/// `MobileUIHelpers` (width-based) systems with one cohesive detection.
enum DaniFormFactor {
  /// < 360px width (iPhone SE 1st gen, small Android)
  phoneCompact,

  /// 360-599px width
  phone,

  /// 600-899px width AND portrait orientation
  tabletPortrait,

  /// 600-899px shortestSide AND landscape orientation
  tabletLandscape,

  /// ≥ 900px shortestSide AND 1024-1439px width
  desktop,

  /// ≥ 1440px width
  desktopLarge,

  /// ≥ 1920px width
  desktopUltra;

  // ── Convenience getters ──

  bool get isPhone => this == phoneCompact || this == phone;
  bool get isTablet => this == tabletPortrait || this == tabletLandscape;
  bool get isDesktop =>
      this == desktop || this == desktopLarge || this == desktopUltra;
  bool get isPhoneCompact => this == phoneCompact;
  bool get isPortrait => this == phoneCompact || this == phone || this == tabletPortrait;
  bool get isLandscape => this == tabletLandscape;

  /// True for any screen wider than phone.
  bool get isWide => isTablet || isDesktop;

  // ── Detection ──

  /// Returns the current form factor based on MediaQuery.
  /// Call this in `build()` — it reads [MediaQuery.sizeOf].
  static DaniFormFactor of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return fromSize(size);
  }

  /// Pure function for testing / preview without a BuildContext.
  static DaniFormFactor fromSize(Size size) {
    final shortestSide = size.shortestSide;
    final width = size.width;

    // Desktop: large physical screen OR wide viewport (web + native desktop)
    final isNativeDesktop = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
         defaultTargetPlatform == TargetPlatform.windows ||
         defaultTargetPlatform == TargetPlatform.linux);
    if (shortestSide >= 900 || (kIsWeb && width >= 1024) || (isNativeDesktop && width >= 1024)) {
      if (width >= 1920) return DaniFormFactor.desktopUltra;
      if (width >= 1440) return DaniFormFactor.desktopLarge;
      return DaniFormFactor.desktop;
    }

    // Tablet: medium physical screen
    if (shortestSide >= 600) {
      final isLandscape = width > size.height;
      return isLandscape
          ? DaniFormFactor.tabletLandscape
          : DaniFormFactor.tabletPortrait;
    }

    // Phone
    if (width < 360) return DaniFormFactor.phoneCompact;
    return DaniFormFactor.phone;
  }
}
