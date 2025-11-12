import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/rewards_data.dart';
import '../widgets/reward_item_card.dart';

class CityRewardsPage extends StatelessWidget {
  final String cityName;

  const CityRewardsPage({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    final rewards = RewardsData.getRewardsByCity(cityName);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.primaryBlue),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    cityName,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
            // Lista de premios
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  final reward = rewards[index];
                  final isLight = index % 2 == 0;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: RewardItemCard(
                      name: reward.name,
                      price: reward.price,
                      isLight: isLight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
