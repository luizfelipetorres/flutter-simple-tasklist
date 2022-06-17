import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_simples/pages/config_page.dart';

import 'package:lista_simples/pages/home_page.dart';
import 'package:lista_simples/pages/sobre_page.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    const name = "Username";
    const email = "user@mail.com";
    const img = "";

    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 200, 0, 0),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 30),
            buildHeader(name: name, email: email, img: img),
            Divider(color: Colors.white),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Home",
                icon: Icons.home,
                onClick: () => selectedItem(context, 0)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Sobre",
                icon: Icons.help,
                onClick: () => selectedItem(context, 1)),
            const SizedBox(height: 5),
            Divider(color: Colors.white),
            const SizedBox(height: 5),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Sair",
                icon: Icons.exit_to_app,
                onClick: () => selectedItem(context, 3)),
          ],
        ),
      ),
    );
  }

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClick}) {
    const color = Colors.white;
    const hoverColor = Color.fromARGB(69, 255, 255, 255);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }

  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SobrePage(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfigPage(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => exit(0),
        ));
        break;
    }
  }

  buildHeader(
      {required String name, required String email, required String img}) {
    TextStyle textColor = TextStyle(color: Colors.white);

    return InkWell(
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(206, 14, 14, 14),
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textColor,
                ),
                const SizedBox(height: 10),
                Text(
                  email,
                  style: textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
