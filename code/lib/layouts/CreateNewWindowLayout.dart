
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/NewHabitScreenLayout.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';

enum Choice {item, category}

class CreateNewWindowLayout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CreateNewWindowState();

}

class _CreateNewWindowState extends State<CreateNewWindowLayout> {
  Choice? _choice = Choice.item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: Text("Item"),
            value: Choice.item,
            groupValue: _choice,
            onChanged: (Choice? value) {
              setState(() {
                _choice = value;
              });
            }
        ),
        RadioListTile(
            title: Text("Category"),
            value: Choice.category,
            groupValue: _choice,
            onChanged: (Choice? value) {
              setState(() {
                _choice = value;
              });
            }
        ),
        TextButton(
            onPressed: onOkPressed,
            child: Text("OK")
        )
      ],
    );
  }

  void onOkPressed() {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewHabitScreenLayout())
    );
  }

  void onPressed() {

  }

}