import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Habit Title"),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.edit)
          ),
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.delete)
          )
        ],
      ),
      body: Column(
        children: [
          Text("Current streak: 5 days"),
          Text("Best streak: 25 days"),
          TableCalendar(
              focusedDay: DateTime.now(), 
              firstDay: DateTime.utc(2020), 
              lastDay: DateTime.utc(2030)
          ),
          Row(
            children: [
              Text("40/50 habits completed"),
              CircularPercentIndicator(radius: 10)
            ],
          )
        ],
      ),
    );
  }

}