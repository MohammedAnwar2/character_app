import 'package:character_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormSearch extends StatelessWidget {
  const CustomTextFormSearch(
      {super.key,
      required this.controller,
      required this.onChanged,
      this.hint});
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.myGrey,
      style: const TextStyle(
          color: AppColors.myGrey, fontSize: 16, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(
            color: AppColors.myGrey, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
