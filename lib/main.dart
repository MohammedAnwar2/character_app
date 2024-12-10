import 'package:character_app/busines_login/search_caracters/search_characters_cubit.dart';
import 'package:character_app/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'busines_login/gender_status_cubit/gender_status_cubit.dart';
import 'busines_login/get_all_character_cubit/charactes_cubit.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidg)
  // };
  runApp(const CharacterApp());
}

class CharacterApp extends StatelessWidget {
  const CharacterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //*---->GenderStatusCubit
        BlocProvider(create: (context) => GenderStatusCubit()),
        //*---->CharactesCubit
        BlocProvider<CharactesCubit>(create: (context) => CharactesCubit()),
        //*---->SearchCharactersCubit
        BlocProvider<SearchCharactersCubit>(
            create: (context) => SearchCharactersCubit()),
      ],
      child: MaterialApp(
        title: "Characters App",
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
