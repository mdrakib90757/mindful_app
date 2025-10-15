import 'package:flutter/material.dart';
import 'package:mindful_app/core/utils/color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.spa, color: AppColors.primaryTeal),
            const SizedBox(width: 8),
            const Text('Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
       excludeHeaderSemantics: true,
       backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.lightGreyBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [

            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const SizedBox(height: 20),
                // Breathing Circle
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: 0.7, // Example progress
                          strokeWidth: 10,
                          backgroundColor: AppColors.secondaryTeal.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryTeal),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Inhale Exhale',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGreyText,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '5 minutes remaining',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Section "Senses"
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Senses',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyText.withOpacity(0.7),
                    ),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.lightbulb_outline,
                  title: 'Uqrev kiollid',
                  trailingIcon: Icons.star_border,
                ),
                _buildSettingsItem(
                  icon: Icons.timer_outlined,
                  title: 'Session duration',
                  trailingIcon: Icons.delete_outline,
                ),
                _buildSettingsItem(
                  icon: Icons.lock_outline,
                  title: 'Sesisa Tehniques',
                  trailingIcon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    IconData? trailingIcon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryTeal),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.darkGreyText,
              ),
            ),
          ),
          if (trailingIcon != null)
            Icon(trailingIcon, color: AppColors.greyText.withOpacity(0.7)),
        ],
      ),
    );
  }
}