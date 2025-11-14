import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/bloc/login_event.dart';
import '../../../login/presentation/bloc/login_state.dart';
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
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = getIt<LoginBloc>();
  }

  @override
  void dispose() {
    _documentController.dispose();
    _tokenController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  void _handleLogin() {
    final documento = _documentController.text.trim();
    if (documento.isEmpty) {
      _showErrorDialog(context.tr('login.error_empty_document'));
      return;
    }
    _loginBloc.add(LoginSubmitted(documento));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr('login.error_title')),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.tr('common.ok')),
          ),
        ],
      ),
    );
  }

  void _showNotFriendDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(context.tr('login.access_denied_title')),
        content: Text(context.tr('login.access_denied_message')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.tr('common.ok')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go(AppRouter.home);
        } else if (state is LoginUserNotFound) {
          _showNotFriendDialog();
        } else if (state is LoginFailure) {
          _showErrorDialog(state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: _documentController,
              label: context.tr('login.enter_document'),
              hint: context.tr('login.document_hint'),
              icon: Iconsax.card,
              enabled: !isLoading,
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _tokenController,
              label: context.tr('login.token'),
              hint: context.tr('login.token_hint'),
              icon: Iconsax.key,
              isPassword: true,
              enabled: !isLoading,
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              text: isLoading ? context.tr('login.validating') : context.tr('login.login_button'),
              onPressed: isLoading ? null : _handleLogin,
            ),
            if (isLoading) ...[
              const SizedBox(height: 20),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        );
      },
    );
  }
}
