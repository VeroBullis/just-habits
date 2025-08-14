import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';

import '../backend/model/Globals.dart' as Globals;

class NewItemLayout extends StatefulWidget {
  final ItemType type;

  const NewItemLayout({super.key, required this.type});

  @override
  _NewItemState createState() => _NewItemState(type);

}

class _NewItemState extends State<NewItemLayout> {
  ItemType type;
  bool switchState = false;

  _NewItemState(this.type);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          NewHeaderLayout(type: type),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note"
            ),
            onChanged: (String value) {
              Globals.newItem!.note = value;
            },
          ),
          DropdownMenu(
              label: Text("Category"),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Category Title", label: "No Category")
              ]
          ),
          SwitchListTile(
              title: Text("Highlight"),
              value: switchState,
              onChanged: (bool value) {
                Globals.newItem!.highlight = value;
                setState(() {
                  switchState = value;
                });
              },
          )
        ],
      );
  }
}