import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';

class NewItemLayout extends StatefulWidget {
  final ItemType type;

  const NewItemLayout({super.key, required this.type});

  @override
  _NewItemState createState() => _NewItemState(type);

}

class _NewItemState extends State<NewItemLayout> {
  ItemType type;

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
          ),
          DropdownMenu(
              label: Text("Category"),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Category Title", label: "No Category")
              ]
          ),
          SwitchListTile(
              title: Text("Highlight"),
              value: false,
              onChanged: (bool? value) {}
          )
        ],
      );
  }
}