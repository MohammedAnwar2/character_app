import 'package:character_app/busines_login/gender_status_cubit/gender_status_cubit.dart';
import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/presentation/widgets/custom_ratio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showGenderPopup(BuildContext context) {
  final cubit = context.read<GenderStatusCubit>();
  final RenderBox button = context.findRenderObject() as RenderBox;
  final offset = button.localToGlobal(Offset.zero);

  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy + button.size.height,
      offset.dx,
      0,
    ),
    items: [
      PopupMenuItem<String>(
        value: 'male',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'male',
              groupValue: state.selectedGender,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateGender(value!, context);
              },
              title: 'Male',
            );
          },
        ),
      ),
      PopupMenuItem<String>(
        value: 'female',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'female',
              groupValue: state.selectedGender,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateGender(value!, context);
              },
              title: 'Female',
            );
          },
        ),
      ),
      PopupMenuItem<String>(
        value: 'genderless',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'genderless',
              groupValue: state.selectedGender,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateGender(value!, context);
              },
              title: 'Genderless',
            );
          },
        ),
      ),
      PopupMenuItem<String>(
        value: 'unknown',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'unknown',
              groupValue: state.selectedGender,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateGender(value!, context);
              },
              title: 'Unknown',
            );
          },
        ),
      ),
      if (cubit.selectedGender.isNotEmpty)
        PopupMenuItem<String>(
          onTap: () {
            // Navigator.pop(context);
            cubit.updateGender('', context);
          },
          value: 'unknown',
          child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "remove filter",
                    style: TextStyle(
                        color: AppColors.myRed,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        cubit.updateGender('', context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.myRed,
                      ))
                ],
              );
            },
          ),
        ),
    ],
  );
}
