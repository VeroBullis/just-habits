import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Repeat.dart';

import 'ItemType.dart';

enum TrackingType {yesno, counter}

class Item {
  ItemType type;
  String title, note;
  Category? category;
  bool? highlight;
  TimeOfDay? remindTime;
  TrackingType? trackingType;
  int? target;
  bool? contribute;

  Item({
    required this.type,
    required this.title,
    required this.note,
    this.category,
    this.highlight,
    this.remindTime,
    this.trackingType,
    this.target,
    this.contribute
  }) {
    highlight ??= false;
    trackingType ??= TrackingType.yesno;
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
    required super.type,
    required super.title,
    required super.note,
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
    required super.type,
    required super.title,
    required super.note,
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
    required super.type,
    required super.title,
    required super.note,
    super.category,
    super.highlight,
    super.remindTime,
    super.trackingType,
    super.target,
    super.contribute
  });

}