import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnable = true,
    this.width,
    this.height = 48,
    this.borderRadius = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.loadingWidget,
    this.padding,
  });

  final String text;

  final VoidCallback? onPressed;

  /// loading => disable button
  final bool isLoading;

  final bool isEnable;

  final double? width;

  final double height;

  final double borderRadius;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final Widget? loadingWidget;

  final EdgeInsetsGeometry? padding;

  bool get _disabled => isLoading || !isEnable || onPressed == null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bgColor = backgroundColor ?? theme.colorScheme.primary;

    final fgColor = foregroundColor ?? theme.colorScheme.onPrimary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: _disabled ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,

          disabledBackgroundColor: bgColor.withValues(alpha: 0.5),

          disabledForegroundColor: fgColor.withValues(alpha: 0.7),

          elevation: 0,

          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),

          child: isLoading
              ? loadingWidget ??
                    SizedBox(
                      key: const ValueKey('loading'),
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: fgColor,
                      ),
                    )
              : Text(text, key: const ValueKey('text')),
        ),
      ),
    );
  }
}
