import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Globals.dart' as Globals;
import '../model/Item.dart';

Future<DateTime?> onChooseDatePressed(BuildContext context, DateTime? initialDate) async {
  return await showDialog(
      context: context,
      builder:
          (BuildContext context) => DatePickerDialog(
            initialDate: initialDate,
            firstDate: DateTime.now(), lastDate: DateTime(2100),
          )
  );
}