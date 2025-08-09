import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layouts/screens/SettingsScreenLayout.dart';

void onSettingsPressed(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreenLayout())
  );
}