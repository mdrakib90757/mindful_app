import 'package:flutter/material.dart';
import 'core/shared_widgets/custom_navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: CustomBottomNavigationBar(),
    );
  }
}

