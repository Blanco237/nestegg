import 'package:flutter/material.dart';
import 'package:mansar_mobile/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestEgg',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(177, 220, 98, 1)),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
