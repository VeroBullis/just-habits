import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/layouts/dialogues/ScrollWheelDialogLayout.dart';

class AdvancedItemSettingsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu(
            label: Text("Tracking"),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "Yes/No", label: "Yes/No"),
              DropdownMenuEntry(value: "Counter", label: "Counter")
            ],
        ),
        Row(
            children: [
              DropdownMenu(
                label: Text("Target"),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "At Least", label: "At Least"),
                  DropdownMenuEntry(value: "At Most", label: "At Most")
                ]
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder:
                  (BuildContext context) => AlertDialog(
                    title: Text("Select target"),
                    content: ScrollWheelDialogLayout(),
                      actions: [
                        ElevatedButton(
                            onPressed: () => {
                              Navigator.pop(context)
                            },
                            child: Text("OK"))
                      ]
                  )
                ),
                child: Text("10")
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