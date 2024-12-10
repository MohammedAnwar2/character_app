part of 'gender_status_cubit.dart';

class GenderStatusState {
  final String selectedGender;
  final String selectedStatus;

  GenderStatusState({
    required this.selectedGender,
    required this.selectedStatus,
  });

  GenderStatusState copyWith({
    String? selectedGender,
    String? selectedStatus,
  }) {
    return GenderStatusState(
      selectedGender: selectedGender ?? this.selectedGender,
      selectedStatus: selectedStatus ?? this.selectedStatus,
    );
  }
}
