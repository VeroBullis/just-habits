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
  String buttonText = "7:00 AM";

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SwitchListTile(
          value: switchState,
          onChanged: (bool value) {
            setState(() {
              switchState = value;
              if (value) {
                Globals.newItem!.remindTime = TimeOfDay(hour: 7, minute: 0);
              } else {
                Globals.newItem!.remindTime = null;
              }
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
                  setState(() {
                    buttonText = getButtonText();
                  });
                  },
                child: Text(buttonText)
            )
          ],
        )
      ],
    );
  }

  String getButtonText() {
    // referenced from https://stackoverflow.com/a/56798999
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(Globals.newItem!.remindTime!);
  }

}