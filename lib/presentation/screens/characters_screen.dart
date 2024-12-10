// import 'package:character_app/busines_login/get_all_character_cubit/charactes_cubit.dart';
import 'package:character_app/busines_login/search_caracters/search_characters_cubit.dart';
import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/presentation/widgets/appbar/custom_search_appbar.dart';
import 'package:character_app/presentation/widgets/characters_body.dart';
import 'package:character_app/presentation/widgets/characters_search_body.dart';
import 'package:character_app/presentation/widgets/appbar/custom_normal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = BlocProvider.of<SearchCharactersCubit>(context);
    return BlocBuilder<SearchCharactersCubit, SearchCharactersState>(
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.myGrey,
          appBar: searchController.isSearch
              ? CustomSearchAppBar(
                  onClose: () {
                    searchController.closeSearch(context);
                  },
                  onDelete: () {
                    searchController.deleteSearch();
                  },
                  controller: searchController.controller,
                  onChanged: (value) {
                    searchController.onSearch(value, context);
                  },
                )
              : CustomNormalAppBar(
                  onSearch: () {
                    searchController.startSearch();
                  },
                ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (searchController.isSearch && searchController.isTyping)
                const CharacterSearchBody(),
              if (!searchController.isSearch || !searchController.isTyping)
                const CharactersBody()
            ],
          )),
        );
      },
    );
  }
}
