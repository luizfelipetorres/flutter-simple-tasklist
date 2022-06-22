import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      //drawer: NavigationDrawer(),
      body: ListView(
        children: [
          Text(
            "Sobre o aplicativo",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
              "Aplicativo criado por @Luiz Felipe para praticar o desenvolvimento com a framework Flutter. "),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Icon(Icons.copyright, size: 15),
              Text(
                "Todos os direitos reservados",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
        ],
      ),
    );
  }
}
