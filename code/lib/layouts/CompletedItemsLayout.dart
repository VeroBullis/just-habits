import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/widgets/DayWeekMonthMenu.dart';

class CompletedItemsLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompletedItemsState();

}

enum Choice {completion, after}

class _CompletedItemsState extends State<CompletedItemsLayout> {
  Choice? _choice = Choice.completion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text("Hide completed items"),
        ),
        RadioListTile(
            title: Text("On completion"),
            value: Choice.completion,
            groupValue: _choice,
            onChanged: (Choice? value) {
              setState(() {
                _choice = value;
              });
            }
        ),
        RadioListTile(
            title: Row(
              children: [
                Text("After"),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("1")
                ),
                DayWeekMonthMenu()
              ],
            ),
            value: Choice.after,
            groupValue: _choice,
            onChanged: (Choice? value) {
              setState(() {
                _choice = value;
              });
            }
        )
      ],
    );
  }

}