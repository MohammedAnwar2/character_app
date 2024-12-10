import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:character_app/presentation/widgets/character_details_body.dart';
import 'package:character_app/presentation/widgets/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CharactersModel charactersModel =
        ModalRoute.of(context)?.settings.arguments as CharactersModel;
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(charactersModel: charactersModel),
          SliverToBoxAdapter(
              child: CharactersDetailsBody(charactersModel: charactersModel)),
        ],
      ),
    );
  }
}
