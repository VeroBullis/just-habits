import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/CategoryLayout.dart';
import 'package:just_habits/layouts/dialogues/CreateNewDialogueLayout.dart';
import 'package:just_habits/layouts/ItemListLayout.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomeScreenLayout extends StatelessWidget{
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
                    CategoryLayout([ItemListLayout()]),
                    ItemListLayout(),
                    ItemListLayout()
                  ],
                ),
                IconButton(onPressed: () => showDialog(
                    context: context,
                    builder:
                    (BuildContext context) => AlertDialog(
                      title: Text("Create New"),
                      actions: [
                        CreateNewDialogueLayout()
                      ],
                    )
                ), icon: Icon(Icons.add))
              ],
            )
        )
    );
  }

  void onPressed() {}
}