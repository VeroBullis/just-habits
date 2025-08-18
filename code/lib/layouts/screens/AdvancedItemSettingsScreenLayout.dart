import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/onPressed/onChooseDatePressed.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';

import '../../backend/model/Globals.dart' as Globals;

class AdvancedItemSettingsScreenLayout extends StatefulWidget {
  const AdvancedItemSettingsScreenLayout({super.key});

  @override
  _AdvancedItemSettingsScreenState createState() => _AdvancedItemSettingsScreenState();

}

class _AdvancedItemSettingsScreenState extends State<AdvancedItemSettingsScreenLayout> {
  String beginText = "";
  String endText = "";

  //TODO: separate begin/end date selection into separate widget to be made visible based on item type
  //TODO: finalize date selection button labels
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
                    DateTime? selected = await onChooseDatePressed(context, (Globals.newItem! as Habit).startDate);
                    if (selected != null) {
                      (Globals.newItem! as Habit).startDate = selected;
                      setState(() {
                        beginText = getDateText(selected);
                      });
                    }
                    },
                  child: Text(beginText)
              ),
            ],
          ),
          Row(
            children: [
              Text("End on:"),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? selected = await onChooseDatePressed(context, (Globals.newItem! as Habit).endDate);
                    if (selected != null) {
                      (Globals.newItem! as Habit).endDate = selected;
                      setState(() {
                        endText = getDateText(selected);
                      });
                    }
                    },
                  child: Text(endText)
              ),
            ],
          ),
          AdvancedItemSettingsLayout()
        ],
      ),
    );
  }

  String getDateText(DateTime? date) {
    final localizations = MaterialLocalizations.of(context);

    date ??= DateTime.now();

    return localizations.formatCompactDate(date);
  }

}