import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/rewards_plan_header.dart';
import '../widgets/filter_section.dart';
import '../widgets/tier_tabs.dart';
import '../widgets/reward_card.dart';

class RewardsPlanPage extends StatefulWidget {
  const RewardsPlanPage({super.key});

  @override
  State<RewardsPlanPage> createState() => _RewardsPlanPageState();
}

class _RewardsPlanPageState extends State<RewardsPlanPage> {
  int _selectedTierIndex = 0;

  final List<Map<String, String>> _rewards = [
    {'image': '🏠', 'title': 'Branze', 'code': '#F00-0885'},
    {'image': '🏘️', 'title': 'Silver', 'code': '#rF00-0285'},
    {'image': '💼', 'title': 'Canjear', 'code': '#F00-0385'},
    {'image': '🛡️', 'title': 'Marma Cane', 'code': '#F00-0885'},
    {'image': '🧴', 'title': 'Yharn', 'code': '#F00-0285'},
    {'image': '🏆', 'title': 'Retkingro', 'code': '#F00-0885'},
    {'image': '📦', 'title': 'Bronbo', 'code': '#F00-0885'},
    {'image': '🖥️', 'title': 'Silver', 'code': '#rF00-0285'},
    {'image': '🤖', 'title': 'Polld', 'code': '#F00-0885'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RewardsPlanHeader(),
            const FilterSection(),
            const SizedBox(height: 20),
            TierTabs(
              selectedIndex: _selectedTierIndex,
              onTap: (index) {
                setState(() {
                  _selectedTierIndex = index;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.64,
                  ),
                  itemCount: _rewards.length,
                  itemBuilder: (context, index) {
                    final reward = _rewards[index];
                    return RewardCard(
                      image: reward['image']!,
                      title: reward['title']!,
                      code: reward['code']!,
                      onRedeem: () {
                        // TODO: Implement redeem logic
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
