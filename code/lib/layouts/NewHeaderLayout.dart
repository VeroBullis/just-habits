import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/onPressed/onConfirmNewItem.dart';

import '../backend/model/Globals.dart' as Globals;
import '../backend/model/ItemType.dart';

//TODO: replace static vars with reference to globals
class NewHeaderLayout extends StatelessWidget {

  final ItemType type;

  const NewHeaderLayout({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)
            ),
            Text("New $type"),
            IconButton(
                onPressed: () => onConfirmNewItem(context, type),
                icon: Icon(Icons.check)
            )
          ],
        ),
        TextField(
          key: Key("TitleTextField"),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Title"
          ),
          onChanged: (String value) {
            Globals.newItem!.title = value;
          },
        )
      ],
    );
  }

}