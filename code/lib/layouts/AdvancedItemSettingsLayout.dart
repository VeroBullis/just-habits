import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/dialogues/NumberPickerDialogLayout.dart';

import '../backend/model/Globals.dart' as Globals;
import '../backend/model/Item.dart';

class AdvancedItemSettingsLayout extends StatefulWidget {
  // static TrackingType? trackingType = TrackingType.yesNo;
  // static TargetType? targetType;
  // static int? target = 1;
  // static bool? contribute = true;

  @override
  State<StatefulWidget> createState() => _AdvancedItemSettingsState();

}

class _AdvancedItemSettingsState extends State<AdvancedItemSettingsLayout> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu(
            label: Text("Tracking"),
            initialSelection: TrackingType.yesNo,
            dropdownMenuEntries: [
              DropdownMenuEntry(value: TrackingType.yesNo, label: "Yes/No"),
              DropdownMenuEntry(value: TrackingType.counter, label: "Counter")
            ],
          onSelected: (TrackingType? selected) {
              Globals.newItem!.trackingType = selected;
          },
        ),
        Row(
            children: [
              DropdownMenu(
                label: Text("Target"),
                initialSelection: TargetType.atLeast,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: TargetType.atLeast, label: "At Least"),
                  DropdownMenuEntry(value: TargetType.atMost, label: "At Most")
                ],
                onSelected: (TargetType? selected) {
                  Globals.newItem!.targetType = selected;
                },
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder:
                  (BuildContext context) => AlertDialog(
                    title: Text("Select target"),
                    content: NumberPickerDialogLayout(),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Globals.newItem!.target = NumberPickerDialogLayout.chosenNumber;
                                Navigator.pop(context);
                              });
                            },
                            child: Text("OK"))
                      ]
                  )
                ),
                child: Text(Globals.newItem!.target.toString())
              )
          ]
        ),
        SwitchListTile(
            title: Text("Contribute to total complete"),
            subtitle: Text("If disabled, this item will not be counted towards overall item progress."),
            value: true,
            onChanged: (bool? value) {}
        )
      ],
    );
  }

}