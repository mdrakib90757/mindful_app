import 'package:flutter/material.dart';
import 'package:mindful_app/core/utils/color.dart';


class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.spa, color: AppColors.primaryTeal),
            SizedBox(width: 10,),
            const Text(
              "Guide du Méditations",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Grid Section
            GridView.builder(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                //mainAxisSpacing: 10.0,
                childAspectRatio:
                screenWidth < 300 ? 0.7 : 0.8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                // Data for the top grid cards
                final List<Map<String, String>> gridItems = [
                  {
                    'image': 'assets/img/download (1).png',
                    'title': 'Deep Sleep',
                    'subtitle': 'Daco Sopo'
                  },
                  {
                    'image': 'assets/img/download (2).png',
                    'title': 'Stress Boost',
                    'subtitle': 'Relaxation'
                  },
                  {
                    'image': 'assets/img/download (3).png',
                    'title': 'Heavy Forest',
                    'subtitle': 'Sons of Gold'
                  },
                  {
                    'image': 'assets/img/download (4).png',
                    'title': 'Ocean Waves',
                    'subtitle': 'Peaceful Waters'
                  },
                ];
                final item = gridItems[index];
                return Column(
                  children: [
                    Image.asset(
                      item['image']!,
                    ),
                    SizedBox(height: 8,),
                    Text(item["title"]!,style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                );
              },
            ),

            // "Soothing Soundscapes" Title
            const Text(
              "Soothing Soundscapes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            // Horizontal Scroll Section
            SizedBox(
              height: screenWidth * 0.60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {

                  final List<Map<String, String>> horizontalItems = [
                    {
                      'image': 'assets/img/download (5).png',
                      'title': 'Calm Journey',
                      'subtitle': 'Nature Sounds'
                    },
                    {
                      'image': 'assets/img/download (5).png',
                      'title': 'Morning Dew',
                      'subtitle': 'Forest Ambience'
                    },
                    {
                      'image': 'assets/img/download (5).png',
                      'title': 'Gentle Rain',
                      'subtitle': 'Relaxing Drops'
                    },
                    {
                      'image': 'assets/img/download (5).png',
                      'title': 'Sunset Breeze',
                      'subtitle': 'Soft Winds'
                    },
                  ];
                  final item = horizontalItems[index];
                  return Padding(
                    padding: EdgeInsets.only(right: index == horizontalItems.length - 1 ? 0 : 16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          item['image']!,
                        height: 180,width: 180,),
                        SizedBox(height: 8,),
                        Text(item["title"]!,style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),)

                      ],
                    )
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}