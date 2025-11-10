import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class FloatingChatButton extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingChatButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: AppColors.white,
      elevation: 4,
      child: const Icon(
        Iconsax.message,
        color: AppColors.darkNavy,
        size: 28,
      ),
    );
  }
}
