import 'package:character_app/constants/app_colors.dart';
import 'package:character_app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppImages.error),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.myYallow),
          ),
        ],
      ),
    );
  }
}
