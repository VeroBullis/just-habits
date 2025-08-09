import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/CategoryLayout.dart';
import 'package:just_habits/layouts/dialogues/CreateNewDialogueLayout.dart';
import 'package:just_habits/layouts/ItemListLayout.dart';
import 'package:just_habits/layouts/screens/SettingsScreenLayout.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomeScreenLayout extends StatelessWidget{
  final controller = MenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Just Habits"),
          leading: MenuAnchor(
            controller: controller,
            builder: (BuildContext context, MenuController controller, Widget? child) {
              return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: Icon(Icons.menu)
              );
            },
            menuChildren: [
                MenuItemButton(
                  child: Text("Settings"),
                  onPressed: () => onSettingsPressed(context),
                ),
              MenuItemButton(
                child: Text("Reorder"),
              ),
              MenuItemButton(
                child: Text("Statistics"),
              ),
              MenuItemButton(
                child: Text("Save/Load Backup"),
              ),
              MenuItemButton(
                child: Text("Support this project :]"),
              )
              ],
          ),
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

  void onSettingsPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreenLayout())
    );
  }
}