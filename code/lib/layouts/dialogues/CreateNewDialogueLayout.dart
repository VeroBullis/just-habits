
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/screens/NewGoalScreenLayout.dart';
import 'package:just_habits/layouts/screens/NewHabitScreenLayout.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/screens/NewToDoScreenLayout.dart';

import '../../backend/onPressed/onOkPressed.dart';

enum Choice {item, category}

class CreateNewDialogueLayout extends StatefulWidget {
  const CreateNewDialogueLayout({super.key, required this.type});
  
  final ItemType type;

  @override
  State<StatefulWidget> createState() => _CreateNewWindowState(type: type);

}

class _CreateNewWindowState extends State<CreateNewDialogueLayout> {
   _CreateNewWindowState({required this.type});
   
  Choice? _choice = Choice.item;
  late final ItemType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            title: Text(type.toString()),
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
            onPressed: () => onOkPressed(context, type),
            child: Text("OK")
        )
      ],
    );
  }

}