import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/l10n/app_localizations.dart';

class ReferralHeader extends StatelessWidget {
  const ReferralHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: context.surface,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: context.primaryBlue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 8),
          Text(
            context.tr('headers.referral'),
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: context.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
