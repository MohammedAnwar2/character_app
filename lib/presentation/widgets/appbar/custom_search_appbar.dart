import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/presentation/widgets/custom_text_form_faild.dart';
import 'package:character_app/presentation/widgets/popup_menu/popup_menu_filter.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? hint;
  final Color backgroundColor;
  final void Function(String) onChanged;
  final void Function()? onClose;
  final void Function()? onDelete;
  final TextEditingController controller;
  const CustomSearchAppBar({
    super.key,
    this.hint = "Find a character...",
    this.backgroundColor = AppColors.myYallow,
    required this.onChanged,
    this.onClose,
    this.onDelete,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.myYallow,
      title: CustomTextFormSearch(
        hint: hint,
        controller: controller,
        onChanged: onChanged,
      ),
      leading: IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.arrow_back, color: AppColors.myGrey)),
      actions: [
        IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.close, color: AppColors.myGrey)),
        const PopUpMenu()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
