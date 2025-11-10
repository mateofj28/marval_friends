import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class TierTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const TierTabs({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _TierTab(
            label: 'User',
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          const SizedBox(width: 24),
          _TierTab(
            label: 'Bronz',
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          const SizedBox(width: 24),
          _TierTab(
            label: 'Silver',
            isSelected: selectedIndex == 2,
            onTap: () => onTap(2),
          ),
          const SizedBox(width: 24),
          _TierTab(
            label: 'Gold',
            isSelected: selectedIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _TierTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TierTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.darkNavy : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryBlue : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
