import 'package:flutter/material.dart';

class FirstRow extends StatefulWidget {
  const FirstRow({Key? key}) : super(key: key);

  @override
  State<FirstRow> createState() => _FirstRowState();
}

class _FirstRowState extends State<FirstRow> {
  final list = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
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
              list.add(text);
            });
            controller.clear();
          },
        )
      ],
    );
  }
}

/* Widget FirstRow(){

  final controller = TextEditingController();

  return Row(
              children: [
                Expanded(
                    child: TextField(
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
                      list.add(text);
                    });
                    controller.clear();
                  },
                )
              ],
            ),
}  */