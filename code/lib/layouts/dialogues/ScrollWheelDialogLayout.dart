import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class ScrollWheelDialogLayout extends StatelessWidget {

  final freq = List<String>.generate(
    7, (i) => (i + 1).toString()
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WheelPicker(
          itemCount: 7,
          builder: (context, index) => Text(freq[index]),
          selectedIndexColor: Colors.blue,
          looping: false
      )
    );
  }

}