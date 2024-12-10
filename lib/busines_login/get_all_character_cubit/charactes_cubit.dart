import 'package:character_app/data/repository.dart/characters_repositort.dart';
import 'package:character_app/data/web_services/characters_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:character_app/data/models/characters_model/CharactersModel.dart';
part 'charactes_state.dart';

class CharactesCubit extends Cubit<CharacterStates> {
  late CharactersRepositort charactersRepositort;
  int? maxNumberOfPages;

  CharactesCubit() : super(const CharacterStates()) {
    charactersRepositort =
        CharactersRepositort(charactersWebServices: CharactersWebServices());
    getAllCharacters();
  }

  Future<void> getMaxNumerOfPages() async {
    maxNumberOfPages = await charactersRepositort.getMaxNumberOfPages();
  }

  getAllCharacters() async {
    if (maxNumberOfPages == null) {
      await getMaxNumerOfPages();
    }
    if (state.currentPage > maxNumberOfPages!) {
      return;
    }

    try {
      if (state.status == CharactersStatus.loading) {
        List<CharactersModel> charactersList =
            await charactersRepositort.getAllCharacters();
        emit(
          state.copyWith(
              status: CharactersStatus.success,
              charactersList: charactersList,
              currentPage: state.currentPage + 1),
        );
      } else {
        try {
          List<CharactersModel> charactersList =
              await charactersRepositort.getAllCharacters(state.currentPage);
          emit(
            state.copyWith(
                fetchMore: false,
                errorMessage: "",
                status: CharactersStatus.success,
                charactersList: List.of(state.charactersList)
                  ..addAll(charactersList),
                currentPage: state.currentPage + 1),
          );
        } catch (e) {
          if (e == 'No internet') {
            emit(state.copyWith(
                fetchMore: true,
                status: CharactersStatus.paginationInternetError,
                errorMessage: e.toString(),
                currentPage: state.currentPage));
          } else {
            emit(state.copyWith(
                fetchMore: false,
                status: CharactersStatus.paginationError,
                errorMessage: e.toString(),
                currentPage: state.currentPage));
          }
        }
      }
    } catch (e) {
      if (e == 'No internet') {
        emit(state.copyWith(
            fetchMore: true,
            status: CharactersStatus.paginationInternetError,
            errorMessage: e.toString(),
            currentPage: state.currentPage));
      } else {
        emit(
          state.copyWith(
            status: CharactersStatus.error,
            errorMessage: "can't fetch the data  ${state.currentPage}",
          ),
        );
      }
    }
  }
}
