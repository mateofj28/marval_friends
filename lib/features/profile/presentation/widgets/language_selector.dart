import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/l10n/l10n_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final l10nProvider = context.watch<L10nProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: context.primaryBlue,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Idioma / Language',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.darkNavy,
              ),
            ),
          ),
          _LanguageButton(
            label: 'ES',
            isSelected: l10nProvider.isSpanish,
            onTap: () => l10nProvider.setLocale(const Locale('es', '')),
          ),
          const SizedBox(width: 8),
          _LanguageButton(
            label: 'EN',
            isSelected: l10nProvider.isEnglish,
            onTap: () => l10nProvider.setLocale(const Locale('en', '')),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? context.primaryBlue
              : context.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? context.primaryBlue
                : context.textLight,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? context.surface : context.textSecondary,
          ),
        ),
      ),
    );
  }
}
