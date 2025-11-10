import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class ReferralDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final Function(String?) onChanged;

  const ReferralDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.background,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              hint,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.textLight,
              ),
            ),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Iconsax.arrow_down_1,
              color: AppColors.textSecondary,
            ),
          ),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
