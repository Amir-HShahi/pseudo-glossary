import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sudo_random/services/database_handler.dart';

import '../model/term_model.dart';

class TermViewModel with ChangeNotifier {
  final Random _random = Random();

  TermModel mainTerm = TermModel(title: 'READY ?', description: '');

  int getRandomNumber() {
    return _random.nextInt(297);
  }

  void getRandomTerm() async {
    mainTerm = await DatabaseHandler.retrieveTermModel(getRandomNumber());
    notifyListeners();
  }
}
