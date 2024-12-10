import 'package:character_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String placeholderAsset;
  final String errorAsset;
  final BorderRadius? borderRadius;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.placeholderAsset = AppImages.placeholder,
    this.errorAsset = AppImages.emptyImage,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Center(
          child: Image.asset(
            placeholderAsset,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: SvgPicture.asset(
            errorAsset,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
