import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekSelectLayout extends StatefulWidget {
  static Set<int> selection = {};

  @override
  State<StatefulWidget> createState() => _WeekSelectState();

}

class _WeekSelectState extends State<WeekSelectLayout> {
  final weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final weekdaysLabel = ["S", "M", "T", "W", "T", "F", "S"];


//TODO: finish this
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
            selected: WeekSelectLayout.selection,
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                WeekSelectLayout.selection = newSelection;
              });
            },
        ),
        Text("Every Sat")
      ],
    );
  }

}