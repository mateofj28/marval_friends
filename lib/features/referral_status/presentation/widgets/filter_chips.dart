import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChip(
              label: 'Filter Sortt',
              isSelected: true,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _FilterChip(
              label: 'Filter Sut',
              isSelected: false,
              showDropdown: true,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _FilterChip(
              label: 'Eooter Rtsort',
              isSelected: false,
              showDropdown: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool showDropdown;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    this.showDropdown = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : AppColors.background,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ),
            if (showDropdown) ...[
              const SizedBox(width: 8),
              Icon(
                Iconsax.arrow_down_1,
                size: 16,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
