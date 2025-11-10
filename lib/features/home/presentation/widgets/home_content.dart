import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/menu_card.dart';
import '../../../referral/presentation/pages/referral_page.dart';
import '../../../referral_status/presentation/pages/referral_status_page.dart';
import '../../../rewards/presentation/pages/rewards_page.dart';
import '../../../rewards_plan/presentation/pages/rewards_plan_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserProfileCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                MenuCard(
                  icon: Iconsax.user_add,
                  title: 'Referir',
                  subtitle: 'Referer Friend',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralPage(),
                  ),
                  showBorder: true,
                ),
                MenuCard(
                  icon: Iconsax.chart,
                  title: 'Estado de mis referidos',
                  subtitle: 'Status of yor refenlals',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const ReferralStatusPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.gift,
                  title: 'Redimir premios',
                  subtitle: 'Redeemb Rewards',
                  onTap: () => NavigationHelper.navigateWithSlideAnimation(
                    context,
                    const RewardsPage(),
                  ),
                ),
                MenuCard(
                  icon: Iconsax.cup,
                  title: 'Plan de premios',
                  subtitle: 'Eewards plan',
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
