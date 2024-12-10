import 'package:character_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white), // Optional: Customize text color
      ),
      backgroundColor: Colors.red, // Optional: Customize SnackBar color
    ),
  );
}

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: AppColors.myGrey), // Optional: Customize text color
      ),
      backgroundColor: AppColors.myYallow, // Optional: Customize SnackBar color
    ),
  );
}
