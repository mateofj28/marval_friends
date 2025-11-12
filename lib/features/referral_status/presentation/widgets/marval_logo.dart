import 'package:flutter/material.dart';

class MarvalLogo extends StatelessWidget {
  const MarvalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/logo.png',
        height: 120,
      ),
    );
  }
}
