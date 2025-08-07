import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/screens/AdvancedItemSettingsScreenLayout.dart';
import 'package:just_habits/layouts/DaySelectLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/WeekSelectLayout.dart';

class NewHabitScreenLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewItemLayout(),
          DropdownMenu(
              label: Text("Repeat by"),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Day", label: "Day"),
                DropdownMenuEntry(value: "Week", label: "Week"),
                DropdownMenuEntry(value: "Month", label: "Month")
              ]
          ),
          MonthSelectLayout(),
          SwitchListTile(
              title: Text("Reminder"),
              value: false,
              onChanged: (bool? value) {}
          ),
          TextButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvancedItemSettingsScreenLayout()
                    )
                )
              },
              child: Text("Advanced")
          )
        ],
      ),
    );
  }

  void onPressed() {
    
  }
  
}