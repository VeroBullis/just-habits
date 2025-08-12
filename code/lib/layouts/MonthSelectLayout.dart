import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthSelectLayout extends StatefulWidget {
  static Set<int> selection = {};
  const MonthSelectLayout({super.key});

  @override
  State<StatefulWidget> createState() => _MonthSelectLayout();

}

class _MonthSelectLayout extends State<MonthSelectLayout>{
  Set<DateTime> selected = {};
  DateTime focused = DateTime.utc(2000, 10, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerVisible: false,
          daysOfWeekVisible: false,
          focusedDay: focused,
          selectedDayPredicate: (DateTime day) {
            return selected.contains(day);
          },
          firstDay: DateTime.utc(2000, 10, 1),
          lastDay: DateTime.utc(2000, 10, 31),
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            int date = selectedDay.day;
            setState(() {
              if (selected.contains(selectedDay)) {
                selected.remove(selectedDay);
                MonthSelectLayout.selection.remove(date);
              } else {
                selected.add(selectedDay);
                MonthSelectLayout.selection.add(date);
              }
              focused = focusedDay;
            });
          },
        ),
        Text("Every month on the 1")
      ]
    );
  }

}