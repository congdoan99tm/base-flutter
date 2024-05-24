import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/helpers/export.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.height,
    required this.width,
    this.imageUrl,
    super.key,
    this.fit = BoxFit.cover,
    this.cacheH,
    this.cacheW,
    this.placeholder,
  });
  final String? imageUrl;
  final BoxFit fit;
  final double height;
  final double width;
  final double? cacheH;
  final double? cacheW;
  final Widget? placeholder;
  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const SizedBox.shrink();
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: fit,
      height: height,
      width: width,
      memCacheHeight: cacheH?.ceil() ?? (height * 2).ceil(),
      memCacheWidth: cacheW?.ceil() ?? (width * 2).ceil(),
      errorWidget: (context, url, error) => const SizedBox.shrink(),
      placeholder: (context, url) => placeholder ?? const SizedBox.shrink(),
      cacheManager: CustomCacheManager.instance,
    );
  }
}
