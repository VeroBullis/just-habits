import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/CompletedItemsLayout.dart';

class SettingsScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: BackButton(),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Text("App theme"),
              DropdownMenu(
                  initialSelection: "Light",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Light", label: "Light"),
                    DropdownMenuEntry(value: "Dark", label: "Dark")
                  ]
              )
            ],
          ),
          Row(
            children: [
              Text("First day of the week"),
              DropdownMenu(
                  initialSelection: "Sun",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Sun", label: "Sun"),
                    DropdownMenuEntry(value: "Mon", label: "Mon")
                  ]
              )
            ],
          ),
          Text("Streaks"),
          SwitchListTile(
              value: false,
              onChanged: (value) {},
              title: Text("Pause streak"),
          ),
          Row(
            children: [
              Text("Grace period"),
              ElevatedButton(
                  onPressed: () {}, 
                  child: Text("0")
              ),
              Text("days")
            ],
          ),
          Text("Amount of days before streak reset"),
          Row(
            children: [
              Text("Completion percentage"),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("90")
              ),
              Text("%")
            ],
          ),
          Text("If at least 90% of a day's habits are completed, that day will be marked as complete"),
          Text("Completed Items"),
          CompletedItemsLayout(),
          CompletedItemsLayout(),
          CompletedItemsLayout()
        ],
      ),
    );
  }

}