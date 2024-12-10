part of 'search_characters_cubit.dart';

@immutable
sealed class SearchCharactersState {}

final class SearchCharactersInitial extends SearchCharactersState {}

final class DeleteSearchCharactesStates extends SearchCharactersState {}

final class LoadingSearchCharactesStates extends SearchCharactersState {}

final class CloseCharactesStates extends SearchCharactersState {}

final class LoadedSearchCharactesStates extends SearchCharactersState {
  final List<CharactersModel> characterModelList;

  LoadedSearchCharactesStates({required this.characterModelList});
}

final class ErrorSearchCharactesStates extends SearchCharactersState {
  final String message;

  ErrorSearchCharactesStates({required this.message});
}
