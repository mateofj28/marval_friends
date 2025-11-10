import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  final List<bool> _selectedFilters = [true, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Filter',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Iconsax.edit_2,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 24),
              Text(
                'Categorage',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              Text(
                'Correntiuints',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _FilterChip(
                icon: Icons.check,
                isSelected: _selectedFilters[0],
                onTap: () {
                  setState(() {
                    _selectedFilters[0] = !_selectedFilters[0];
                  });
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                icon: Iconsax.tick_square5,
                isSelected: _selectedFilters[1],
                onTap: () {
                  setState(() {
                    _selectedFilters[1] = !_selectedFilters[1];
                  });
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                icon: Iconsax.bag,
                isSelected: _selectedFilters[2],
                onTap: () {
                  setState(() {
                    _selectedFilters[2] = !_selectedFilters[2];
                  });
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                icon: Iconsax.diamonds,
                isSelected: _selectedFilters[3],
                onTap: () {
                  setState(() {
                    _selectedFilters[3] = !_selectedFilters[3];
                  });
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                icon: Iconsax.card,
                isSelected: _selectedFilters[4],
                onTap: () {
                  setState(() {
                    _selectedFilters[4] = !_selectedFilters[4];
                  });
                },
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '#F848F8',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.white : AppColors.textSecondary,
          size: 20,
        ),
      ),
    );
  }
}
