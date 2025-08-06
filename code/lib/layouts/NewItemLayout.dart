import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';

class NewItemLayout extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();

}

class _NewItemState extends State<NewItemLayout> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          NewHeaderLayout(),
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