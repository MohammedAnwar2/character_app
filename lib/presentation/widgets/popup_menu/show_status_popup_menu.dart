import 'package:character_app/busines_login/gender_status_cubit/gender_status_cubit.dart';
import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/presentation/widgets/custom_ratio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showStatusPopup(BuildContext context) {
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
        value: 'alive',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'alive',
              groupValue: state.selectedStatus,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateStatus(value!, context);
              },
              title: 'Alive',
            );
          },
        ),
      ),
      PopupMenuItem<String>(
        value: 'dead',
        child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
          builder: (context, state) {
            return CustomRadioTile(
              value: 'dead',
              groupValue: state.selectedStatus,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateStatus(value!, context);
              },
              title: 'Dead',
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
              groupValue: state.selectedStatus,
              onChanged: (value) {
                Navigator.pop(context);
                cubit.updateStatus(value!, context);
              },
              title: 'Unknown',
            );
          },
        ),
      ),
      if (cubit.selectedStatus.isNotEmpty)
        PopupMenuItem<String>(
          onTap: () {
            cubit.updateStatus('', context);
          },
          child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
            builder: (context, _) {
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
                        cubit.updateStatus('', context);
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
