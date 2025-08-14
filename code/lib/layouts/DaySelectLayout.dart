import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/dialogues/NumberPickerDialogLayout.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../backend/model/Globals.dart' as Globals;
import '../backend/model/Item.dart';

class DaySelectLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DaySelectState();

}

class _DaySelectState extends State<DaySelectLayout> {
  String buttonText = "1";
  String labelText = "Every day";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder:
                (BuildContext context) => AlertDialog(
                  title: Text("Select Frequency"),
                  content: NumberPickerDialogLayout(),
                  actions: [
                    ElevatedButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          setState(() {
                            setState(() {
                              int chosenNumber = NumberPickerDialogLayout.chosenNumber;
                              (Globals.newItem! as Habit).repeat.selected = {chosenNumber};
                              buttonText = chosenNumber.toString();
                              if (chosenNumber == 1) {
                                labelText = "Every day";
                              } else {
                                labelText = "Every $chosenNumber days";
                              }
                            });
                          })
                        },
                        child: Text("OK"))
                  ],
                )),
            child: Text(buttonText)
        ),
        Text(labelText)
      ],
    );
  }

}