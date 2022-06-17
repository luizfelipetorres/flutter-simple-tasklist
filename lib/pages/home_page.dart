import 'package:flutter/material.dart';
import 'package:lista_simples/widgets/navigation_drawer.dart';

import '../interfaces/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = <String>[];
  final itensList = <Item>[];
  final controller = TextEditingController();
  late FocusNode textFieldFocus; //Usado para controlar o focus do textfield

  var check = false;

  //Inicio ciclo de vida
  @override
  void initState() {
    super.initState();
    textFieldFocus = FocusNode();
  }

  //fim ciclo de vida
  @override
  void dispose() {
    textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Tasklist"),
      ),
      drawer: NavigationDrawer(),
      /* Drawer(backgroundColor: Colors.white, child: DrawerListWidget()), */
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cleaning_services),
        onPressed: () {
          setState(() {
            itensList.clear();
          });
        },
      ),
      body: Column(
        children: [
          FirstRow(),
          Expanded(
            child: ListView.builder(
              itemCount: itensList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = itensList[index];
                return buildRowItem(item);
              },
            ),
          )
        ],
      ),
    );
  }

  ///Método que retorna a primeira linha, que contem o TextFild de inserção e o botão de inclusão
  Widget FirstRow() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          focusNode: textFieldFocus,
          textInputAction: TextInputAction.go,
          textCapitalization: TextCapitalization.sentences,
          autocorrect: true,
          enableSuggestions: true,
          onSubmitted: (texto) {
            final text = texto;
            setState(() {
              itensList.add(Item(text, false));
              textFieldFocus.requestFocus();
            });
            controller.clear();
            FocusScope.of(context).requestFocus();
          },
          decoration: InputDecoration(
              labelText: "Insira um item...",
              contentPadding: EdgeInsets.all(10)),
          controller: controller,
        )),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            final text = controller.text;
            setState(() {
              itensList.add(Item(text, false));
            });
            controller.clear();
          },
        )
      ],
    );
  }

  ///Método que retorna o RowItem, contendo o checkbox e o text
  Widget buildRowItem(Item item) {
    Text t = Text(
      item.texto,
      style: TextStyle(
        decoration:
            item.done ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );

    return CheckboxListTile(
      title: t,
      value: item.done,
      onChanged: (valor) {
        setState(() {
          item.done = valor!;
          t = Text(
            item.texto,
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          );
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      secondary: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () => setState(() => itensList.remove(item)),
      ),
    );
  }
}
