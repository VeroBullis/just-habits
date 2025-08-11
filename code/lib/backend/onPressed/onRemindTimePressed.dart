import 'package:flutter/material.dart';

Future<TimeOfDay?> onRemindTimePressed(BuildContext context) async {
  return await showDialog(
      context: context,
      builder:
          (BuildContext context) => TimePickerDialog(
              initialTime: TimeOfDay(hour: 7, minute: 0))
  );
}