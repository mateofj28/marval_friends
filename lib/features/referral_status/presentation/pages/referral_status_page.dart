import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/referral_status_header.dart';
import '../widgets/marval_logo.dart';
import '../widgets/filter_chips.dart';
import '../widgets/referral_status_card.dart';

class ReferralStatusPage extends StatelessWidget {
  const ReferralStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final referrals = [
      {
        'name': 'Sin contactar',
        'status': 'in contactar',
        'code': '#004085',
        'color': AppColors.primaryBlue,
        'progress': 0.7,
      },
      {
        'name': 'Intentando contactar',
        'status': 'Cotización',
        'code': '#004952',
        'color': AppColors.primaryCyan,
        'progress': 0.5,
      },
      {
        'name': 'Cotización',
        'status': 'Opcionado',
        'code': '#004080',
        'color': Colors.red,
        'progress': 0.5,
      },
      {
        'name': 'Oacicaro',
        'status': 'Regt Statues',
        'code': '#001960',
        'color': AppColors.primaryCyan,
        'progress': 0.6,
      },
      {
        'name': 'Opcionado',
        'status': 'Sctionnado',
        'code': '#002265',
        'color': AppColors.gold,
        'progress': 0.2,
      },
      {
        'name': 'Cerrado Ganado',
        'status': 'Last Statues',
        'code': '#001085',
        'color': Colors.pink,
        'progress': 0.3,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ReferralStatusHeader(),
            Expanded(
              child: ListView(
                children: [
                  const MarvalLogo(),
                  const FilterChips(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: referrals.map((referral) {
                        return ReferralStatusCard(
                          name: referral['name'] as String,
                          status: referral['status'] as String,
                          code: referral['code'] as String,
                          statusColor: referral['color'] as Color,
                          progress: referral['progress'] as double,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

