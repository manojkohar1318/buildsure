import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';

void main() {
  runApp(const BuildSureApp());
}

class BuildSureApp extends StatelessWidget {
  const BuildSureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuildSure',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0969C8),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}