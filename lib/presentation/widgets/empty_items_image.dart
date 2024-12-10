import 'package:character_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyItemsImage extends StatelessWidget {
  const EmptyItemsImage({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 300, maxHeight: 300, minWidth: 100, minHeight: 100),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SvgPicture.asset(
              AppImages.emptyItems,
            ),
          ),
        ),
      ),
    );
  }
}
