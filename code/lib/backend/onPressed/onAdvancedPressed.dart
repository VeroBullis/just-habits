import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';

import '../../layouts/screens/AdvancedItemSettingsScreenLayout.dart';

void onAdvancedPressed(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdvancedItemSettingsScreenLayout()
      )
  );
}