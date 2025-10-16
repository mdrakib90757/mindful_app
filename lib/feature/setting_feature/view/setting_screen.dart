import 'package:flutter/material.dart';
import 'package:mindful_app/core/utils/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.spa, color: AppColors.primaryTeal),
            const SizedBox(width: 8),
            const Text(
              'Breathing Session',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.lightGreyBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                          value: 0.7,
                          strokeWidth: 10,
                          backgroundColor: AppColors.secondaryTeal.withOpacity(
                            0.3,
                          ),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryTeal,
                          ),
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

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Session Mode",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyText.withOpacity(0.7),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Guided Practice Seris",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyText.withOpacity(0.7),
                    ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
                fontSize: 18,
                color: AppColors.darkGreyText,
                fontWeight: FontWeight.bold,
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
