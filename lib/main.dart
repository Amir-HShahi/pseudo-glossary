import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudo_random/services/database_handler.dart';
import 'package:sudo_random/services/shared_preference.dart';
import 'package:sudo_random/view/home.dart';
import 'package:sudo_random/view_model/term_model_view.dart';

void main() async {
  await DatabaseHandler.initializeDatabase();
  final bool isDataInitialized = await SharedPreference.isDataInitialized();
  if (!isDataInitialized) {
    await DatabaseHandler.insertAllTermsToDatabase();
    SharedPreference.setDataAsInitialized(true);
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TermViewModel()),
    ],
    child: MyApp(),
  ));
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
