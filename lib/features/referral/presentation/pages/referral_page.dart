import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../widgets/referral_header.dart';
import '../widgets/referral_text_field.dart';
import '../widgets/referral_question.dart';
import '../widgets/submit_button.dart';
import '../../domain/models/referral.dart';
import '../../data/providers/referral_provider.dart';

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

  bool _wantsCarolinaAttention = false;

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitReferral() {
    // Validar que los campos no esten vacios
    if (_nameController.text.trim().isEmpty ||
        _idController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.tr('referral.validation_error'),
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Crear el referido
    final referral = Referral(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      cedula: _idController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      status: context.tr('referral_status.no_contact'),
      message: context.tr('referral.success_message', params: {'name': _nameController.text.trim()}),
      createdAt: DateTime.now(),
    );

    // Guardar en el provider
    context.read<ReferralProvider>().addReferral(referral);

    // Mostrar dialog de exito
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 64,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.tr('referral.success_title'),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    referral.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: context.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(context.tr('referral.cedula'), referral.cedula),
                  _buildInfoRow(context.tr('referral.email'), referral.email),
                  _buildInfoRow(context.tr('referral.phone'), referral.phone),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${context.tr('referral.status')}: ${referral.status}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar dialog
              Navigator.pop(context); // Volver a home
            },
            child: Text(
              context.tr('common.ok'),
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: context.textSecondary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: context.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
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
                    ReferralTextField(
                      controller: _nameController,
                      hint: context.tr('referral.full_name'),
                      keyboardType: TextInputType.name,
                    ),
                    ReferralTextField(
                      controller: _idController,
                      hint: context.tr('referral.id_number'),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                    ReferralTextField(
                      controller: _emailController,
                      hint: context.tr('referral.email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ReferralTextField(
                      controller: _phoneController,
                      hint: context.tr('referral.phone'),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                    const SizedBox(height: 20),
                    ReferralQuestion(
                      question: context.tr('referral.carolina_question'),
                      value: _wantsCarolinaAttention,
                      onChanged: (value) {
                        setState(() {
                          _wantsCarolinaAttention = value;
                        });
                      },
                      yesText: context.tr('referral.yes'),
                      noText: context.tr('referral.no'),
                    ),
                    const SizedBox(height: 40),
                    SubmitButton(
                      text: context.tr('referral.submit'),
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

