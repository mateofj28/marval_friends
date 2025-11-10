import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String? code;
  final bool isRead;
  final VoidCallback onTap;
  final VoidCallback onMarkAsRead;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    this.code,
    required this.isRead,
    required this.onTap,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title + time),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        onMarkAsRead();
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryCyan.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Iconsax.tick_circle,
          color: AppColors.primaryCyan,
          size: 28,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isRead ? AppColors.white : AppColors.lightCyan.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isRead
                ? AppColors.background
                : AppColors.primaryCyan.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isRead
                          ? AppColors.primaryBlue.withValues(alpha: 0.1)
                          : AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: isRead ? AppColors.primaryBlue : AppColors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                            color: AppColors.darkNavy,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (code != null) ...[
                              Text(
                                code!,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                            Text(
                              time,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Check icon
                  Icon(
                    isRead ? Iconsax.tick_circle5 : Iconsax.tick_circle,
                    color: isRead ? AppColors.textLight : AppColors.primaryCyan,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
