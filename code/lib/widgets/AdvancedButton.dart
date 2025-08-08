import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../layouts/screens/AdvancedItemSettingsScreenLayout.dart';

class AdvancedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdvancedItemSettingsScreenLayout())
          )
        },
        child: Text("Advanced")
    );
  }

}