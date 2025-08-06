import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class DaySelectLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: onPressed,
            child: Text("1")
        ),
        Text("Every day")
      ],
    );
  }

  void onPressed() {
    //TODO: open dialogue to select day frequency
  }

}