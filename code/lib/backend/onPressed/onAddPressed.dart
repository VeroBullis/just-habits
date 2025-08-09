import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_habits/backend/model/ItemType.dart';

import '../../layouts/dialogues/CreateNewDialogueLayout.dart';

void onAddPressed(BuildContext context, ItemType type) {
  showDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
        title: Text("Create New"),
        actions: [
          CreateNewDialogueLayout(type: type,)
        ],
      )
  );
}