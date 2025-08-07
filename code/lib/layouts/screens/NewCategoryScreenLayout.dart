import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/NewHeaderLayout.dart';

class NewCategoryScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewHeaderLayout(),
          ExpansionTile(
              title: Text("Add items to category")
          )
        ],
      ),
    );
  }

  void onPressed() {

  }

}