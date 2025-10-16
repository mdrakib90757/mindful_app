import 'package:flutter/material.dart';
import 'package:mindful_app/core/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyBackground,
        elevation: 0,

        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.spa, color: AppColors.primaryTeal),
              const SizedBox(width: 8),
              Text(
                'Mindful Haven',
                style: TextStyle(
                  color: AppColors.darkGreyText,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications_none,
              color: AppColors.darkGreyText,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Dimaees',
                  style: TextStyle(color: AppColors.greyText, fontSize: 16),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  '28/01/9, 7:09J',
                  style: TextStyle(color: AppColors.greyText, fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                color: AppColors.darkGreyText,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'How are we feeling\ntoday?',
                              style: TextStyle(
                                color: AppColors.greyText,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Clean broke cellsD',
                              style: TextStyle(
                                color: AppColors.greyText,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        // Placeholder for the illustration on the right
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.lightPurple.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            //border: Border.all(color: Colors.grey.shade300)
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/image/3.jpg",
                              fit: BoxFit.cover,
                            ),
                            //Icon(Icons.person, size: 40, color: AppColors.primaryTeal),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSmileyIcon(
                          Icons.sentiment_very_satisfied,
                          AppColors.smileyHappy,
                          true,
                        ),
                        _buildSmileyIcon(
                          Icons.sentiment_satisfied_alt,
                          AppColors.smileyHappy,
                          false,
                        ),
                        _buildSmileyIcon(
                          Icons.sentiment_neutral,
                          AppColors.smileyNeutral,
                          false,
                        ),
                        _buildSmileyIcon(
                          Icons.sentiment_dissatisfied,
                          AppColors.smileySad,
                          false,
                        ),
                        _buildSmileyIcon(
                          Icons.sentiment_very_dissatisfied,
                          AppColors.smileyAngry,
                          false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildFeatureCard('Mome Meastson', Icons.home),
              const SizedBox(height: 10),
              _buildFeatureCard('Daily Meditation', Icons.self_improvement),
              const SizedBox(height: 10),
              _buildFeatureCard('Quick Breathing', Icons.air),
              const SizedBox(height: 10),
              _buildFeatureCard('Quick Breathing', Icons.air),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }

  Widget _buildSmileyIcon(
    IconData icon,
    Color backgroundColor,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: AppColors.primaryTeal, width: 2)
            : null,
      ),
      child: Icon(icon, color: AppColors.darkGreyText, size: 24),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkGreyText,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(icon, color: AppColors.greyText),
        ],
      ),
    );
  }
}
