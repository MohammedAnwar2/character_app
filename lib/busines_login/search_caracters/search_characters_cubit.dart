import 'dart:async';
import 'package:character_app/busines_login/gender_status_cubit/gender_status_cubit.dart';
import 'package:character_app/data/repository.dart/characters_repositort.dart';
import 'package:character_app/data/web_services/characters_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
part 'search_characters_state.dart';

mixin SearchCharactersVariables {
  late bool isSearch;
  late bool isTyping;
  late TextEditingController controller;
  Timer? debounce;
}

mixin SearchCharactersMethods {
  Future<void> searchCharacters([String? name]);
  void deleteSearch();
  void closeSearch(BuildContext context);
  void startSearch();
  void onSearch(String text, BuildContext context);
}

class SearchCharactersCubit extends Cubit<SearchCharactersState>
    with SearchCharactersVariables, SearchCharactersMethods {
  late CharactersRepositort charactersRepositort;

  SearchCharactersCubit() : super(SearchCharactersInitial()) {
    charactersRepositort =
        CharactersRepositort(charactersWebServices: CharactersWebServices());
    isSearch = false;
    isTyping = false;
    controller = TextEditingController();
  }

  @override
  Future<void> searchCharacters([
    String? name,
    String? gender,
    String? status,
  ]) async {
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(
      const Duration(milliseconds: 200),
      () async {
        try {
          emit(LoadingSearchCharactesStates());
          List<CharactersModel> list = await charactersRepositort
              .searchCharacters(name: name, gender: gender, status: status);
          emit(LoadedSearchCharactesStates(characterModelList: list));
        } catch (e) {
          emit(ErrorSearchCharactesStates(message: e.toString()));
        }
      },
    );
  }

  @override
  void deleteSearch() {
    isTyping = false;
    controller.clear();
    emit(DeleteSearchCharactesStates());
  }

  @override
  void closeSearch(BuildContext context) {
    context.read<GenderStatusCubit>().updateGender('', context);
    context.read<GenderStatusCubit>().updateStatus('', context);
    isTyping = false;
    isSearch = false;
    controller.clear();
    emit(CloseCharactesStates());
  }

  @override
  void startSearch() {
    isSearch = true;
    isTyping = false;
    emit(SearchCharactersInitial());
  }

  @override
  void onSearch(String text, BuildContext context) {
    isTyping = text.isNotEmpty;
    String gender = context.read<GenderStatusCubit>().selectedGender;
    String status = context.read<GenderStatusCubit>().selectedStatus;
    searchCharacters(text, gender, status);
  }

  @override
  Future<void> close() {
    controller.dispose();
    debounce?.cancel();
    return super.close();
  }
}
