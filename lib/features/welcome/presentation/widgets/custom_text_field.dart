import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: isPassword,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            filled: true,
            fillColor: AppColors.buttonSecondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            labelStyle: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: GoogleFonts.poppins(
              color: AppColors.textLight.withValues(alpha: 0.5),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
