import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'profile_title.dart';
import 'profile_header.dart';
import 'profile_stats_card.dart';
import 'profile_menu_item.dart';
import 'section_title.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileTitle(),
          const ProfileHeader(),
          const SizedBox(height: 24),
          const ProfileStatsCard(),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Account Settings'),
          ProfileMenuItem(
            icon: Iconsax.edit,
            title: 'Edit profile',
            onTap: () {
              // TODO: Navigate to edit profile
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.notification,
            title: 'Notification preferences',
            onTap: () {
              // TODO: Navigate to notification settings
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.shield_tick,
            title: 'Privacy settings',
            onTap: () {
              // TODO: Navigate to privacy
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.message_question,
            title: 'Help & Support',
            onTap: () {
              // TODO: Navigate to help
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.document_text,
            title: 'Terms and Conditions',
            onTap: () {
              // TODO: Navigate to terms
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: 'Logout',
            onTap: () {
              // TODO: Logout
            },
            showDivider: false,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

