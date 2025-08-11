import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekSelectLayout extends StatelessWidget {
  final weekdays_set = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
  final weekdays_list = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

//TODO: finish this
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton<String>(
            segments: List<ButtonSegment<String>>.generate(
              7, (i) => ButtonSegment(value: weekdays_list[i])
            ),
            selected: weekdays_set
        ),
        Text("Every Sat")
      ],
    );
  }

}