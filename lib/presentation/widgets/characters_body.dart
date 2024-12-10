import 'package:character_app/busines_login/get_all_character_cubit/charactes_cubit.dart';
import 'package:character_app/functions/show_error_snack_bar.dart';
import 'package:character_app/presentation/widgets/characters_grid_list_view.dart';
import 'package:character_app/presentation/widgets/my_error_widget.dart';
import 'package:character_app/presentation/widgets/my_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersBody extends StatelessWidget {
  const CharactersBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CharactesCubit>();
    bool loading = true;
    bool loading2 = true;
    return BlocConsumer<CharactesCubit, CharacterStates>(
      listener: (context, state) async {
        if ((state.status == CharactersStatus.paginationError ||
                state.status == CharactersStatus.paginationInternetError) &&
            loading) {
          loading = false;
          showErrorSnackBar(context, 'An error occurred while fetching data!');
          await controller.getAllCharacters();
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case CharactersStatus.loading:
            return const Expanded(child: MyLoadingWidget());
          case CharactersStatus.success ||
                CharactersStatus.paginationError ||
                CharactersStatus.paginationInternetError:
            return Expanded(
              child: CharactersGridListView(
                  loadMore: () async {
                    if (loading2) {
                      loading2 = false;
                      await controller.getAllCharacters();
                      loading2 = true;
                    }
                  },
                  fetchAgain: state.fetchMore,
                  hasMore: state.currentPage <= controller.maxNumberOfPages! &&
                      state.errorMessage.isEmpty,
                  charactersList: state.charactersList),
            );
          case CharactersStatus.error:
            return MyErrorWidget(text: state.errorMessage);
        }
      },
    );
  }
}



// import 'dart:async';

// import 'package:character_app/busines_login/get_all_character_cubit/charactes_cubit.dart';
// import 'package:character_app/presentation/widgets/characters_grid_list_view.dart';
// import 'package:character_app/presentation/widgets/my_error_widget.dart';
// import 'package:character_app/presentation/widgets/my_loading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CharactersBody extends StatefulWidget {
//   const CharactersBody({
//     super.key,
//   });

//   @override
//   State<CharactersBody> createState() => _CharactersBodyState();
// }

// class _CharactersBodyState extends State<CharactersBody> {
//   late ScrollController _scrollcontroller;

//   bool isLoading = false;
//   @override
//   void initState() {
//     _scrollcontroller = ScrollController();
//     _scrollcontroller.addListener(_scroll);
//     super.initState();
//   }

//   _scroll() async {
//     final maxScroll = _scrollcontroller.position.maxScrollExtent;
//     final currentScroll = _scrollcontroller.offset;
//     if (currentScroll >= maxScroll * .8) {
//       if (!isLoading) {
//         isLoading = true;

//         await context.read<CharactesCubit>().getAllCharacters();

//         isLoading = false;
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _scrollcontroller
//       ..removeListener(_scroll)
//       ..dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharactesCubit, CharacterStates>(
//       builder: (context, state) {
//         switch (state.status) {
//           case CharactersStatus.loading:
//             return const Expanded(child: MyLoadingWidget());
//           case CharactersStatus.success:
//             return Expanded(
//                 child: CharactersGridListView(
//                     controller: _scrollcontroller,
//                     charactersList: state.charactersList));
//           case CharactersStatus.error:
//             return MyErrorWidget(text: state.errorMessage);
//           case CharactersStatus.paginationError:
//             return MyErrorWidget(text: state.errorMessage);
//         }
//       },
//     );
//   }
// }
