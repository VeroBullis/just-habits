import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/ReminderTimeLayout.dart';
import 'package:just_habits/widgets/AdvancedButton.dart';
import 'package:just_habits/widgets/DayWeekMonthMenu.dart';

class NewGoalScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewItemLayout(type: ItemType.habit,),
          Row(
            children: [
              Text("Complete by"),
              ElevatedButton(
                  onPressed: () => onPressed(context),
                  child: Text(DateTime.now().toString())
              )
            ],
          ),
          ReminderTimeLayout(),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => {},
                  child: Text("2")
              ),
              DayWeekMonthMenu(),
              Text("before completion date")
            ],
          ),
          AdvancedButton()
        ],
      ),
    );
  }

  void onPressed(BuildContext context) {

  }

}