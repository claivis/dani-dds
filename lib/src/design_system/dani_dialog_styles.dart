import 'package:flutter/material.dart';

/// Unified dialog styles for consistent look across all popups,
/// slide-ups, and fullscreen windows in the app.
///
/// DDS CONTRAST RULE (hard, non-negotiable):
///   Never black-on-black. Never white-on-white. Every text style that can
///   end up rendered on a dialog surface MUST resolve its color against the
///   current theme (`theme.colorScheme.onSurface`) — not leave it null and
///   hope a parent DefaultTextStyle fixes it. Chip / TextField / AlertDialog
///   defaults are theme-dependent and regularly fail on dark themes when a
///   colorless custom style overrides them. Always pass a ThemeData-aware
///   style when you see a `style:` slot on a widget inside a dialog.
///
/// Usage:
///   Text('Section', style: DaniDialogStyles.sectionHeader(theme))
///   TextField(style: DaniDialogStyles.fieldText(theme), decoration: DaniDialogStyles.fieldDecoration(theme: theme, label: 'Name'))
class DaniDialogStyles {
  DaniDialogStyles._();

  // ── Section Headers (cyan titles like "Personal Information") ──

  static TextStyle sectionHeader(ThemeData theme) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.primary,
      );

  static const Widget sectionDivider = Divider(height: 16);

  /// Spacing between sections
  static const double sectionGap = 20;

  /// Spacing between fields within a section
  static const double fieldGap = 10;

  /// Spacing between field and its label (when using separate Text label)
  static const double labelGap = 6;

  // ── Form Field Styles ──
  //
  // These used to be `static const TextStyle` with no color. That guaranteed
  // black-on-black on any dark-surface dialog whenever the widget they were
  // passed to (Chip, TextField, etc.) overrode its own theme default with
  // this colorless style. They are now theme-aware and always explicit.

  /// Text style for input text inside TextFields
  static TextStyle fieldText(ThemeData theme) => TextStyle(
        fontSize: 14,
        color: theme.colorScheme.onSurface,
      );

  /// Label style for chip labels / InputDecoration.labelStyle
  static TextStyle labelStyle(ThemeData theme) => TextStyle(
        fontSize: 12,
        color: theme.colorScheme.onSurface,
      );

  /// Hint style for InputDecoration.hintStyle
  static TextStyle hintStyle(ThemeData theme) => TextStyle(
        fontSize: 13,
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      );

  /// Content padding inside form fields
  static const EdgeInsets fieldPadding =
      EdgeInsets.symmetric(horizontal: 12, vertical: 10);

  /// Build a standard OutlineInputBorder
  static InputDecoration fieldDecoration({
    required ThemeData theme,
    String? label,
    String? hint,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: labelStyle(theme),
      hintText: hint,
      hintStyle: hintStyle(theme),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: theme.dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: theme.dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: theme.colorScheme.primary),
      ),
      isDense: true,
      contentPadding: fieldPadding,
    );
  }

  // ── Dialog Body Padding ──

  /// Body padding for phone fullscreen dialogs
  static const EdgeInsets phonePadding = EdgeInsets.all(16);

  /// Body padding for desktop/tablet dialogs
  static const EdgeInsets desktopPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 16);

  // ── Subtitle / Description Text ──

  static TextStyle subtitle(ThemeData theme) => TextStyle(
        fontSize: 13,
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
      );

  // ── Dialog Header (for custom headers like Create Vote) ──

  static const TextStyle dialogTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  // ── SwitchListTile / RadioListTile ──

  static const TextStyle listTileTitle = TextStyle(fontSize: 14);
  static const TextStyle listTileSubtitle = TextStyle(fontSize: 12);
}
