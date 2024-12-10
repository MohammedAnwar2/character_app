import 'package:character_app/busines_login/search_caracters/search_characters_cubit.dart';
import 'package:character_app/presentation/widgets/characters_grid_list_view.dart';
import 'package:character_app/presentation/widgets/my_error_widget.dart';
import 'package:character_app/presentation/widgets/my_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterSearchBody extends StatelessWidget {
  const CharacterSearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCharactersCubit, SearchCharactersState>(
      builder: (context, state) {
        if (state is LoadedSearchCharactesStates) {
          return Expanded(
            child: CharactersGridListView(
                charactersList: state.characterModelList),
          );
        } else if (state is ErrorSearchCharactesStates) {
          return MyErrorWidget(text: state.message);
        } else {
          return const Expanded(child: MyLoadingWidget());
        }
      },
    );
  }
}
