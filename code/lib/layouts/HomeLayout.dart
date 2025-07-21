import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/CategoryLayout.dart';
import 'package:just_habits/layouts/ItemListLayout.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomeLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Just Habits"),
          leading: IconButton(onPressed: onPressed, icon: Icon(Icons.menu)),
        ),
        body: Center(
            child: ListView(
              children: [
                Placeholder(),
                Row(
                  children: [
                    ElevatedButton(onPressed: onPressed, child: Text("Habits")),
                    ElevatedButton(onPressed: onPressed, child: Text("Goals")),
                    ElevatedButton(onPressed: onPressed, child: Text("To-Do"))
                  ],
                ),
                LinearPercentIndicator(),
                Column(
                  children: [
                    new CategoryLayout([new ItemListLayout()]),
                    new ItemListLayout(),
                    new ItemListLayout()
                  ],
                ),
                IconButton(onPressed: onPressed, icon: Icon(Icons.add))
              ],
            )
        )
    );
  }

  void onPressed() {}
}