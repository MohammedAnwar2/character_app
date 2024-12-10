import 'package:character_app/presentation/screens/characters_details_screen.dart';
import 'package:character_app/presentation/screens/characters_screen.dart';
import 'package:character_app/router/app_routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext context)>{
  AppRoutes.characters: (context) => const CharactersScreen(),
  AppRoutes.charactersDetails: (context) => const CharactersDetailsScreen(),
};

// import 'package:character_app/busines_login/get_all_character_cubit/charactes_cubit.dart';
// import 'package:character_app/busines_login/search_caracters/search_characters_cubit.dart';
// import 'package:character_app/data/repository.dart/characters_repositort.dart';
// import 'package:character_app/data/web_services/characters_web_services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   // late CharactersRepositort charactersRepositort;
//   // late CharactesCubit charactesCubit;
//   // late SearchCharactersCubit searchCharactesCubit;

//   AppRouter() {
//     // charactersRepositort =
//     //     CharactersRepositort(charactersWebServices: CharactersWebServices());
//     // charactesCubit = CharactesCubit(charactersRepositort);
//     // searchCharactesCubit = SearchCharactersCubit(charactersRepositort);
//   }

//   Route<dynamic>? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutes.characters:
//         return MaterialPageRoute(
//           builder: (context) => const CharactersScreen(),
//         );
//       case AppRoutes.charactersDetails:
//         return MaterialPageRoute(
//             builder: (context) => const CharactersDetailsScreen());

//       default:
//         return MaterialPageRoute(
//             builder: (context) => Scaffold(
//                   appBar: AppBar(title: const Text('Error')),
//                   body: const Center(child: Text('Page not found')),
//                 ));
//     }
//   }
// }
