import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/referral_header.dart';
import '../widgets/referral_dropdown.dart';
import '../widgets/referral_text_field.dart';
import '../widgets/referral_question.dart';
import '../widgets/submit_button.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedName;
  bool _wantsPedroAttention = false;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitReferral() {
    // TODO: Implement referral submission
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReferralHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ReferralDropdown(
                      value: _selectedName,
                      hint: 'Nombre completo',
                      items: const [
                        'Juan Pérez',
                        'María García',
                        'Carlos López',
                        'Ana Martínez',
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedName = value;
                        });
                      },
                    ),
                    ReferralTextField(
                      controller: _idController,
                      hint: 'Numero de cédula',
                      keyboardType: TextInputType.number,
                    ),
                    ReferralTextField(
                      controller: _emailController,
                      hint: 'Correo electrónico',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ReferralTextField(
                      controller: _phoneController,
                      hint: 'Teléfono',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    ReferralQuestion(
                      question:
                          '¿Deseas que Pedro también\natienda a tu amigo?',
                      value: _wantsPedroAttention,
                      onChanged: (value) {
                        setState(() {
                          _wantsPedroAttention = value;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    SubmitButton(
                      text: 'Enviar referido',
                      onPressed: _submitReferral,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

