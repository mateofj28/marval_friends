import 'package:flutter/material.dart';
import '../widgets/welcome_logo.dart';
import '../widgets/welcome_title.dart';
import '../widgets/welcome_form.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                const WelcomeLogo(),
                const SizedBox(height: 80),
                const WelcomeTitle(),
                const SizedBox(height: 60),
                const WelcomeForm(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
