import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayWeekMonthMenu extends StatelessWidget {
  Widget? label;

  DayWeekMonthMenu({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        label: label,
        initialSelection: "Days",
        dropdownMenuEntries: [
          DropdownMenuEntry(value: "Days", label: "Days"),
          DropdownMenuEntry(value: "Weeks", label: "Weeks"),
          DropdownMenuEntry(value: "Months", label: "Months"),
        ]
    );
  }

}