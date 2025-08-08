import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/screens/StatisticsScreen.dart';

class ItemListLayout extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();

}

class _ItemListState extends State<ItemListLayout> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        onLongPress: () => onLongPress(context),
        child: Row(
          children: [
            Column(
              children: [
                  Text("Title"),
                Text("Subtitle")
              ],
            ),
              Checkbox(value: false, onChanged: (bool? newValue) {
                setState(() => {});
                },
              )
          ],
        )
    );
  }

  void onLongPress(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StatisticsScreen())
    );
  }

}

bool onChanged() {
  return true;
}