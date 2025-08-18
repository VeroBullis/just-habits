import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../backend/model/Globals.dart' as Globals;
import '../backend/model/Item.dart';

class MonthSelectLayout extends StatefulWidget {
  const MonthSelectLayout({super.key});

  @override
  State<StatefulWidget> createState() => _MonthSelectLayout();

}

class _MonthSelectLayout extends State<MonthSelectLayout>{
  Set<int> selected = {};
  DateTime focused = DateTime.utc(2000, 10, 1);
  String selectionString = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerVisible: false,
          daysOfWeekVisible: false,
          focusedDay: focused,
          selectedDayPredicate: (DateTime day) {
            return selected.contains(day.day);
          },
          firstDay: DateTime.utc(2000, 10, 1),
          lastDay: DateTime.utc(2000, 10, 31),
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            int date = selectedDay.day;
            setState(() {
              if (selected.contains(date)) {
                selected.remove(date);
              } else {
                selected.add(date);
              }
              focused = focusedDay;
              (Globals.newItem! as Habit).repeat.selected = selected;
              selectionString = getSelectionString();
            });
          },
        ),
        Text(selectionString)
      ]
    );
  }

  String getSelectionString() {
    String selectionString;
    List selectionList = selected.toList();
    selectionList.sort();

    if (selected.isEmpty) {
      return "";
    } else {
      selectionString = "Every month on the ";
      for (int i in selectionList) {
        selectionString += "$i, ";
      }
      selectionString = selectionString.substring(0, selectionString.lastIndexOf(","));
    }

    return selectionString;
  }

}