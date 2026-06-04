// Card component inspired by shadcn/ui
// Provides consistent card styling with various variants
// Reads colors and radii from the active DaniSkin.

import 'package:flutter/material.dart';
import '../design_tokens.dart';
import '../../skin/dani_skin.dart';

/// Card component inspired by shadcn/ui design principles
class ShadcnCard extends StatelessWidget {
  /// The card's child widget
  final Widget child;

  /// Custom padding for the card
  final EdgeInsets? padding;

  /// Custom margin for the card
  final EdgeInsets? margin;

  /// Whether the card is clickable
  final bool isClickable;

  /// Called when the card is tapped (only if isClickable is true)
  final VoidCallback? onTap;

  /// Custom width for the card
  final double? width;

  /// Custom height for the card
  final double? height;

  /// Custom border radius for the card
  final double? borderRadius;

  /// Custom background color for the card
  final Color? backgroundColor;

  /// Custom border color for the card
  final Color? borderColor;

  /// Whether to show a border
  final bool showBorder;

  const ShadcnCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.isClickable = false,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;

    final cardColor = backgroundColor ?? c.surf(isDark);
    final borderColorValue = borderColor ?? c.brd(isDark);
    final borderRadiusValue = borderRadius ?? skin.shape.cardRadius;

    Widget cardContent = Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(DesignTokens.spacing6),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(borderRadiusValue),
        border: showBorder ? Border.all(
          color: borderColorValue,
          width: 1,
        ) : null,
        boxShadow: skin.effects.shadow(isDark, size: ShadowSize.sm),
      ),
      child: child,
    );

    if (isClickable) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadiusValue),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}

/// Card header component
class ShadcnCardHeader extends StatelessWidget {
  /// The header's child widget
  final Widget child;

  /// Custom padding for the header
  final EdgeInsets? padding;

  const ShadcnCardHeader({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.only(
        left: DesignTokens.spacing6,
        right: DesignTokens.spacing6,
        top: DesignTokens.spacing6,
        bottom: DesignTokens.spacing3,
      ),
      child: child,
    );
  }
}

/// Card title component
class ShadcnCardTitle extends StatelessWidget {
  /// The title text
  final String text;

  /// Custom text style for the title
  final TextStyle? style;

  /// Text alignment
  final TextAlign textAlign;

  const ShadcnCardTitle({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;

    return Text(
      text,
      style: style ?? TextStyle(
        fontFamily: skin.typography.headingFamily,
        fontSize: DesignTokens.textLg,
        fontWeight: DesignTokens.fontSemibold,
        color: c.txt(isDark),
      ),
      textAlign: textAlign,
    );
  }
}

/// Card description component
class ShadcnCardDescription extends StatelessWidget {
  /// The description text
  final String text;

  /// Custom text style for the description
  final TextStyle? style;

  /// Text alignment
  final TextAlign textAlign;

  const ShadcnCardDescription({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final skin = DaniSkin.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final c = skin.colors;

    return Text(
      text,
      style: style ?? TextStyle(
        fontFamily: skin.typography.bodyFamily,
        fontSize: DesignTokens.textSm,
        color: c.txtMuted(isDark),
      ),
      textAlign: textAlign,
    );
  }
}

/// Card content component
class ShadcnCardContent extends StatelessWidget {
  /// The content's child widget
  final Widget child;

  /// Custom padding for the content
  final EdgeInsets? padding;

  const ShadcnCardContent({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: DesignTokens.spacing6,
        vertical: DesignTokens.spacing3,
      ),
      child: child,
    );
  }
}

/// Card footer component
class ShadcnCardFooter extends StatelessWidget {
  /// The footer's child widget
  final Widget child;

  /// Custom padding for the footer
  final EdgeInsets? padding;

  const ShadcnCardFooter({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.only(
        left: DesignTokens.spacing6,
        right: DesignTokens.spacing6,
        top: DesignTokens.spacing3,
        bottom: DesignTokens.spacing6,
      ),
      child: child,
    );
  }
}
