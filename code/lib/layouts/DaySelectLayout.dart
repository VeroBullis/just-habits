import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/dialogues/ScrollWheelDialogLayout.dart';
import 'package:wheel_picker/wheel_picker.dart';

class DaySelectLayout extends StatelessWidget {

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
                  content: ScrollWheelDialogLayout(),
                  actions: [
                    ElevatedButton(
                        onPressed: () => {
                          Navigator.pop(context)
                        },
                        child: Text("OK"))
                  ],
                )),
            child: Text("1")
        ),
        Text("Every day")
      ],
    );
  }

}