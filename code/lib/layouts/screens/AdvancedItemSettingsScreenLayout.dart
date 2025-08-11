import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/onPressed/onChooseDatePressed.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';

class AdvancedItemSettingsScreenLayout extends StatelessWidget {
  static TrackingType? trackingType = TrackingType.yesno;
  static int? target;
  static bool? contribute = true;
  static DateTime? startDate, endDate;

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
                    startDate = await onChooseDatePressed(context);
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
                    endDate = await onChooseDatePressed(context);
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