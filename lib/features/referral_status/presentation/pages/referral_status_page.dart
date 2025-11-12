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
        'name': '¡Gracias por registrar a tu amigo!',
        'status': 'Sin Contactar',
        'color': const Color(0xFF004952),
        'progress': 0.2,
      },
      {
        'name': '¡Nos estamos poniendo en contacto con tu amigo!',
        'status': 'Intentando Contactar',
        'color': const Color(0xFF2196F3),
        'progress': 0.4,
      },
      {
        'name': '¡Tu amigo ya cotizó su vivienda!',
        'status': 'Cotización',
        'color': const Color(0xFFFFA726),
        'progress': 0.6,
      },
      {
        'name': '¡Tu amigo está a un paso de convertirse en un Amigo Marval!',
        'status': 'Opcionado',
        'color': const Color(0xFF9C27B0),
        'progress': 0.8,
      },
      {
        'name': '¡Felicidades, has ganado!',
        'status': 'Cerrado Ganado',
        'color': const Color(0xFF4CAF50),
        'progress': 1.0,
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

