import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/onPressed/onConfirmNewItem.dart';

import '../backend/model/ItemType.dart';

//TODO: make sure static vars don't cause persistent value weirdness
class NewHeaderLayout extends StatelessWidget {

  static String title = "";
  final ItemType type;

  const NewHeaderLayout({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    title = "";

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
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Title"
          ),
          onChanged: (String value) => {title = value},
        )
      ],
    );
  }

}