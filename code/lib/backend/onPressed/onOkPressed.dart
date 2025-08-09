import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/layouts/screens/NewGoalScreenLayout.dart';
import 'package:just_habits/layouts/screens/NewHabitScreenLayout.dart';

import '../../layouts/screens/NewToDoScreenLayout.dart';

void onOkPressed(BuildContext context, ItemType type) {

  Widget layout;

  switch (type) {
    case ItemType.habit:
      layout = NewHabitScreenLayout();
    case ItemType.goal:
      layout = NewGoalScreenLayout();
    case ItemType.todo:
      layout = NewToDoScreenLayout();
  }

  Navigator.pop(context);
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => layout)
  );
}