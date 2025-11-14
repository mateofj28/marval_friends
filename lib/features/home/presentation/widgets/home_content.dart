import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/menu_card.dart';
import '../../../referral/presentation/pages/referral_page.dart';
import '../../../referral_status/presentation/pages/referral_status_page.dart';
import '../../../rewards/presentation/pages/rewards_page.dart';
import '../../../rewards_plan/presentation/pages/rewards_plan_page.dart';

class HomeContent extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeContent({
    super.key,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfileCard(onTap: onProfileTap),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MenuCard(
                  icon: Iconsax.user_add,
                  title: context.tr('home.refer'),
                  subtitle: context.tr('home.refer_subtitle'),
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.chart,
                  title: context.tr('home.referral_status'),
                  subtitle: context.tr('home.referral_status_subtitle'),
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralStatusPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.gift,
                  title: context.tr('home.redeem_prizes'),
                  subtitle: context.tr('home.redeem_prizes_subtitle'),
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const RewardsPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.cup,
                  title: context.tr('home.rewards_plan'),
                  subtitle: context.tr('home.rewards_plan_subtitle'),
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const RewardsPlanPage(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
