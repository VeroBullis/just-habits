import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/ItemListLayout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryLayout extends StatelessWidget {
  List<Widget> children;

  CategoryLayout(this.children, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row( children: [
        Padding(
          padding: EdgeInsets.all(10),
        child: CircularPercentIndicator(radius: 10)),
        Text("Category Title"),
        IconButton(onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_down))
      ],),
      Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Column(children: children))
    ]
    );
  }

  void onPressed() {

  }

}