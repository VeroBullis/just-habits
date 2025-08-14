import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/onPressed/onRemindTimePressed.dart';

import '../backend/model/Globals.dart' as Globals;

class ReminderTimeLayout extends StatefulWidget {
  @override
  _ReminderTimeState createState() => _ReminderTimeState();

}

class _ReminderTimeState extends State<ReminderTimeLayout> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: switchState,
          onChanged: (bool value) {
            setState(() {
              switchState = value;
            });
          },
          title: Text("Reminder"),
        ),
        Row(
          children: [
            Text("At"),
            ElevatedButton(
                onPressed: () async {
                  Globals.newItem!.remindTime = await onRemindTimePressed(context);
                  },
                child: Text("7:00 AM")
            )
          ],
        )
      ],
    );
  }

}