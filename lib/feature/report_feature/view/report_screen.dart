
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mindful_app/core/utils/color.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyBackground,
        elevation: 0,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.spa, color: AppColors.primaryTeal),
            const SizedBox(width: 8),
            Text(
              'MoodStat',
              style: TextStyle(
                color: AppColors.darkGreyText,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.darkGreyText),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lo Medortiet ett libo',
                style: TextStyle(color: AppColors.greyText, fontSize: 16),
              ),
              const SizedBox(height: 24),
              // Chart Area
              AspectRatio(
                aspectRatio: 1.70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: LineChart(mainData()),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Mon',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tue',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Wed',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Thurs',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fri',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sat',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sun',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log Your Mood...',
                        style: TextStyle(
                          color: AppColors.darkGreyText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.grey.shade200),
                      const SizedBox(height: 12),
                      Text(
                        'Fcrewor ont sr pevit veerbat ostroen foot et antrans deolensin labt peicantres.',
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildMoodLogItem('Anepimes', AppColors.primaryTeal),
                      const SizedBox(height: 8),
                      _buildMoodLogItem('Deses', AppColors.lightPurple),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodLogItem(String text, Color dotColor) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: AppColors.darkGreyText, fontSize: 14),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 2.5),
            FlSpot(3, 3.5),
            FlSpot(4, 3),
            FlSpot(5, 2),
            FlSpot(6, 3.5),
          ],
          isCurved: true,
          color: AppColors.chartColor1,
          barWidth: 0, // Make the line invisible
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.chartColor1.withOpacity(0.5),
            spotsLine: BarAreaSpotsLine(show: false),
            cutOffY: 0,
            applyCutOffY: false,
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(1, 1.5),
            FlSpot(2, 2.8),
            FlSpot(3, 2.2),
            FlSpot(4, 1.8),
            FlSpot(5, 1.2),
            FlSpot(6, 2.8),
          ],
          isCurved: true,
          color: AppColors.chartColor2,
          barWidth: 0,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.chartColor2.withOpacity(0.5),
            spotsLine: BarAreaSpotsLine(show: false),
            cutOffY: 0,
            applyCutOffY: false,
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 1),
            FlSpot(1, 0.5),
            FlSpot(2, 1.8),
            FlSpot(3, 1),
            FlSpot(4, 0.8),
            FlSpot(5, 0.2),
            FlSpot(6, 1.8),
          ],
          isCurved: true,
          color: AppColors.chartColor3,
          barWidth: 0,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.chartColor3.withOpacity(0.5),
            spotsLine: BarAreaSpotsLine(show: false),
            cutOffY: 0,
            applyCutOffY: false,
          ),
        ),
      ],
    );
  }
}
