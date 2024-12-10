import 'package:character_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNormalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;

  const CustomNormalAppBar({
    super.key,
    this.title = 'Characters',
    this.backgroundColor = AppColors.myYallow,
    this.onSearch,
  });
  final void Function()? onSearch;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColors.myGrey,
        ),
      ),
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: onSearch,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
