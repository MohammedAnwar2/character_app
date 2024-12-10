import 'package:character_app/busines_login/search_caracters/search_characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gender_status_state.dart';

class GenderStatusCubit extends Cubit<GenderStatusState> {
  GenderStatusCubit()
      : super(GenderStatusState(selectedGender: '', selectedStatus: '')) {
    //* I'm using these in the Search Characters Cubit to retrieve values for filtering the search.
    selectedGender = '';
    selectedStatus = '';
  }
  late String selectedGender, selectedStatus;
  void updateGender(String gender, BuildContext context) {
    selectedGender = gender;
    final controller = context.read<SearchCharactersCubit>();
    controller.searchCharacters(
        controller.controller.text, selectedGender, selectedStatus);
    emit(state.copyWith(selectedGender: gender));
  }

  void updateStatus(String status, BuildContext context) {
    selectedStatus = status;
    final controller = context.read<SearchCharactersCubit>();
    controller.searchCharacters(
        controller.controller.text, selectedGender, selectedStatus);
    emit(state.copyWith(selectedStatus: status));
  }
}
