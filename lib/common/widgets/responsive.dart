import 'package:base_flutter_2/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.mobile, this.tablet});

  final Widget mobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    if (context.isTablet) {
      return tablet ?? mobile;
    }

    return mobile;
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({
    super.key,
    required this.child,
    this.mobileHorizontalPadding = 16,
    this.tabletHorizontalPadding = 24,
    this.maxMobileWidth = 360,
    this.maxTabletWidth = 520,
  });

  final Widget child;

  final double mobileHorizontalPadding;
  final double tabletHorizontalPadding;

  final double maxMobileWidth;
  final double maxTabletWidth;

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablet;

    final horizontalPadding = isTablet
        ? tabletHorizontalPadding
        : mobileHorizontalPadding;

    final maxWidth = isTablet ? maxTabletWidth : maxMobileWidth;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: child,
        ),
      ),
    );
  }
}
