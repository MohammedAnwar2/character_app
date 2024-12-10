import 'package:character_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.value,
  });
  final String text, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: Text.rich(TextSpan(
          style: const TextStyle(
              color: AppColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          children: [
            TextSpan(text: "$text : "),
            TextSpan(
                text: value,
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: AppColors.myWhite.withOpacity(0.8)))
          ])),
    );
  }
}
