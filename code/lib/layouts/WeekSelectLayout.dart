import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';

import '../backend/model/Globals.dart' as Globals;

class WeekSelectLayout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _WeekSelectState();

}

class _WeekSelectState extends State<WeekSelectLayout> {
  final weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final weekdaysLabel = ["S", "M", "T", "W", "T", "F", "S"];
  String selectionString = "";

  Set<int> selection = {};

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SegmentedButton<int>(
          multiSelectionEnabled: true,
            emptySelectionAllowed: true,
            segments: List<ButtonSegment<int>>.generate(
              7, (i) => ButtonSegment(
                  value: i,
                  label: Text(weekdaysLabel[i])
              )
            ),
            selected: selection,
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                selection = newSelection;
                (Globals.newItem! as Habit).repeat.selected = newSelection;
                selectionString = getSelectionString();
              });
            },
        ),
        Text(selectionString)
      ],
    );
  }

  String getSelectionString() {
    String selectionString;
    List selectionList = selection.toList();
    selectionList.sort();

    if (selection.isEmpty) {
      return "";
    } else {
      selectionString = "Every ";
      for (int i in selectionList) {
        selectionString += "${weekdays[i]}, ";
      }
      selectionString = selectionString.substring(0, selectionString.lastIndexOf(","));
    }

    return selectionString;
  }

}