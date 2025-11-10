import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import 'custom_text_field.dart';
import 'primary_button.dart';

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final _documentController = TextEditingController();
  final _tokenController = TextEditingController();

  @override
  void dispose() {
    _documentController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // TODO: Implement login logic
    context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: _documentController,
          label: 'Ingresa Documento',
          hint: '#Ingresa Numero Documento',
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: _tokenController,
          label: 'Token',
          hint: '#bsffcimer',
          isPassword: true,
        ),
        const SizedBox(height: 40),
        PrimaryButton(
          text: 'Ingresar',
          onPressed: _handleLogin,
        ),
      ],
    );
  }
}
