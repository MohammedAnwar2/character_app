import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
import 'package:character_app/functions/get_cross_axis_count.dart';
import 'package:character_app/functions/show_error_snack_bar.dart';
import 'package:character_app/presentation/widgets/characters_items.dart';
import 'package:character_app/presentation/widgets/empty_items_image.dart';
import 'package:flutter/material.dart';

class CharactersGridListView extends StatelessWidget {
  const CharactersGridListView({
    super.key,
    required this.charactersList,
    this.hasMore = false,
    this.loadMore,
    this.fetchAgain,
  });
  final List<CharactersModel> charactersList;
  final bool? hasMore;
  final bool? fetchAgain;
  final VoidCallback? loadMore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    if (charactersList.isNotEmpty) {
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels >=
                  scrollNotification.metrics.maxScrollExtent * .7 &&
              hasMore! &&
              scrollNotification is ScrollUpdateNotification) {
            loadMore!();
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(width),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 2.7,
              ),
              itemCount: charactersList.length,
              itemBuilder: (BuildContext context, int index) {
                return CharactersItem(charactersModel: charactersList[index]);
              },
            ),
            if (hasMore == true)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            if (fetchAgain == true)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: IconButton(
                        tooltip: "refresh",
                        onPressed: () {
                          showSuccessSnackBar(
                              context, 'Start to fetch data again');
                          loadMore!();
                        },
                        icon: const Icon(Icons.refresh,
                            color: AppColors.myWhite)),
                  ),
                ),
              )
          ],
        ),
      );
    } else {
      return EmptyItemsImage(width: width);
    }
  }
}




// class CharactersGridListView extends StatelessWidget {
//   const CharactersGridListView({
//     super.key,
//     required this.charactersList,
//     this.hasMore = false,
//     this.loadMore,
//   });
//   final List<CharactersModel> charactersList;
//   final bool? hasMore;
//   final VoidCallback? loadMore;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     int _getCrossAxisCount(double width) {
//       if (width < 600) {
//         return 2;
//       } else if (width < 800) {
//         return 3;
//       } else if (width < 1200) {
//         return 4;
//       } else if (width < 1500) {
//         return 5;
//       } else {
//         return 6;
//       }
//     }

//     if (charactersList.isNotEmpty) {
//       return NotificationListener<ScrollNotification>(
//         onNotification: (scrollNotification) {
//           if (scrollNotification.metrics.pixels ==
//                   scrollNotification.metrics.maxScrollExtent &&
//               hasMore! &&
//               scrollNotification is ScrollUpdateNotification) {
//             loadMore!();
//           }
//           return false;
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverGrid.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: _getCrossAxisCount(width),
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                   childAspectRatio: 2 / 2.7),
//               itemCount: charactersList.length + (hasMore! ? 1 : 0),
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == charactersList.length) {
//                   return Container(height: 0);
//                 }
//                 return CharactersItem(charactersModel: charactersList[index]);
//               },
//             ),
//             if (hasMore == true)
//               const SliverToBoxAdapter(
//                   child: Center(child: CircularProgressIndicator())),
//           ],
//         ),
//       );
//     } else {
//       return EmptyItemsImage(width: width);
//     }
//   }
// }



// import 'package:character_app/data/models/characters_model/CharactersModel.dart';
// import 'package:character_app/presentation/widgets/characters_items.dart';
// import 'package:character_app/presentation/widgets/empty_items_image.dart';
// import 'package:flutter/material.dart';

// class CharactersGridListView extends StatelessWidget {
//   const CharactersGridListView({
//     super.key,
//     required this.charactersList,
//     this.hasMore = false,
//     this.loadMore,
//   });
//   final List<CharactersModel> charactersList;
//   final bool? hasMore;
//   final VoidCallback? loadMore;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     return charactersList.isNotEmpty
//         ? NotificationListener<ScrollNotification>(
//             onNotification: (scrollNotification) {
//               if (scrollNotification.metrics.pixels ==
//                       scrollNotification.metrics.maxScrollExtent &&
//                   hasMore! &&
//                   scrollNotification is ScrollUpdateNotification) {
//                 loadMore!();
//               }
//               return false;
//             },
//             child: CustomScrollView(
//               slivers: [
//                 GridView.builder(
//                   padding: const EdgeInsets.all(8),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: width < 600
//                           ? 2
//                           : width < 800
//                               ? 3
//                               : width < 1200
//                                   ? 4
//                                   : width < 1500
//                                       ? 5
//                                       : 6,
//                       mainAxisSpacing: 8,
//                       crossAxisSpacing: 8,
//                       childAspectRatio: 2 / 2.7),
//                   itemCount: charactersList.length + (hasMore! ? 1 : 0),
//                   itemBuilder: (BuildContext context, int index) {
//                     if (index == charactersList.length) {
//                       return const Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Center(child: CircularProgressIndicator()),
//                       );
//                     }
//                     return CharactersItem(charactersModel: charactersList[index]);
//                   },
//                 ),
//               ],
//             ),
//           )
//         : EmptyItemsImage(width: width);
//   }
// }

// import 'package:character_app/data/models/characters_model/CharactersModel.dart';
// import 'package:character_app/presentation/widgets/characters_items.dart';
// import 'package:character_app/presentation/widgets/empty_items_image.dart';
// import 'package:flutter/material.dart';

// class CharactersGridListView extends StatelessWidget {
//   const CharactersGridListView({
//     super.key,
//     required this.charactersList,
//     this.controller,
//   });
//   final List<CharactersModel> charactersList;
//   final ScrollController? controller;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width;
//     return charactersList.isNotEmpty
//         ? GridView.builder(
//             controller: controller,
//             padding: const EdgeInsets.all(8),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: width < 600
//                     ? 2
//                     : width < 800
//                         ? 3
//                         : width < 1200
//                             ? 4
//                             : width < 1500
//                                 ? 5
//                                 : 6,
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 childAspectRatio: 2 / 2.7),
//             itemCount: charactersList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return CharactersItem(charactersModel: charactersList[index]);
//             },
//           )
//         : EmptyItemsImage(width: width);
//   }
// }
