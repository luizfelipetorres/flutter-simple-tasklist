import 'package:flutter/foundation.dart';

class AppController extends ChangeNotifier {
  bool isDarkMode = false;
  static AppController instance = AppController();

  changeTema() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
