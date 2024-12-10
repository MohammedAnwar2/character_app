part of 'charactes_cubit.dart';

enum CharactersStatus {
  loading,
  success,
  paginationError,
  paginationInternetError,
  error
}

@immutable
class CharacterStates {
  final CharactersStatus status;
  final List<CharactersModel> charactersList;
  final int currentPage;
  final String errorMessage;
  final bool fetchMore;

  const CharacterStates({
    this.fetchMore = false,
    this.currentPage = 1,
    this.status = CharactersStatus.loading,
    this.charactersList = const [],
    this.errorMessage = '',
  });

  CharacterStates copyWith({
    bool? fetchMore,
    CharactersStatus? status,
    List<CharactersModel>? charactersList,
    int? currentPage,
    String? errorMessage,
  }) {
    return CharacterStates(
      fetchMore: fetchMore ?? this.fetchMore,
      currentPage: currentPage ?? this.currentPage,
      status: status ?? this.status,
      charactersList: charactersList ?? this.charactersList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// sealed class CharactesState {}

// final class LoadingCharactesStates extends CharactesState {}

// final class LoadedCharactesStates extends CharactesState {
//   final List<CharactersModel> characterModelList;

//   LoadedCharactesStates({required this.characterModelList});
// }

// final class ErrorCharactesStates extends CharactesState {
//   final String message;

//   ErrorCharactesStates({required this.message});
// }
