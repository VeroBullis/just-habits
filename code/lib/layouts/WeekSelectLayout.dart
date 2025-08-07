import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekSelectLayout extends StatelessWidget {
  final weekdays = ["S", "M", "T", "W", "T", "F", "S"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List<Widget>.generate(
              7, (i) => ElevatedButton(
              onPressed: onPressed,
              child: Text(weekdays[i]),
          )
          ),
        ),
        Text("Every Sat")
      ],
    );
  }

  void onPressed() {

  }

}