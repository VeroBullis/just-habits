import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';
import 'package:just_habits/layouts/NewItemLayout.dart';

class NewGoalScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewItemLayout(),
          Row(
            children: [
              Text("Complete by"),
              ElevatedButton(
                  onPressed: () => onPressed(context),
                  child: Text(DateTime.now().toString())
              )
            ],
          )
        ],
      ),
    );
  }

  void onPressed(BuildContext context) {

  }

}