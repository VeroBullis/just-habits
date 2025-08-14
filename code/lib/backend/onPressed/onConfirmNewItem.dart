import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/backend/model/Repeat.dart';
import 'package:just_habits/backend/model/UserData.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/ReminderTimeLayout.dart';
import 'package:just_habits/layouts/WeekSelectLayout.dart';
import 'package:just_habits/layouts/screens/HomeScreenLayout.dart';
import 'package:just_habits/layouts/screens/NewHabitScreenLayout.dart';

import '../../layouts/dialogues/NumberPickerDialogLayout.dart';
import '../../layouts/screens/AdvancedItemSettingsScreenLayout.dart';
import '../model/Globals.dart';
import '../model/Globals.dart' as Globals;

void onConfirmNewItem(BuildContext context, ItemType type) {

  userData.addHabit(Globals.newItem! as Habit);

  Navigator.push(
    context,
      MaterialPageRoute(builder: (context) => HomeScreenLayout())
  );

  print(userData.habitList);
}