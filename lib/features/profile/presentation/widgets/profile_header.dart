import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/widgets/tier_badge.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryBlue,
                width: 4,
              ),
            ),
            child: ClipOval(
              child: Container(
                color: AppColors.background,
                child: const Icon(
                  Iconsax.user,
                  size: 60,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Bronze Bronte',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 12),
          // Tier badges
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TierBadge(
                label: 'Bronze',
                color: AppColors.bronze,
                isActive: true,
              ),
              SizedBox(width: 8),
              TierBadge(
                label: 'Silver',
                color: AppColors.silver,
                isActive: false,
              ),
              SizedBox(width: 8),
              TierBadge(
                label: 'Gold',
                color: AppColors.gold,
                isActive: false,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.6,
              minHeight: 8,
              backgroundColor: AppColors.background,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
