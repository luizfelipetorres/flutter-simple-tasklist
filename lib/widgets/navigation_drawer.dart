import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lista_simples/controller/app_controller.dart';
import 'package:lista_simples/pages/config_page.dart';
import 'package:lista_simples/pages/sobre_page.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  get padding => EdgeInsets.symmetric(horizontal: 20);
  get name => "Username";
  get email => "user@mail.com";
  get img => "";
  get textColor => Colors.white;
  get hoverColor => Color.fromARGB(69, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppController.instance.isDarkMode
            ? Colors.black45
            : Color.fromARGB(255, 200, 0, 0),
        child: ListView(
          children: <Widget>[
            buildHeader(name: name, email: email, img: img),
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
            buildSwitchDarkMode(),
          ],
        ),
      ),
    );
  }

  ///"Construtor" do switch de darkmode
  buildSwitchDarkMode() => SwitchListTile(
        title: Text(
          "Darkmode: ",
          style: TextStyle(color: textColor),
        ),
        value: AppController.instance.isDarkMode,
        onChanged: (valor) {
          AppController.instance.changeTema();
        },
        hoverColor: hoverColor,
      );

  ///"Construtor" do item de menu
  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClick}) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }

  ///Função de click nos itens do drawer
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

  ///Constroi o header com informações do usuário
  buildHeader(
      {required String name, required String email, required String img}) {
    return UserAccountsDrawerHeader(
      accountEmail: Text(name),
      accountName: Text(email),
      currentAccountPicture: CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(206, 14, 14, 14),
        child: Icon(
          Icons.person,
          size: 40,
        ),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: [
        CircleAvatar(child: Icon(Icons.person_add_alt_1_outlined))
      ],
    );
  }
}
