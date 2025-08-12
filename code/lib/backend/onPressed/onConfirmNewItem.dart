import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/model/ItemType.dart';
import 'package:just_habits/backend/model/Repeat.dart';
import 'package:just_habits/backend/model/UserData.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';
import 'package:just_habits/layouts/ReminderTimeLayout.dart';
import 'package:just_habits/layouts/WeekSelectLayout.dart';
import 'package:just_habits/layouts/screens/HomeScreenLayout.dart';
import 'package:just_habits/layouts/screens/NewHabitScreenLayout.dart';

import '../../layouts/dialogues/NumberPickerDialogLayout.dart';
import '../../layouts/screens/AdvancedItemSettingsScreenLayout.dart';

void onConfirmNewItem(BuildContext context, ItemType type) {
  String title = NewHeaderLayout.title;
  String note = NewItemLayout.note;
  bool highlight = NewItemLayout.highlight;
  TimeOfDay? remindTime = ReminderTimeLayout.remindTime;
  TrackingType? trackingType = AdvancedItemSettingsScreenLayout.trackingType;
  int? target = AdvancedItemSettingsScreenLayout.target;
  bool? contribute = AdvancedItemSettingsScreenLayout.contribute;
  DateTime? startDate = AdvancedItemSettingsScreenLayout.startDate;
  DateTime? endDate = AdvancedItemSettingsScreenLayout.endDate;
  RepeatInterval? interval = NewHabitScreenLayout.repeatInterval;
  Set<int> selection;

  switch (interval) {
    case RepeatInterval.day:
      selection = {NumberPickerDialogLayout.chosenNumber};
    case RepeatInterval.week:
      selection = WeekSelectLayout.selection;
    case RepeatInterval.month:
      selection = MonthSelectLayout.selection;
  }

  Habit newHabit = Habit(
      type: type,
      title: title,
      note: note,
      highlight: highlight,
      remindTime: remindTime,
      trackingType: trackingType,
      target: target,
      contribute: contribute,
      repeat: Repeat(interval, selection),
      startDate: startDate,
      endDate: endDate
  );
  userData.addHabit(newHabit);

  Navigator.push(
    context,
      MaterialPageRoute(builder: (context) => HomeScreenLayout())
  );

  print(userData.habitList);
}