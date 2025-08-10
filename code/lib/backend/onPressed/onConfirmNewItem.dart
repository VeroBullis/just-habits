import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/backend/model/UserData.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/screens/HomeScreenLayout.dart';

import '../../layouts/screens/AdvancedItemSettingsScreenLayout.dart';

void onConfirmNewItem(BuildContext context, ItemType type) {
  String title = NewHeaderLayout.title;

  Habit newHabit = Habit(type, title, "note", "category", false);
  userData.addHabit(newHabit);

  Navigator.push(
    context,
      MaterialPageRoute(builder: (context) => HomeScreenLayout())
  );
}