import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/AdvancedItemSettingsLayout.dart';
import 'package:just_habits/layouts/MonthSelectLayout.dart';

class AdvancedItemSettingsScreenLayout extends StatelessWidget {
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
                  onPressed: () => showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                        title: Text("Select Start Date"),
                        content: Scaffold(
                          body: MonthSelectLayout(),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () => {
                                Navigator.pop(context)
                              },
                              child: Text("OK"))
                        ],
                      )),
                  child: Text(DateTime.now().toString())
              ),
            ],
          ),
          Row(
            children: [
              Text("End on:"),
              ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                        title: Text("Select Start Date"),
                        content: Scaffold(
                          body: MonthSelectLayout(),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () => {
                                Navigator.pop(context)
                              },
                              child: Text("OK"))
                        ],
                      )),
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