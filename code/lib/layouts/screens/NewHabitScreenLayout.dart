import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/backend/model/Repeat.dart';
import 'package:just_habits/backend/onPressed/onAdvancedPressed.dart';
import 'package:just_habits/backend/onPressed/onConfirmNewItem.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/ReminderTimeLayout.dart';
import 'package:just_habits/layouts/dialogues/NumberPickerDialogLayout.dart';
import 'package:just_habits/layouts/screens/AdvancedItemSettingsScreenLayout.dart';
import 'package:just_habits/layouts/DaySelectLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/WeekSelectLayout.dart';

class NewHabitScreenLayout extends StatefulWidget {
  static RepeatInterval? repeatInterval;
  static int? repeatCount;

  @override
  State<StatefulWidget> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreenLayout> {
  bool dayVisible = true;
  bool weekVisible = false;
  bool monthVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NewItemLayout(type: ItemType.habit),
          DropdownMenu(
              label: Text("Repeat by"),
              initialSelection: "Day",
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "Day", label: "Day"),
                DropdownMenuEntry(value: "Week", label: "Week"),
                DropdownMenuEntry(value: "Month", label: "Month")
              ],
            onSelected: (String? selected) {
                setState(() {
                  switch (selected) {
                    case "Day":
                      dayVisible = true;
                      weekVisible = false;
                      monthVisible = false;
                      NewHabitScreenLayout.repeatInterval = RepeatInterval.day;
                      NewHabitScreenLayout.repeatCount = NumberPickerDialogLayout.chosenNumber;
                    case "Week":
                      dayVisible = false;
                      weekVisible = true;
                      monthVisible = false;
                      NewHabitScreenLayout.repeatInterval = RepeatInterval.week;
                    case "Month":
                      dayVisible = false;
                      weekVisible = false;
                      monthVisible = true;
                      NewHabitScreenLayout.repeatInterval = RepeatInterval.month;
                  }
                });
            },
          ),
          Visibility(visible: dayVisible, child: DaySelectLayout()),
          Visibility(visible: weekVisible, child: WeekSelectLayout()),
          Visibility(visible: monthVisible, child: MonthSelectLayout()),
          ReminderTimeLayout(),
          TextButton(
              onPressed: () => onAdvancedPressed(context),
              child: Text("Advanced")
          )
        ],
      ),
    );
  }
  
}