import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/constants/app_images.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.charactersModel,
  });

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600, // Height of the expanded app bar
      pinned: true,
      stretch: true,
      // backgroundColor: AppColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          charactersModel.name!,
          style: const TextStyle(
              color: AppColors.myGrey,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
        background: charactersModel.image != null
            ? Hero(
                tag: charactersModel.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                      placeholder: AppImages.placeholder,
                      fit: BoxFit.fill,
                      image: charactersModel.image!),
                ),
              )
            : SvgPicture.asset(AppImages.emptyImage, fit: BoxFit.fill),
      ),
    );
  }
}
