import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/onPressed/onChooseDatePressed.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';

import '../../backend/model/Globals.dart' as Globals;

class AdvancedItemSettingsScreenLayout extends StatelessWidget {

  //TODO: separate begin/end date selection into separate widget to be made visible based on item type
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advanced"),
        leading: BackButton()
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Begin on:"),
              ElevatedButton(
                  onPressed: () async {
                    (Globals.newItem! as Habit).startDate = await onChooseDatePressed(context);
                    },
                  child: Text(DateTime.now().toString())
              ),
            ],
          ),
          Row(
            children: [
              Text("End on:"),
              ElevatedButton(
                  onPressed: () async {
                    (Globals.newItem! as Habit).endDate = await onChooseDatePressed(context);
                    },
                  child: Text(DateTime.now().toString())
              ),
            ],
          ),
          AdvancedItemSettingsLayout()
        ],
      ),
    );
  }

}