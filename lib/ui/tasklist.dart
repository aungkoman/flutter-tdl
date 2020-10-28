import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tasklist extends StatelessWidget {
  var textStyle = TextStyle(fontSize: 24, );
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          listView,
          listItem,
          bottomNavigation,
        ] // Column-children
    );
  }

  final listItem = Row(
        children: [
          Text("listItem"),
          Text("listItem2"),
        ]
  );

  var listView = Column(
    children: [
      Text("list view")
    ],
  );
  var bottomNavigation = Row(
    children: [
      Text("Bottom Navigation")
    ],
  );


}
