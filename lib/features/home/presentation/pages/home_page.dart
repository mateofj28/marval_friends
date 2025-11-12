import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/home_content.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/floating_chat_button.dart';
import '../../../profile/presentation/widgets/profile_content.dart';
import '../../../notifications/presentation/widgets/notifications_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onChatTap() {
    // TODO: Implement chat functionality
  }

  Widget _getContent() {
    switch (_currentIndex) {
      case 0:
        return const HomeContent();
      case 1:
        return const ProfileContent();
      case 2:
        return const NotificationsContent();
      default:
        return const HomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: _getContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
      floatingActionButton: FloatingChatButton(
        onTap: _onChatTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
