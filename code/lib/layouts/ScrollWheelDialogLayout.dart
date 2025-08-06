import 'package:flutter/cupertino.dart';
import 'package:wheel_picker/wheel_picker.dart';

class ScrollWheelDialogLayout extends StatelessWidget {

  static const freq = ["1", "2", "3", "4", "5", "6", "7"];

  @override
  Widget build(BuildContext context) {
    return WheelPicker(
      itemCount: 7,
      builder: (context, index) => Text(freq[index]),
      looping: false,
    );
  }

}