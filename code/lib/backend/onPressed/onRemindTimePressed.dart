import 'package:flutter/material.dart';

import '../model/Globals.dart' as Globals;

Future<TimeOfDay?> onRemindTimePressed(BuildContext context) async {
  return await showDialog(
      context: context,
      builder:
          (BuildContext context) => TimePickerDialog(
              initialTime: Globals.newItem!.remindTime!)
  );
}