import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/auth/data/datasources/user_storage.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../settings/presentation/pages/theme_settings_page.dart';
import '../pages/terms_conditions_page.dart';
import 'profile_title.dart';
import 'profile_header.dart';
import 'profile_stats_card.dart';
import 'profile_menu_item.dart';
import 'section_title.dart';
import 'language_selector.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    // Mostrar diálogo de confirmación
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.tr('profile.logout_title')),
        content: Text(context.tr('profile.logout_message')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(context.tr('common.cancel')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(context.tr('profile.logout')),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      // Limpiar datos del usuario
      final userStorage = getIt<UserStorage>();
      await userStorage.clearUser();
      
      // Navegar a welcome
      if (context.mounted) {
        context.go(AppRouter.welcome);
      }
    }
  }

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
          const LanguageSelector(),
          const SizedBox(height: 24),
          SectionTitle(title: context.tr('profile.account_settings')),
          ProfileMenuItem(
            icon: Iconsax.brush_2,
            title: context.tr('profile.appearance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeSettingsPage(),
                ),
              );
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.document_text,
            title: context.tr('profile.terms_conditions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsConditionsPage(),
                ),
              );
            },
          ),
          ProfileMenuItem(
            icon: Iconsax.logout,
            title: context.tr('profile.logout'),
            onTap: () => _handleLogout(context),
            showDivider: false,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

