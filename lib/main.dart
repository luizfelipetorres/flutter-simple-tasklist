import 'package:flutter/material.dart';
import 'package:lista_simples/controller/app_controller.dart';
import 'package:lista_simples/pages/config_page.dart';
import 'package:lista_simples/pages/home_page.dart';
import 'package:lista_simples/pages/sobre_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: "SimpleTasklist",
          theme: ThemeData(
            primarySwatch: AppController.instance.appColor,
            brightness: AppController.instance.isDarkMode
                ? Brightness.dark
                : Brightness.light,
          ),
          routes: {
            '/': (context) => HomePage(),
            '/sobre': (context) => SobrePage(),
            '/config': (context) => ConfigPage()
          },
          initialRoute: '/',
        );
      },
    );
  }
}
