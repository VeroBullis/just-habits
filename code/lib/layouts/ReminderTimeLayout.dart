import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReminderTimeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          value: false,
          onChanged: (bool? value) => {},
          title: Text("Reminder"),
        ),
        Row(
          children: [
            Text("At"),
            ElevatedButton(
                onPressed: () => {},
                child: Text("7:00 AM")
            )
          ],
        )
      ],
    );
  }

}