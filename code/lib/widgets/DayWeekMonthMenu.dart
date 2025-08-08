import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayWeekMonthMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        initialSelection: "Days",
        dropdownMenuEntries: [
          DropdownMenuEntry(value: "Days", label: "Days"),
          DropdownMenuEntry(value: "Weeks", label: "Weeks"),
          DropdownMenuEntry(value: "Months", label: "Months"),
        ]
    );
  }

}