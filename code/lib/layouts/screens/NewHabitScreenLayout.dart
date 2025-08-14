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

import '../../backend/model/Globals.dart' as Globals;
import '../../backend/model/Item.dart';

class NewHabitScreenLayout extends StatefulWidget {
  Habit newHabit;

  NewHabitScreenLayout({super.key, required this.newHabit}) {
    Globals.newItem = newHabit;
  }

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
              initialSelection: RepeatInterval.day,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: RepeatInterval.day, label: "Day"),
                DropdownMenuEntry(value: RepeatInterval.week, label: "Week"),
                DropdownMenuEntry(value: RepeatInterval.month, label: "Month")
              ],
            onSelected: (RepeatInterval? selected) {
                setState(() {
                  (Globals.newItem as Habit).repeat.interval = selected!;
                  switch (selected) {
                    case RepeatInterval.day:
                      dayVisible = true;
                      weekVisible = false;
                      monthVisible = false;
                    case RepeatInterval.week:
                      dayVisible = false;
                      weekVisible = true;
                      monthVisible = false;
                    case RepeatInterval.month:
                      dayVisible = false;
                      weekVisible = false;
                      monthVisible = true;
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