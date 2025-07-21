import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemListLayout extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();

}

class _ItemListState extends State<ItemListLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text("Title"),
            Text("Subtitle")
          ],
        ),
        Checkbox(value: false, onChanged: (bool? newValue) {
          setState(() {

          });
        },)
      ],
    );
  }

}

bool onChanged() {
  return true;
}