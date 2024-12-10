import 'package:character_app/busines_login/gender_status_cubit/gender_status_cubit.dart';
import 'package:character_app/presentation/widgets/popup_menu/show_gender_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_status_popup_menu.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            showGenderPopup(context); // Show Gender PopupMenu
          },
          child: const Text(
            "Gender",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            showStatusPopup(context); // Show Status PopupMenu
          },
          child: const Text(
            "Status",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      child: BlocBuilder<GenderStatusCubit, GenderStatusState>(
        builder: (context, state) {
          return IconButton(
            disabledColor: Colors.black,
            onPressed: null,
            icon: state.selectedGender.isNotEmpty ||
                    state.selectedStatus.isNotEmpty
                ? const Icon(Icons.filter_alt)
                : const Icon(Icons.filter_alt_outlined),
          );
        },
      ),
    );
  }
}
