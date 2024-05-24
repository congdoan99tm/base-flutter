/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// Directory path: assets/svgs/bottom_bar
  $AssetsSvgsBottomBarGen get bottomBar => const $AssetsSvgsBottomBarGen();
}

class $AssetsSvgsBottomBarGen {
  const $AssetsSvgsBottomBarGen();

  /// File path: assets/svgs/bottom_bar/account.svg
  SvgGenImage get account =>
      const SvgGenImage('assets/svgs/bottom_bar/account.svg');

  /// File path: assets/svgs/bottom_bar/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svgs/bottom_bar/home.svg');

  /// File path: assets/svgs/bottom_bar/news.svg
  SvgGenImage get news => const SvgGenImage('assets/svgs/bottom_bar/news.svg');

  /// File path: assets/svgs/bottom_bar/report.svg
  SvgGenImage get report =>
      const SvgGenImage('assets/svgs/bottom_bar/report.svg');

  /// List of all assets
  List<SvgGenImage> get values => [account, home, news, report];
}

class Assets {
  Assets._();

  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
