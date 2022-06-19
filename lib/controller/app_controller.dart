import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isDarkMode = false;

  Map<String, MaterialColor> appColors = {
    "Vermelho": Colors.red,
    "Azul": Colors.blue,
    "Amarelo": Colors.yellow,
  };

  MaterialColor appColor = Colors.red;
  String appColorString = "Vermelho";

  static AppController instance = AppController();

  changeTema() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  changeColor(String cor) {
    appColor = appColors[cor]!;
    appColorString = cor;
    notifyListeners();
  }
}
