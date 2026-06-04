import 'package:flutter/material.dart';
import 'dani_theme.dart';

/// Helper class for styling dialogs.
/// All dialogs default to solid opaque styling for consistent UI.
class DialogStyles {
  DialogStyles._();

  /// Get dialog decoration — solid opaque by default, neon mode optional.
  static BoxDecoration getDialogDecoration(BuildContext context, {bool? isNeonMode}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonMode = isNeonMode ?? false;

    if (neonMode) {
      // Neon Mode: Glass effect with glowing cyan border
      return BoxDecoration(
        color: isDark
            ? DaniTheme.surface.withOpacity(0.3)
            : Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? DaniTheme.cyan.withOpacity(0.5)
              : DaniTheme.cyan.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? DaniTheme.cyan.withOpacity(0.2)
                : DaniTheme.cyan.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      );
    } else {
      // Standard solid dialog
      return BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      );
    }
  }

  /// Get dialog shape.
  static ShapeBorder getDialogShape(BuildContext context, {bool? isNeonMode}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonMode = isNeonMode ?? false;

    if (neonMode) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark
              ? DaniTheme.cyan.withOpacity(0.5)
              : DaniTheme.cyan.withOpacity(0.3),
          width: 1.5,
        ),
      );
    } else {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      );
    }
  }

  /// Get dialog background color — solid opaque by default.
  static Color getDialogBackgroundColor(BuildContext context, {bool? isNeonMode}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonMode = isNeonMode ?? false;

    if (neonMode) {
      return isDark
          ? DaniTheme.surface.withOpacity(0.3)
          : Colors.white.withOpacity(0.85);
    } else {
      return isDark ? const Color(0xFF1E293B) : Colors.white;
    }
  }
}
