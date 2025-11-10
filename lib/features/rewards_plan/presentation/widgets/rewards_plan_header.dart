import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class RewardsPlanHeader extends StatelessWidget {
  const RewardsPlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Plan de premios',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Navigate to notifications
            },
            icon: const Icon(Iconsax.notification),
            color: AppColors.primaryBlue,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
