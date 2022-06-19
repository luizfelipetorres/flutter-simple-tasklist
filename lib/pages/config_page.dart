import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_simples/controller/app_controller.dart';

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
            SizedBox(height: 20),
            ListTile(
              title: Text("Cor do app: "),
              subtitle: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: false,
                  disabledHint: Text("Escolha a cor: "),
                  hint: Text("Escolha a cor do app"),
                  value: AppController.instance.appColorString,
                  iconEnabledColor: AppController.instance.appColor,
                  items: AppController.instance.appColors.keys
                      .map((e) =>
                          DropdownMenuItem<String>(child: Text(e), value: e))
                      .toList(),
                  onChanged: (String? valor) {
                    AppController.instance.appColors =
                        AppController.instance.changeColor(valor!);
                  },
                ),
              ),
            ),
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
