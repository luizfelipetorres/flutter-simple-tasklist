import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: Material(
        child: ListView(
          children: [
            buildConfigButton(
                "Alterar cor principal", "Escolha a cor do aplicativo"),
            buildConfigButton("Opção 2", "Descrição 2"),
          ],
        ),
      ),
    );
  }

  Widget buildConfigButton(String title, String description,
      {VoidCallback? onClick}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description, style: TextStyle(fontSize: 12)),
      hoverColor: Color.fromARGB(198, 196, 184, 180),
      onTap: onClick ?? () => {},
      visualDensity: VisualDensity.standard,
    );
  }
}
