import 'package:flutter/material.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../widgets/home_header.dart';
import '../widgets/home_content.dart';
import '../widgets/floating_chat_button.dart';
import '../../../profile/presentation/widgets/profile_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onChatTap() {
    // TODO: Implement chat functionality
  }

  void _navigateToProfile() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  HomeContent(onProfileTap: _navigateToProfile),
                  const ProfileContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingChatButton(
        onTap: _onChatTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
