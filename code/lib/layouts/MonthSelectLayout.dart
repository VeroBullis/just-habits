import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthSelectLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(DateTime.now().year, DateTime.now().month, 1),
          lastDay: DateTime.utc(DateTime.now().year, DateTime.now().month, 31)
        ),
        Text("Every month on the 1")
      ]
    );
  }

}