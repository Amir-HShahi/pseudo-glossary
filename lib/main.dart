import 'package:flutter/material.dart';
import 'package:sudo_random/services/database_handler.dart';
import 'package:sudo_random/services/shared_preference.dart';
import 'package:sudo_random/view/home.dart';

void main() async {
  await DatabaseHandler.initializeDatabase();
  final bool isDataInitialized = await SharedPreference.hasShownIntro();
  if (!isDataInitialized) {

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
    );
  }
}

