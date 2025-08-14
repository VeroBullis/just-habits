import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class NumberPickerDialogLayout extends StatelessWidget {
  static int chosenNumber = 1;

  final freq = List<int>.generate(
    7, (i) => (i + 1)
  );


  @override
  Widget build(BuildContext context) {
    chosenNumber = 1;
    return Scaffold(
      body: WheelPicker(
          itemCount: 7,
          builder: (context, index) => Text(freq[index].toString()),
          selectedIndexColor: Colors.blue,
          looping: false,
          onIndexChanged: (int index, WheelPickerInteractionType type) {
            chosenNumber = freq[index];
          },
      )
    );
  }

}