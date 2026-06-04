// Input component inspired by shadcn/ui
// Provides consistent input styling with various variants

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design_tokens.dart';

/// Input component inspired by shadcn/ui design principles
class ShadcnInput extends StatefulWidget {
  /// The input controller
  final TextEditingController? controller;
  
  /// The input value
  final String? value;
  
  /// Called when the input value changes
  final ValueChanged<String>? onChanged;
  
  /// Called when the input is submitted
  final ValueChanged<String>? onSubmitted;
  
  /// The placeholder text
  final String? placeholder;
  
  /// The label text
  final String? label;
  
  /// The helper text
  final String? helperText;
  
  /// The error text
  final String? errorText;
  
  /// Whether the input is disabled
  final bool isDisabled;
  
  /// Whether the input is read-only
  final bool isReadOnly;
  
  /// Whether the input is required
  final bool isRequired;
  
  /// The input type
  final TextInputType? keyboardType;
  
  /// The input formatters
  final List<TextInputFormatter>? inputFormatters;
  
  /// The maximum number of lines
  final int? maxLines;
  
  /// The minimum number of lines
  final int? minLines;
  
  /// The maximum length of the input
  final int? maxLength;
  
  /// Whether to obscure the text (for passwords)
  final bool obscureText;
  
  /// The text alignment
  final TextAlign textAlign;
  
  /// The text direction
  final TextDirection? textDirection;
  
  /// Custom width for the input
  final double? width;
  
  /// Custom height for the input
  final double? height;
  
  /// Custom padding for the input
  final EdgeInsets? padding;
  
  /// Custom border radius for the input
  final double? borderRadius;
  
  /// Custom background color for the input
  final Color? backgroundColor;
  
  /// Custom border color for the input
  final Color? borderColor;
  
  /// Custom focus border color for the input
  final Color? focusBorderColor;
  
  /// Custom error border color for the input
  final Color? errorBorderColor;
  
  /// Custom text style for the input
  final TextStyle? textStyle;
  
  /// Custom hint text style for the input
  final TextStyle? hintStyle;
  
  /// Custom label text style for the input
  final TextStyle? labelStyle;
  
  /// Custom helper text style for the input
  final TextStyle? helperStyle;
  
  /// Custom error text style for the input
  final TextStyle? errorStyle;
  
  /// The prefix widget
  final Widget? prefix;
  
  /// The suffix widget
  final Widget? suffix;
  
  /// The prefix icon
  final IconData? prefixIcon;
  
  /// The suffix icon
  final IconData? suffixIcon;
  
  /// Called when the input gains focus
  final VoidCallback? onFocus;
  
  /// Called when the input loses focus
  final VoidCallback? onBlur;
  
  /// The focus node
  final FocusNode? focusNode;
  
  /// Whether to show the character count
  final bool showCharacterCount;
  
  /// Whether to show the clear button
  final bool showClearButton;
  
  /// Called when the clear button is pressed
  final VoidCallback? onClear;

  const ShadcnInput({
    super.key,
    this.controller,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.placeholder,
    this.label,
    this.helperText,
    this.errorText,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.errorStyle,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.onFocus,
    this.onBlur,
    this.focusNode,
    this.showCharacterCount = false,
    this.showClearButton = false,
    this.onClear,
  });

  @override
  State<ShadcnInput> createState() => _ShadcnInputState();
}

class _ShadcnInputState extends State<ShadcnInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
    
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(ShadcnInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
    
    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode.removeListener(_onFocusChange);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_onFocusChange);
    }
    
    if (widget.value != oldWidget.value && widget.value != null) {
      _controller.text = widget.value!;
    }
    
    if (widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus != _isFocused) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
      
      if (_isFocused) {
        widget.onFocus?.call();
      } else {
        widget.onBlur?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final isDisabled = widget.isDisabled;
    final isReadOnly = widget.isReadOnly;
    
    final backgroundColor = widget.backgroundColor ?? 
        (isDark ? DesignTokens.backgroundDark : DesignTokens.background);
    final borderColor = hasError 
        ? (widget.errorBorderColor ?? DesignTokens.destructive)
        : (_isFocused 
            ? (widget.focusBorderColor ?? DesignTokens.ring)
            : (widget.borderColor ?? (isDark ? DesignTokens.inputDark : DesignTokens.input)));
    
    final borderRadius = widget.borderRadius ?? DesignTokens.radius;
    final padding = widget.padding ?? const EdgeInsets.symmetric(
      horizontal: DesignTokens.spacing3,
      vertical: DesignTokens.spacing2,
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Text(
            widget.label! + (widget.isRequired ? ' *' : ''),
            style: widget.labelStyle ?? TextStyle(
              fontSize: DesignTokens.textSm,
              fontWeight: DesignTokens.fontMedium,
              color: isDark ? DesignTokens.foregroundDark : DesignTokens.foreground,
            ),
          ),
          const SizedBox(height: DesignTokens.spacing2),
        ],
        
        // Input field
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            obscureText: _obscureText,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            enabled: !isDisabled,
            readOnly: isReadOnly,
            style: widget.textStyle ?? TextStyle(
              fontSize: DesignTokens.textSm,
              color: isDark ? DesignTokens.foregroundDark : DesignTokens.foreground,
            ),
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: widget.hintStyle ?? TextStyle(
                fontSize: DesignTokens.textSm,
                color: isDark ? DesignTokens.mutedForegroundDark : DesignTokens.mutedForeground,
              ),
              filled: true,
              fillColor: backgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: hasError 
                      ? (widget.errorBorderColor ?? DesignTokens.destructive)
                      : (widget.focusBorderColor ?? DesignTokens.ring),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: widget.errorBorderColor ?? DesignTokens.destructive,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: widget.errorBorderColor ?? DesignTokens.destructive,
                  width: 2,
                ),
              ),
              contentPadding: padding,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon != null 
                  ? Icon(
                      widget.prefixIcon,
                      size: 20,
                      color: isDark ? DesignTokens.mutedForegroundDark : DesignTokens.mutedForeground,
                    )
                  : null,
              suffix: widget.suffix ?? _buildSuffix(),
              suffixIcon: widget.suffixIcon != null 
                  ? Icon(
                      widget.suffixIcon,
                      size: 20,
                      color: isDark ? DesignTokens.mutedForegroundDark : DesignTokens.mutedForeground,
                    )
                  : null,
              counterText: widget.showCharacterCount ? null : '',
            ),
          ),
        ),
        
        // Helper text or error text
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: DesignTokens.spacing1),
          Text(
            hasError ? widget.errorText! : widget.helperText!,
            style: (hasError ? widget.errorStyle : widget.helperStyle) ?? TextStyle(
              fontSize: DesignTokens.textXs,
              color: hasError 
                  ? DesignTokens.destructive
                  : (isDark ? DesignTokens.mutedForegroundDark : DesignTokens.mutedForeground),
            ),
          ),
        ],
      ],
    );
  }

  Widget? _buildSuffix() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      );
    }
    
    if (widget.showClearButton && _controller.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.clear, size: 20),
        onPressed: () {
          _controller.clear();
          widget.onChanged?.call('');
          widget.onClear?.call();
        },
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      );
    }
    
    return null;
  }
}
