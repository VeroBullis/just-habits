import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime> onChooseDatePressed(BuildContext context) async {
  return await showDialog(
      context: context,
      builder:
          (BuildContext context) => DatePickerDialog(
            firstDate: DateTime.now(), lastDate: DateTime(2100),
          )
  );
}