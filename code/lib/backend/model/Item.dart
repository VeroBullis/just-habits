import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Repeat.dart';

import 'ItemType.dart';

enum TrackingType {yesNo, counter}
enum TargetType {atLeast, atMost}

class Item {
  ItemType type;
  String title, note;
  Category? category;
  bool? highlight;
  TimeOfDay? remindTime;
  TrackingType? trackingType;
  TargetType? targetType;
  int? target;
  bool? contribute;

  Item({
    required this.type,
    this.title = "",
    this.note = "",
    this.category,
    this.highlight,
    this.remindTime,
    this.trackingType,
    this.target,
    this.contribute
  }) {
    highlight ??= false;
    trackingType ??= TrackingType.yesNo;
    contribute ??= true;
  }

  @override
  String toString() {
    return "$type $title";
  }
}

class Habit extends Item {
  Repeat repeat;
  DateTime? startDate, endDate;

  Habit({
    super.type = ItemType.habit,
    super.title,
    super.note,
    super.category,
    super.highlight,
    super.remindTime,
    super.trackingType,
    super.target,
    super.contribute,
    required this.repeat,
    this.startDate,
    this.endDate
  }) {
    startDate ??= DateTime.now();
  }

}

class Goal extends Item {
  Goal({
    super.type = ItemType.goal,
    super.title,
    super.note,
    super.category,
    super.highlight,
    super.remindTime,
    super.trackingType,
    super.target,
    super.contribute
  });

}

class Todo extends Item {
  Todo({
    super.type = ItemType.todo,
    super.title,
    super.note,
    super.category,
    super.highlight,
    super.remindTime,
    super.trackingType,
    super.target,
    super.contribute
  });

}