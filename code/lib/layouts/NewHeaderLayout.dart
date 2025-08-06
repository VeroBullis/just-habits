import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewHeaderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)
            ),
            Text("New Item"),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check)
            )
          ],
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Title"
          ),
        )
      ],
    );
  }

}