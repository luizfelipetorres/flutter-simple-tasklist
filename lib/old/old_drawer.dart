import 'package:flutter/material.dart';
import 'drawer_item.dart';

///Retorna a ListView com os objetos do drawer
Widget DrawerListWidget() {
  final drawerItens = <DrawerItem>[
    DrawerItem("Home", Icons.home, ""),
    DrawerItem("Sobre", Icons.info, ""),
    DrawerItem("Configurações", Icons.engineering, ""),
    DrawerItem("Sair", Icons.exit_to_app, ""),
  ];

  return ListView.builder(
    padding: EdgeInsets.all(10),
    itemCount: drawerItens.length,
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          IconButton(
            icon: Icon(drawerItens[index].i),
            onPressed: () =>
                Navigator.of(context).pushNamed(drawerItens[index].route),
          ),
          Text(drawerItens[index].text)
        ],
      ),
    ),
  );
}
