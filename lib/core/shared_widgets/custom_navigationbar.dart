import 'package:flutter/material.dart';
import 'package:mindful_app/feature/home_feature/view/home_screen.dart';
import 'package:mindful_app/feature/relax_feature/view/relax_screen.dart';
import 'package:mindful_app/feature/report_feature/view/report_screen.dart';
import 'package:mindful_app/feature/setting_feature/view/setting_screen.dart';

import '../utils/color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> _screen = [
    HomeScreen(),
    ReportScreen(),
    MeditationScreen(),
    SettingsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            activeIcon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined, size: 30),
            activeIcon: Icon(Icons.bar_chart, size: 30),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined, size: 30),
            activeIcon: Icon(Icons.shield, size: 30),
            label: 'Relax',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, size: 30),
            activeIcon: Icon(Icons.settings, size: 30),
            label: 'Setting',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryTeal,
        unselectedItemColor: AppColors.greyText,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
