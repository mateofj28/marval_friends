import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationsHeader extends StatelessWidget {
  final VoidCallback onMarkAllAsRead;

  const NotificationsHeader({
    super.key,
    required this.onMarkAllAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notificaciones',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          IconButton(
            onPressed: onMarkAllAsRead,
            icon: const Icon(Iconsax.tick_square),
            color: AppColors.primaryCyan,
            iconSize: 28,
            tooltip: 'Marcar todas como leídas',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryCyan.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
