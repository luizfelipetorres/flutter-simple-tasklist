import 'package:flutter/material.dart';
import 'package:lista_simples/controller/app_controller.dart';
import 'package:lista_simples/pages/home_page.dart';

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
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDarkMode
                ? Brightness.dark
                : Brightness.light,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
