// Button component inspired by shadcn/ui
// Provides various button variants with consistent styling
// Reads colors and radii from the active DaniSkin.

import 'package:flutter/material.dart';
import '../design_tokens.dart';
import '../../theme/app_colors.dart';
import '../../skin/dani_skin.dart';

/// Button variants following shadcn/ui design principles
enum ButtonVariant {
  default_,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

/// Button sizes following shadcn/ui design principles
enum ButtonSize {
  sm,
  default_,
  lg,
  icon,
}

/// A customizable button component inspired by shadcn/ui
class ShadcnButton extends StatelessWidget {
  /// The button's child widget
  final Widget child;

  /// Called when the button is pressed
  final VoidCallback? onPressed;

  /// The button variant
  final ButtonVariant variant;

  /// The button size
  final ButtonSize size;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Custom width for the button
  final double? width;

  /// Custom height for the button
  final double? height;

  const ShadcnButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = ButtonVariant.default_,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  });

  /// Create a default button
  const ShadcnButton.default_({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.default_;

  /// Create a destructive button
  const ShadcnButton.destructive({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.destructive;

  /// Create an outline button
  const ShadcnButton.outline({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.outline;

  /// Create a secondary button
  const ShadcnButton.secondary({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.secondary;

  /// Create a ghost button
  const ShadcnButton.ghost({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.ghost;

  /// Create a link button
  const ShadcnButton.link({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.default_,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.link;

  /// Create an icon button
  const ShadcnButton.icon({
    super.key,
    required this.child,
    this.onPressed,
    this.size = ButtonSize.icon,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
  }) : variant = ButtonVariant.default_;

  @override
  Widget build(BuildContext context) {
    final isDisabled = this.isDisabled || onPressed == null;

    return SizedBox(
      width: width,
      height: height ?? _getHeight(),
      child: _buildButton(context, isDisabled),
    );
  }

  Widget _buildButton(BuildContext context, bool isDisabled) {
    switch (variant) {
      case ButtonVariant.default_:
        return _buildElevatedButton(context, isDisabled);
      case ButtonVariant.destructive:
        return _buildDestructiveButton(context, isDisabled);
      case ButtonVariant.outline:
        return _buildOutlinedButton(context, isDisabled);
      case ButtonVariant.secondary:
        return _buildSecondaryButton(context, isDisabled);
      case ButtonVariant.ghost:
        return _buildGhostButton(context, isDisabled);
      case ButtonVariant.link:
        return _buildLinkButton(context, isDisabled);
    }
  }

  Widget _buildElevatedButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;
    final radius = _getBorderRadius(skin);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: isDisabled ? null : skin.effects.shadow(isDark),
      ),
      child: ElevatedButton(
      onPressed: isDisabled ? null : _handlePress,
      style: ElevatedButton.styleFrom(
          backgroundColor: c.btnPrimary(isDark),
          foregroundColor: c.btnPrimaryTxt(isDark),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white.withOpacity(0.1);
              }
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withOpacity(0.2);
              }
              return null;
            },
          ),
      ),
      child: _buildChild(context),
      ),
    );
  }

  Widget _buildDestructiveButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;
    final radius = _getBorderRadius(skin);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: isDisabled ? null : skin.effects.shadow(isDark),
      ),
      child: ElevatedButton(
      onPressed: isDisabled ? null : _handlePress,
      style: ElevatedButton.styleFrom(
          backgroundColor: c.error,
          foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white.withOpacity(0.1);
              }
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withOpacity(0.2);
              }
              return null;
            },
          ),
      ),
      child: _buildChild(context),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;
    final radius = _getBorderRadius(skin);

    return OutlinedButton(
      onPressed: isDisabled ? null : _handlePress,
      style: OutlinedButton.styleFrom(
        foregroundColor: c.primary,
        side: BorderSide(
          color: isDisabled
              ? c.brdStrong(isDark).withOpacity(0.3)
              : c.brdStrong(isDark),
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return c.primary.withOpacity(0.1);
            }
            if (states.contains(WidgetState.pressed)) {
              return c.primary.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
      child: _buildChild(context),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;
    final radius = _getBorderRadius(skin);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: isDisabled ? null : skin.effects.shadow(isDark, size: ShadowSize.sm),
      ),
      child: ElevatedButton(
      onPressed: isDisabled ? null : _handlePress,
      style: ElevatedButton.styleFrom(
          backgroundColor: c.btnSecondary(isDark),
          foregroundColor: c.btnSecondaryTxt(isDark),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return c.txt(isDark).withOpacity(0.05);
              }
              if (states.contains(WidgetState.pressed)) {
                return c.txt(isDark).withOpacity(0.1);
              }
              return null;
            },
          ),
      ),
      child: _buildChild(context),
      ),
    );
  }

  Widget _buildGhostButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;
    final radius = _getBorderRadius(skin);

    return TextButton(
      onPressed: isDisabled ? null : _handlePress,
      style: TextButton.styleFrom(
        foregroundColor: isDisabled
            ? c.txtDisabled(isDark)
            : c.primary,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return c.primary.withOpacity(0.1);
            }
            if (states.contains(WidgetState.pressed)) {
              return c.primary.withOpacity(0.2);
            }
            return null;
          },
        ),
      ),
      child: _buildChild(context),
    );
  }

  Widget _buildLinkButton(BuildContext context, bool isDisabled) {
    final skin = DaniSkin.of(context);
    final c = skin.colors;

    return TextButton(
      onPressed: isDisabled ? null : _handlePress,
      style: TextButton.styleFrom(
        foregroundColor: c.primary,
        backgroundColor: Colors.transparent,
        padding: _getPadding(),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      final skin = DaniSkin.of(context);
      final c = skin.colors;
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == ButtonVariant.default_ || variant == ButtonVariant.destructive
                ? c.btnPrimaryTxt(isDark)
                : c.primary,
          ),
        ),
      );
    }

    return child;
  }

  void _handlePress() {
    if (!isDisabled && !isLoading && onPressed != null) {
      onPressed!();
    }
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.sm:
        return 36;
      case ButtonSize.default_:
        return 44;
      case ButtonSize.lg:
        return 52;
      case ButtonSize.icon:
        return 44;
    }
  }

  double _getBorderRadius(DaniSkin skin) {
    final base = skin.shape.buttonRadius;
    switch (size) {
      case ButtonSize.sm:
        return base;
      case ButtonSize.default_:
        return base + 4;
      case ButtonSize.lg:
        return base + 8;
      case ButtonSize.icon:
        return base + 4;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacing4,
          vertical: DesignTokens.spacing2,
        );
      case ButtonSize.default_:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacing6,
          vertical: DesignTokens.spacing3,
        );
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: DesignTokens.spacing8,
          vertical: DesignTokens.spacing4,
        );
      case ButtonSize.icon:
        return const EdgeInsets.all(DesignTokens.spacing3);
    }
  }

  double _getIconSize() {
    switch (size) {
      case ButtonSize.sm:
        return 18;
      case ButtonSize.default_:
        return 20;
      case ButtonSize.lg:
        return 24;
      case ButtonSize.icon:
        return 20;
    }
  }
}
