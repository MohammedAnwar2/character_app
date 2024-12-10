import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:character_app/presentation/widgets/chached_image_network.dart';
import 'package:character_app/router/app_routes.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  const CharactersItem({
    super.key,
    required this.charactersModel,
  });
  final CharactersModel charactersModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.myWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.charactersDetails,
                arguments: charactersModel);
          },
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.all(8),
              color: AppColors.myGrey.withOpacity(0.5),
              child: Text(
                charactersModel.name.toString(),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.myWhite),
              ),
            ),
            child: Hero(
              tag: charactersModel.id!, // Fallback for null IDs
              child: CachedImage(imageUrl: charactersModel.image!),
            ),
          ),
        ),
      ),
    );
  }
}















// Widget _buildCharacterImage(String? imageUrl) {
//   // Check for null, empty, or invalid URL
//   if (imageUrl == null ||
//       imageUrl.isEmpty ||
//       !(Uri.tryParse(imageUrl)?.isAbsolute ?? false)) {
//     return SvgPicture.asset(
//       AppImages.emptyImage,
//       fit: BoxFit.fill,
//     );
//   }

//   // Return the network image with proper placeholder
//   return FadeInImage.assetNetwork(
//     placeholder: AppImages.placeholder,
//     fit: BoxFit.fill,
//     image: imageUrl,
//     imageErrorBuilder: (context, error, stackTrace) {
//       // Fallback to SVG if the network image fails to load
//       return SvgPicture.asset(
//         AppImages.emptyImage,
//         fit: BoxFit.fill,
//       );
//     },
//   );
// }


            // child: Hero(
            //   tag: charactersModel.id ?? 'placeholder', // Fallback for null IDs
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(8),
            //     child: _buildCharacterImage(charactersModel.image),
            //   ),
            // ),

            // child: charactersModel.image!.isNotEmpty
            //     ? Hero(
            //         tag: charactersModel.id!,
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(8),
            //           child: FadeInImage.assetNetwork(
            //               placeholder: AppImages.placeholder,
            //               fit: BoxFit.fill,
            //               image: charactersModel.image!),
            //         ),
            //       )
            //     : SvgPicture.asset(AppImages.emptyImage, fit: BoxFit.fill),