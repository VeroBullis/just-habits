import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/screens/StatisticsScreen.dart';

import '../backend/model/Item.dart';

class ItemListLayout extends StatefulWidget {
  final Item item;

  const ItemListLayout({super.key, required this.item});

  @override
  _ItemListState createState() => _ItemListState(item);

}

class _ItemListState extends State<ItemListLayout> {
  Item item;

  _ItemListState(this.item);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {},
        onLongPress: () => onLongPress(context),
        child: Row(
          children: [
            Column(
              children: [
                  Text(item.title),
                Text(item.note)
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