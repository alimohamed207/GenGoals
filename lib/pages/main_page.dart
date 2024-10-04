import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';

import 'package:flutter_samples/pages/leaderboard_page.dart';
import 'package:flutter_samples/pages/chat/chat_page.dart';
import 'package:flutter_samples/pages/game_page.dart';
import 'package:flutter_samples/pages/home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static String id = 'MainPage';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  final List<Widget> _screens = [
    const HomePage(),
    const GamePage(),
    const ChatPage(),
    const LeaderBoardPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: AppColors.whiteColor,
            color: Colors.black,
            activeColor: const Color(0xFF2BB6E0),
            tabBackgroundColor: const Color(0xFFCDF2FD),
            padding: const EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: BoxIcons.bx_home,
                text: 'Home',
              ),
              GButton(
                icon: BoxIcons.bx_game,
                text: 'Game',
              ),
              GButton(
                icon: BoxIcons.bx_chat,
                text: 'Chat',
              ),
              GButton(
                icon: BoxIcons.bx_medal,
                text: 'Challenges',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
