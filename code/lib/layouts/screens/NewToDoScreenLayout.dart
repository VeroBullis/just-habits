import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/ReminderTimeLayout.dart';
import 'package:just_habits/widgets/AdvancedButton.dart';
import 'package:just_habits/widgets/DayWeekMonthMenu.dart';

class NewToDoScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewItemLayout(),
          ReminderTimeLayout(),
          Row(
            children: [
              Text("In"),
              ElevatedButton(
                  onPressed: () => {}, 
                  child: Text("0")
              ),
              DayWeekMonthMenu(),
              Text("(Today)")
            ],
          ),
          AdvancedButton()
        ],
      ),
    );
  }

}