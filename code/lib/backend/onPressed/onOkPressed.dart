import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/screens/NewGoalScreenLayout.dart';
import 'package:just_habits/layouts/screens/NewHabitScreenLayout.dart';

import '../../layouts/screens/NewToDoScreenLayout.dart';
import '../model/Globals.dart' as Globals;
import '../model/Item.dart';

void onOkPressed(BuildContext context, ItemType type) {

  Widget layout;

  switch (type) {
    case ItemType.habit:
      layout = NewHabitScreenLayout(newHabit: Habit(repeat: Globals.DEFAULT_REPEAT),);
    case ItemType.goal:
      layout = NewGoalScreenLayout();
    case ItemType.todo:
      layout = NewToDoScreenLayout();
    default:
      return;
  }

  Navigator.pop(context);
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => layout)
  );
}